import 'package:flutter/material.dart';

class StandardDeliveryContainer extends StatelessWidget {
  const StandardDeliveryContainer({
    super.key,
    required this.containerDecoration,
    required this.textSyle,
  });

  final BoxDecoration containerDecoration;
  final TextStyle textSyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      alignment: Alignment.centerLeft,
      decoration: containerDecoration.copyWith(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      ),
      child: Text(
        'Giao hàng tiêu chuẩn',
        style: textSyle,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
