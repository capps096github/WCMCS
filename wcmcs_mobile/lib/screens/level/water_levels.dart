import 'package:flutter/cupertino.dart';

import '../../wcmcs_exporter.dart';

class WaterLevels extends StatelessWidget {
  const WaterLevels({super.key});

  @override
  Widget build(BuildContext context) {
    /// water level screen
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Center(
              child: Column(
                children: [
                  Icon(Icons.house_rounded),
                  Text(
                    "Hey User",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome back to the WCMC system",
                  ),
                ],
              ),
            ),
            const Text(
              "WATER LEVEL",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("This is the current amount of water left in your tank"),
            const SizedBox(
              height: 20,
            ),
            Container(
              //radius of the container
              decoration: const BoxDecoration(
                borderRadius: borderRadius8,
                color: Colors.blue,
              ),

              height: 250,
              width: 250,
              child: const Center(
                child: Text(
                  "(1000 l)",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "FETCH WATER",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
                "You can add in more water in your tank just incase you want to keep it full"),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              shape: RoundedRectangleBorder(borderRadius: borderRadius8),
              leading: Icon(Icons.lock, color: Colors.white),
              title: Center(
                child: Text(
                  "Open Tap",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              tileColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
