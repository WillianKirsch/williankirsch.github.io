import 'package:url_launcher/url_launcher.dart';

export './constants.dart';
export './images.dart';

Future<void> goToUrl(String url) async {
  final Uri uri = Uri.parse(url);
  await goToUri(uri);
}

Future goToUri(Uri uri) async {
  if (!await launchUrl(uri)) throw 'Could not launch $uri';
}
