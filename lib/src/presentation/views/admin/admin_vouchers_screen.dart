import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/data/models/voucher.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/order/voucher/voucher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AdminVouchersScreen extends StatelessWidget {
  const AdminVouchersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<VoucherCubit>().getVouchers();
    final primaryColor = Theme.of(context).primaryColor;
    const Color secondaryColor = Color(0xff368f8b);
    return Scaffold(
      body: BlocBuilder<VoucherCubit, VoucherState>(
        builder: (context, state) {
          if (state is ListVoucherState) {
            return ListView(
              children: state.vouchers
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                      child: CouponCard(
                        height: 100,
                        borderRadius: 16,
                        backgroundColor: primaryColor.withOpacity(0.8),
                        curveAxis: Axis.vertical,
                        firstChild: Container(
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                          ),
                          child: Center(
                            child: Text(
                              '${item.discountValue}${item.discountType == 'percentage' ? '%' : 'đ'}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        secondChild: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Mã khuyến mãi',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      item.code ?? 'none',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Hết hạn vào: ${_formatDate(item.expirationDate!)}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              FilledButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                              title: const Text(
                                                  'Xóa khuyến mãi'),
                                              content: const Text(
                                                  'Bạn có chắc muốn xóa mã khuyến mãi này không?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text('Hủy'),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    await context
                                                        .read<VoucherCubit>()
                                                        .deleteVoucher(
                                                            item.code!);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Xóa'),
                                                ),
                                              ]));
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  'Xóa',
                                  style: TextStyle(color: primaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _addVoucher(context),
          icon: const Icon(Icons.add),
          label: const Text('Thêm khuyến mãi')),
    );
  }

  _addVoucher(BuildContext context) async {
    final discount = TextEditingController();
    final expirationDate = TextEditingController();
    final code = TextEditingController();
    final usageLimit = TextEditingController();
    final keyForm = GlobalKey<FormState>();
    showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: code,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Mã khuyến mãi',
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: discount,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Giá trị khuyến mãi ( % )',
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: usageLimit,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Số lần sử dụng',
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: expirationDate,
                      readOnly: true,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.now().add(const Duration(days: 1)),
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 1)),
                          lastDate: DateTime(2025),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );
                        if (date == null) return;
                        expirationDate.text = date.toString();
                      },
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Ngày hết hạn',
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                    ),
                    FilledButton(
                        onPressed: () async {
                          if (!keyForm.currentState!.validate()) return;

                          final voucher = Voucher(
                            code: code.text,
                            discountType: 'percentage',
                            discountValue:
                                double.parse(discount.text).round().toInt(),
                            expirationDate: expirationDate.text,
                            usageLimit: int.parse(usageLimit.text),
                          );
                          await context
                              .read<VoucherCubit>()
                              .addVoucher(voucher);
                          Navigator.pop(context);
                        },
                        child: const Text('Thêm'))
                  ],
                ),
              ),
            ));
  }

  _formatDate(String date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formattedOrderDate = formatter.format(DateTime.parse(date));
    return formattedOrderDate;
  }
}
