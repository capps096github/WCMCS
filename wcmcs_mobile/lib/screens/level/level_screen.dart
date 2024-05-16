import '../../wcmcs_exporter.dart';

/// This is the water level screen
class LevelScreen extends StatelessWidget {
  /// [LevelScreen] constructor
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// water level screen
    return ListView(
      padding: horizontalPadding16,
      children: [
        const Spacing(of: spacing2),
        const BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: 'Hey Cephas',
            color: wcmcsColor,
            fontSize: 30,
          ),
          description: 'Welcome back to Water Warden',
        ),
        const Spacing(of: spacing32),
        const BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: 'WATER LEVEL',
            color: wcmcsColor,
            fontSize: 30,
          ),
          description: 'This is the current amount of water left in your tank',
        ),
        const Spacing(of: spacing8),
        Container(
          //radius of the container
          decoration: const BoxDecoration(
            borderRadius: borderRadius8,
            color: wcmcsColor,
          ),

          height: 100,
          width: 100,
          child: const Center(
            child: Text(
              '(2000 l)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const Spacing(
          of: 20,
        ),
        const BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: 'WATER CONSUMED',
            color: wcmcsColor,
            fontSize: 30,
          ),
          description:
              'This displays the water consumed per each section in the building',
        ),
        const Spacing(
          of: 10,
        ),

         const Spacing(of: spacing8),
        Container(
          //radius of the container
          decoration: const BoxDecoration(
            borderRadius: borderRadius8,
            color:Colors.red,
          ),

          height: 100,
          width: 100,
          child: const Center(
            child: Text(
              'Section A 1000l',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
       
        const Spacing(of: spacing8),
        Container(
          //radius of the container
          decoration:  BoxDecoration(
            borderRadius: borderRadius8,
            color: Colors.amber[900],
          ),

          height: 100,
          width: 100,
          child: const Center(
            child: Text(
              'Section B 700ml',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const Spacing(
          of: 30,
        ),
        const BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: 'FETCH WATER',
            color: wcmcsColor,
            fontSize: 30,
          ),
          description:
              'You can add in more water in your tank just incase you want to keep it full',
        ),
        const Spacing(
          of: 10,
        ),
        const HomeTile(
          title: 'Open Tap',
          tileColor: wcmcsGreen,
          icon: Icons.lock,
        ),
        //boxes for the water consumed per section
        
      
      ],
    );
  }
}
