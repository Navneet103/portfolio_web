import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchEmail(String email, {String subject = ''}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: subject.isNotEmpty ? 'subject=${Uri.encodeComponent(subject)}' : null,
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch email to $email');
    }
  }

  static Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(phoneLaunchUri)) {
      throw Exception('Could not launch phone $phoneNumber');
    }
  }
}
