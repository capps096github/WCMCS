import '../../../app_exporter.dart';
import 'home_card_item.dart';

/// home card items model
final List<HomeCardItem> homeCardItems = [
//  manage water
  HomeCardItem(
    label: 'Manage Your Water with Ease',
    description: 'Get real-time updates on your water usage',
    imageUrl:
        'https://images.unsplash.com/photo-1542013936693-884638332954?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    screenPath: managePath,
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
    onTap: () {
      linkLauncher('tel:+256 758294212');
    },
  ),
];
