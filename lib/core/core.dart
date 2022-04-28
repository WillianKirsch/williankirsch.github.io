import 'package:url_launcher/url_launcher.dart';

export './constants.dart';
export './images.dart';

void goToUrl(String url) async {
  final Uri _uri = Uri.parse(url);
  await goToUri(_uri);
}

Future goToUri(Uri uri) async {
  if (!await launchUrl(uri)) throw 'Could not launch $uri';
}
