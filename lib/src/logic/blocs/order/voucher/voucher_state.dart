part of 'voucher_cubit.dart';

sealed class VoucherState extends Equatable {
  const VoucherState();

  @override
  List<Object> get props => [];
}

final class VoucherInitial extends VoucherState {}

final class ListVoucherState extends VoucherState {
  final List<Voucher> vouchers;
  const ListVoucherState({required this.vouchers});

  @override
  List<Object> get props => [vouchers];
}

final class SelectedVoucherState extends VoucherState {
  final Voucher selected;
  const SelectedVoucherState({required this.selected});

  @override
  List<Object> get props => [selected];
}
