import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsr_xd/presentation/nav_bar.dart';
import 'package:wsr_xd/presentation/timer_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();
  var markerMap = <String, String>{};

  final mapController = MapController(
    initMapWithUserPosition: const UserTrackingOption(enableTracking: true),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: FloatingActionButton(
          onPressed: () {
            globalKey.currentState?.openDrawer();
          },
          backgroundColor: const Color(0xFF2C3043),
          child: const Icon(Icons.menu),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      drawer: const NavBar(),
      body: OSMFlutter(
        onMapIsReady: (isReady) async {
            var position1 = GeoPoint(latitude: 37.42307124980108, longitude: -122.08293097359794);
            var position2 = GeoPoint(latitude: 37.420922425081564, longitude: -122.085326058524);
            var position3 = GeoPoint(latitude: 37.41857228032002, longitude: -122.08293097359794);
            await mapController.addMarker(position1, markerIcon: MarkerIcon(
              assetMarker: AssetMarker(image: const AssetImage("assets/images/yellow_car.png"), scaleAssetImage: 0.5),
            ));
            await mapController.addMarker(position2, markerIcon: MarkerIcon(
              assetMarker: AssetMarker(image: const AssetImage("assets/images/yellow_car.png"), scaleAssetImage: 0.5),
            ));
            await mapController.addMarker(position3, markerIcon: MarkerIcon(
              assetMarker: AssetMarker(image: const AssetImage("assets/images/yellow_car.png"), scaleAssetImage: 0.5),
            ));
            var key1 = "${position1.latitude}_${position1.longitude}";
            markerMap[key1] = markerMap.length.toString();
            var key2 = "${position2.latitude}_${position2.longitude}";
            markerMap[key2] = markerMap.length.toString();
            var key3 = "${position3.latitude}_${position3.longitude}";
            markerMap[key3] = markerMap.length.toString();
        },
            controller: mapController,
            initZoom: 16,
            maxZoomLevel: 18,
            minZoomLevel: 8,
        onGeoPointClicked: (geoPoint) {
          var key = "${geoPoint.latitude}_${geoPoint.longitude}";
          showModalBottomSheet(
              context: context,
              backgroundColor: const Color(0xFF2A2E43),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 101,
                        height: 76,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF353A50)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/kia_icon.png"),
                            const SizedBox(height: 10,),
                            Text("Kia Rio", style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.white.withOpacity(0.5)),)
                          ],
                        ),
                      ),
                      Container(
                        width: 101,
                        height: 76,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF353A50)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/metr_icon.png"),
                            const SizedBox(height: 10,),
                            Text("1.5 km", style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.white.withOpacity(0.5)),)
                          ],
                        ),
                      ),
                      Container(
                        width: 101,
                        height: 76,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF454F63)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/people_icon.png"),
                            const SizedBox(height: 10,),
                            Text("5 min - free", style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.white.withOpacity(0.5)),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 20),
                  child: Text("Price:", style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 101,
                        height: 76,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFFFB900)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Minute", style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.white)),
                            const SizedBox(height: 10,),
                            Text("1 min - \$1", style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.white),)
                          ],
                        ),
                      ),
                      Container(
                        width: 101,
                        height: 76,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF353A50)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hour", style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.white)),
                            const SizedBox(height: 10,),
                            Text("60 min - \$50", style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.white.withOpacity(0.5)),)
                          ],
                        ),
                      ),
                      Container(
                        width: 101,
                        height: 76,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF353A50)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Day", style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.white)),
                            const SizedBox(height: 10,),
                            Text("1440 min - \$30", style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.white.withOpacity(0.5)),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 60,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: 327,
                      height: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFB900),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                              )
                          ),
                          child: Text(
                            "BOOK",
                            style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
                          )),
                    ),
                  ),
                )
              ],
            );
          });
        },
          )
    );
  }
}
