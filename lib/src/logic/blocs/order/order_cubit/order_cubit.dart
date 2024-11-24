import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_amazon_clone_bloc/src/data/models/user.dart';
import 'package:flutter_amazon_clone_bloc/src/data/repositories/payment.dart';
import 'package:flutter_amazon_clone_bloc/src/data/repositories/user_repository.dart';
import 'package:pay/pay.dart';

part 'order_state.dart';

enum PayStatus { failed, success, cancelled }

class OrderCubit extends Cubit<OrderState> {
  final UserRepository userRepository;
  final EventChannel eventChannel =
      const EventChannel('flutter.native/eventPayOrder');
  static const MethodChannel platform =
      MethodChannel('flutter.native/channelPayOrder');

  OrderCubit(this.userRepository) : super(OrderInitialS());

  Future<PayStatus> _pay(String zpTransToken) async {
    String response = "";
    PayStatus? status;
    try {
      status = await _callPayOrderFromNative(zpTransToken);
      switch (status) {
        case PayStatus.cancelled:
          response = "User Huỷ Thanh Toán";
          break;
        case PayStatus.success:
          response = "Thanh toán thành công";
          break;
        case PayStatus.failed:
          response = "Thanh toán thất bại, vui lòng thử lại";
          break;
        default:
          response = "Thanh toán thất bại, vui lòng thử lại";
          break;
      }
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
      response = "Thanh toán thất bại";
      status = PayStatus.failed;
    }
    return status;
  }

  Future<PayStatus> _callPayOrderFromNative(String zpTransToken) async {
    final result =
        await platform.invokeMethod('payOrder', {"zptoken": zpTransToken});
    switch (result['errorCode']) {
      case 4:
        return PayStatus.cancelled;
      case 1:
        return PayStatus.success;
      case -1:
        return PayStatus.failed;
      default:
        return PayStatus.failed;
    }
  }

  void addPaymentItem({required String totalAmount}) async {
    try {
      List<PaymentItem> paymentItemList = [];
      User user;

      paymentItemList.add(PaymentItem(
          amount: totalAmount,
          label: 'Total Amount',
          status: PaymentItemStatus.final_price));

      user = await userRepository.getUserData();

      emit(OrderProcessS(paymentItems: paymentItemList, user: user));
    } catch (e) {
      emit(OrderErrorS(errorString: e.toString()));
    }
  }

  void gPayButton({required String totalAmount}) async {
    try {
      List<PaymentItem> paymentItemList = [];
      User user;

      paymentItemList.add(PaymentItem(
          amount: totalAmount,
          label: 'Total Amount',
          status: PaymentItemStatus.final_price));

      user = await userRepository.getUserData();

      if (user.address == '') {
        emit(DisableButtonS());
      } else {
        emit(OrderProcessS(paymentItems: paymentItemList, user: user));
      }
    } catch (e) {
      emit(OrderErrorS(errorString: e.toString()));
    }
  }

  Future<User> getUserData() async {
    User user;

    user = await userRepository.getUserData();

    return user;
  }

  Future<bool> placeOrder(
      {required String address,
      required double totalAmount,
      required String payMethod,
      String? voucherCode}) async {
    try {
      if (payMethod == 'cod') {
        await userRepository.placeOrder(
            totalPrice: totalAmount,
            voucherCode: voucherCode,
            address: address,
            payMethod: payMethod);
        return true;
      }
      var result = await createOrder(totalAmount);
      if (result != null) {
        final zpTransToken = result.zptranstoken;
        final status = await _pay(zpTransToken);
        if (status == PayStatus.success) {
          await userRepository.placeOrder(
              totalPrice: totalAmount,
              voucherCode: voucherCode,
              address: address,
              paid: true,
              payMethod: payMethod);
          return true;
        }
        return false;
      }
      return false;
    } catch (e) {
      emit(OrderErrorS(errorString: e.toString()));
      return false;
    }
  }
}
