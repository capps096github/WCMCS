import '../../../app_exporter.dart';
import 'home_card_item.dart';

/// home card items model
final List<HomeCardItem> homeCardItems = [
//  manage water
  HomeCardItem(
    label: 'Manage and Control Your Water Sections',
    description: 'Get real-time updates, conrol and manage your water usage',
    imageUrl:
        'https://images.unsplash.com/photo-1542013936693-884638332954?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    screenPath: managePath,
  ),
  // tank
  HomeCardItem(
    label: 'View Water Tank Levels',
    description: 'Check the water levels in your tank',
    imageUrl:
        'https://images.unsplash.com/photo-1579908195863-2a7b4307a8cf?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    screenPath: tankPath,
  ),
  // view tips
  HomeCardItem(
    label: 'View water usage tips and tricks',
    description: 'The best ways to save water and reduce your bill',
    imageUrl:
        'https://images.unsplash.com/photo-1578450671530-5b6a7c9f32a8?q=80&w=1635&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    screenPath: tipsPath,
  ),
  // contact us
  HomeCardItem(
    label: 'Get in touch with us',
    description: 'Need help? Contact us for support',
    imageUrl:
        'https://images.unsplash.com/photo-1582586483389-d0ee8d81a800?q=80&w=1635&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    onTap: () async {
      final launchUri = Uri(
        scheme: 'tel',
        path: '+256 758294212',
      );
      await launchUrl(launchUri);
    },
  ),
];
