
import 'package:eventxandroid/api/payment_api.dart';
import 'package:eventxandroid/models/past_events/past_events.dart';
import 'package:eventxandroid/models/payment/payment_details.dart';

class PaymentRepository {
  Future<bool> postTransaction(PaymentDetails paymentDetails) async {
    return PaymentAPI().postTransaction(paymentDetails);
  }

  Future<List<PastEvents?>> loadPastEvents() async {
    return PaymentAPI().loadPastEvents();
  }
}
