import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendTestEmail() async {
  const serviceId = 'service_wbosgmo';
  const templateId = 'template_xmk6jt7';
  const userId = 'PaRjcm0qY0qHgdecr'; // Replace with your EmailJS public key

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

  final response = await http.post(
    url,
    headers: {'origin': 'http://localhost', 'Content-Type': 'application/json'},
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_email': 'muno.gwata@gmail.com',
        'user_name': 'Muno',
        'message': 'This is a test email from Flutter using EmailJS.',
      },
    }),
  );

  if (response.statusCode == 200) {
    print('✅ Email sent successfully!');
  } else {
    print('❌ Failed to send email: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
