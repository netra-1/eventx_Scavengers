import 'package:eventx/api/payment_api.dart';
import 'package:eventx/models/past_events/past_events.dart';
import 'package:eventx/models/payment/payment_details.dart';

class PaymentRepository {
  Future<bool> postTransaction(PaymentDetails paymentDetails) async {
    return PaymentAPI().postTransaction(paymentDetails);
  }

  Future<List<PastEvents?>> loadPastEvents() async {
    return PaymentAPI().loadPastEvents();
  }
}
