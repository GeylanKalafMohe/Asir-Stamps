import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/popular_place.dart';
import '../../../utils/app_colors.dart';

class AsirMap extends StatefulWidget {
  final List<PopularPlace> places;

  const AsirMap({super.key, required this.places});

  @override
  State<AsirMap> createState() => _AsirMapState();
}

class _AsirMapState extends State<AsirMap> {
  final MapController _mapController = MapController();
  List<Marker> _markers = [];
  List<Polygon> _polygons = [];

  // Asir region center coordinates (Abha)
  static const LatLng _asirCenter = LatLng(18.2164, 42.5053);

  // Asir region boundary (approximate)
  static const List<LatLng> _asirBoundary = [
    LatLng(19.5, 41.5), // Northwest
    LatLng(19.5, 43.5), // Northeast
    LatLng(17.0, 43.5), // Southeast
    LatLng(17.0, 41.5), // Southwest
  ];

  @override
  void initState() {
    super.initState();
    _createMarkers();
    _createPolygons();
    _animateToMarkers();
  }

  LatLng _calculateCenter() {
    if (widget.places.isEmpty) return _asirCenter;

    final latitudes = widget.places.map((p) => p.coordinates.latitude).toList();
    final longitudes = widget.places
        .map((p) => p.coordinates.longitude)
        .toList();

    final centerLat = latitudes.reduce((a, b) => a + b) / latitudes.length;
    final centerLng = longitudes.reduce((a, b) => a + b) / longitudes.length;

    return LatLng(centerLat, centerLng);
  }

  void _animateToMarkers() async {
    // Calculate bounds for all markers
    if (_markers.isNotEmpty) {
      final latitudes = _markers.map((m) => m.point.latitude).toList();
      final longitudes = _markers.map((m) => m.point.longitude).toList();

      final minLat = latitudes.reduce((a, b) => a < b ? a : b);
      final maxLat = latitudes.reduce((a, b) => a > b ? a : b);
      final minLng = longitudes.reduce((a, b) => a < b ? a : b);
      final maxLng = longitudes.reduce((a, b) => a > b ? a : b);

      final centerLat = (minLat + maxLat) / 2;
      final centerLng = (minLng + maxLng) / 2;
      final targetLocation = LatLng(centerLat, centerLng);

      // Ultra-smooth animated zoom with minimal steps
      final zoomSteps = <double>[];
      for (double zoom = 7.6; zoom <= 9.0; zoom += 0.1) {
        zoomSteps.add(zoom);
      }

      Future.delayed(Duration(milliseconds: 1000), () {
        for (int i = 0; i < zoomSteps.length; i++) {
          Future.delayed(Duration(milliseconds: 100 * (i + 1)), () {
            _mapController.moveAndRotate(targetLocation, zoomSteps[i], 0.0);
          });
        }
      });
    }
  }

  void _createPolygons() {
    // Create grey overlay for areas outside Asir region
    const worldBounds = [
      LatLng(25, 35), // Far northwest
      LatLng(25, 50), // Far northeast
      LatLng(10, 50), // Far southeast
      LatLng(10, 35), // Far southwest
    ];

    _polygons = [
      // Grey overlay with hole for Asir region
      Polygon(
        points: worldBounds,
        holePointsList: [_asirBoundary],
        color: Colors.grey.withValues(alpha: 0.4),
        borderColor: Colors.transparent,
        borderStrokeWidth: 0,
      ),
      // Asir region highlight with stroke
      Polygon(
        points: _asirBoundary,
        color: Colors.transparent,
        borderColor: AppColors.primary,
        borderStrokeWidth: 3,
      ),
    ];
  }

  void _createMarkers() {
    _markers = widget.places.map((place) {
      LinearGradient getStampGradient(String? stampType) {
        switch (stampType ?? 'bronze') {
          case 'gold':
            return AppColors.stampGoldGradient;
          case 'silver':
            return AppColors.stampSilverGradient;
          case 'bronze':
            return AppColors.stampBronzeGradient;
          default:
            return AppColors.stampBronzeGradient;
        }
      }

      return Marker(
        point: place.coordinates,
        width: 200,
        height: 60,
        child: GestureDetector(
          onTap: () async {
            if (place.googleMapsLink != null) {
              final uri = Uri.parse(place.googleMapsLink!);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('لا يمكن فتح الخريطة لـ ${place.title}'),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              }
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${place.title} - ${place.subtitle}'),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            }
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  place.title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  gradient: getStampGradient(place.stampType),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: _calculateCenter(),
        initialZoom: 7.5,
        minZoom: 5.0,
        maxZoom: 18.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.asirstamps.app',
        ),
        PolygonLayer(polygons: _polygons),
        MarkerLayer(markers: _markers),
      ],
    );
  }
}
