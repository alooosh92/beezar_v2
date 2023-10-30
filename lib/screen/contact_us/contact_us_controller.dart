import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContactUsController extends GetxController {
  String email = "info@arg-tr.com";
  String possword = "beezar2023";
  String host = "sxb1plzcpnl490364.prod.sxb1.secureserver.net";
  int port = 465;

  void sendEmail(
    String from,
    String subject,
    String text,
  ) async {
    SmtpServer smtpServer = SmtpServer(
      host,
      username: email,
      password: possword,
      port: port,
    );
    Message message = Message();
    message.from = from;
    message.recipients.add(email);
    message.subject = subject;
    message.text = text;
    try {
      final report = await send(message, smtpServer);
      print('Message sent: ' + report.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
