import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({
    super.key,
    required this.latlong,
  });
  final LatLng latlong;

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
   late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  String? _currentAddress; // This will store the location name
  LatLng? _initialPosition; // Store the selected position

  @override
  void initState() {
    super.initState();
    googlePlace = GooglePlace("AIzaSyCJwTwi86cJb6n9msbu9TQrrSKC1UjHQXY");
    _initialPosition = widget.latlong;
    _getAddressFromLatLng(_initialPosition!);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Function to fetch the address using reverse geocoding
  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred while fetching location: $e')),
      );
    }
  }

   Future<void> _searchPlace(String query) async {
    var result = await googlePlace.autocomplete.get(query);
    if (result != null && result.predictions != null) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

   void _selectPlace(AutocompletePrediction prediction) async {
    var details = await googlePlace.details.get(prediction.placeId!);
    if (details != null && details.result != null) {
      var location = details.result!.geometry!.location;
      setState(() {
        _initialPosition = LatLng(location!.lat!, location.lng!);
        predictions.clear();
      });
      mapController.animateCamera(CameraUpdate.newLatLng(_initialPosition!));
      _getAddressFromLatLng(_initialPosition!);
    }
  }

  // Function to handle tap on the map and update the selected position
  void _onMapTapped(LatLng position) {
    setState(() {
      _initialPosition = position;
    });
    _getAddressFromLatLng(position); // Get the address for the new location
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select the Location'),
      ),
      body: Column(
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by company name...',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _searchPlace(value);
                } else {
                  setState(() {
                    predictions.clear();
                  });
                }
              },
            ),
          ),
          Expanded(
            child: predictions.isNotEmpty
                ? ListView.builder(
                    itemCount: predictions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(predictions[index].description!),
                        onTap: () => _selectPlace(predictions[index]),
                      );
                    },
                  )
                :GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: MapType.normal,
              
              trafficEnabled: false,
              buildingsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _initialPosition!,
                zoom: 10.0,
              ),
              markers: {
              
                  Marker(
                    markerId: const MarkerId('selectedMarker'),
                    position: _initialPosition!,
                    infoWindow: InfoWindow(
                      title: _currentAddress ?? '',
                    ),
                  ),
              },
              onTap: _onMapTapped, // Detect taps on the map
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Pass the selected location back to the previous screen
                Navigator.pop(context, _initialPosition);
              },
              child: const Text('Select this location'),
            ),
          ),
        ],
      ),
    );
  }
}
