import '../../../app_exporter.dart';

/// This is a custom clipper for the profile screen
class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(
        0,
        size.height - 20,
      )

      /// Move to the bottom-left corner of the container
      ..quadraticBezierTo(
        size.width / 2,
        size.height + 20,
        size.width,
        size.height - 20,
      )

      /// Draw the convex curve to the bottom-right corner
      ..lineTo(size.width, 0)

      /// Line to the top-right corner
      ..close();

    /// Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
