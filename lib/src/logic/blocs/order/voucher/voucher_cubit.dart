import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_amazon_clone_bloc/src/data/models/voucher.dart';
import 'package:flutter_amazon_clone_bloc/src/data/repositories/user_repository.dart';

part 'voucher_state.dart';

class VoucherCubit extends Cubit<VoucherState> {
  final UserRepository userRepository;
  VoucherCubit(this.userRepository) : super(VoucherInitial());

  getVouchers() async {
    try {
      var vouchers = await userRepository.getVouchers();
      final list = (vouchers as List).map((e) => Voucher.fromJson(e)).toList();
      final newList = list
          .where((e) =>
              e.expirationDate != null &&
              DateTime.parse(e.expirationDate!).isAfter(DateTime.now()))
          .toList();
      emit(ListVoucherState(vouchers: newList));
    } catch (e) {
      print(e);
    }
  }

  selectVoucher(Voucher voucher) async {
    try {
      emit(SelectedVoucherState(selected: voucher));
    } catch (e) {
      print(e);
    }
  }

  Future addVoucher(Voucher voucher) async {
    try {
      await userRepository.addVoucher(voucher);
      await getVouchers();
    } catch (e) {
      print(e);
    }
  }
  Future deleteVoucher(String code) async {
    try {
      await userRepository.deleteVoucher(code);
      await getVouchers();
    } catch (e) {
      print(e);
    }
  }
}
