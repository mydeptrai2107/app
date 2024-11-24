import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/order/voucher/voucher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<VoucherCubit>().getVouchers();
    final primaryColor = Theme.of(context).primaryColor;
    const Color secondaryColor = Color(0xff368f8b);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mã khuyến mãi'),
      ),
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
                                  context
                                      .read<VoucherCubit>()
                                      .selectVoucher(item);
                                  context.pop();
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  'Áp dụng',
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
    );
  }

  _formatDate(String date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formattedOrderDate = formatter.format(DateTime.parse(date));
    return formattedOrderDate;
  }
}
