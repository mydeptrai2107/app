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
      emit(ListVoucherState(vouchers: list));
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
}
