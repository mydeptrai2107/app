import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/data/models/product.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/order/order_cubit/order_cubit.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/order/place_order_buy_now/place_order_buy_now_cubit.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/user_cubit/user_cubit.dart';
import 'package:flutter_amazon_clone_bloc/src/presentation/widgets/common_widgets/custom_textfield.dart';
import 'package:flutter_amazon_clone_bloc/src/utils/constants/constants.dart';
import 'package:flutter_amazon_clone_bloc/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

class PaymentScreenBuyNow extends StatefulWidget {
  final Product product;
  const PaymentScreenBuyNow({super.key, required this.product});

  @override
  State<PaymentScreenBuyNow> createState() => _PaymentScreenBuyNowState();
}

class _PaymentScreenBuyNowState extends State<PaymentScreenBuyNow> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = '';

  final Future<PaymentConfiguration> _googlePayConfigFuture =
      PaymentConfiguration.fromAsset('gpay.json');

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<PlaceOrderBuyNowCubit>()
        .gPayButton(totalAmount: widget.product.price.toString());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: Constants.appBarGradient),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Tổng tạm tính ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87),
                  ),
                  Text(
                    formatPriceWithDecimal(
                        double.parse(widget.product.price.toString())),
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const Text(
                    'đ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BlocBuilder<PlaceOrderBuyNowCubit, PlaceOrderBuyNowState>(
                builder: (context, state) {
                  if (state is PlaceOrderBuyNowProcessS) {
                    return state.user.address == ''
                        ? const SizedBox()
                        : Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    state.user.address,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'HOẶC',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextfield(
                      controller: flatBuildingController,
                      hintText: 'Căn hộ, số nhà, tòa nhà',
                      onChanged: (string) {
                        context.read<PlaceOrderBuyNowCubit>().addPaymentItem(
                            totalAmount: widget.product.price.toString());
                      },
                    ),
                    CustomTextfield(
                      controller: areaController,
                      hintText: 'Khu vực, đường phố',
                    ),
                    CustomTextfield(
                      controller: pincodeController,
                      hintText: 'Mã pin',
                    ),
                    CustomTextfield(
                      controller: cityController,
                      hintText: 'Thị trấn/thành phố',
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
              FutureBuilder<PaymentConfiguration>(
                future: _googlePayConfigFuture,
                builder: (context, snapshot) => snapshot.hasData
                    ? BlocConsumer<PlaceOrderBuyNowCubit,
                        PlaceOrderBuyNowState>(
                        listener: (context, state) {
                          if (state is PlaceOrderBuyNowErrorS) {
                            showSnackBar(context, state.errorString);
                          }
                        },
                        builder: (context, state) {
                          if (state is PlaceOrderBuyNowProcessS) {
                            return GooglePayButton(
                              onPressed: () {
                                addressToBeUsed = '';
                                bool isFromForm =
                                    flatBuildingController.text.isNotEmpty ||
                                        areaController.text.isNotEmpty ||
                                        pincodeController.text.isNotEmpty ||
                                        cityController.text.isNotEmpty;

                                if (isFromForm) {
                                  if (_addressFormKey.currentState!
                                      .validate()) {
                                    addressToBeUsed =
                                        '${flatBuildingController.text}, ${areaController.text}, ${cityController.text}, ${pincodeController.text}';
                                  } else {
                                    throw Exception(
                                        'Vui lòng nhập tất cả các giá trị');
                                  }
                                } else if (addressToBeUsed.isEmpty) {
                                  addressToBeUsed = state.user.address;
                                } else {
                                  showSnackBar(context, 'ERROR');
                                }
                              },
                              width: double.infinity,
                              height: 50,
                              paymentConfiguration: snapshot.data!,
                              paymentItems: state.paymentItems,
                              type: GooglePayButtonType.order,
                              margin: const EdgeInsets.only(top: 15.0),
                              onPaymentResult: (res) {
                                showSnackBar(context, 'Đặt hàng đã được đặt!');
                                if (state.user.address == '') {
                                  context.read<UserCubit>().saveUserAddress(
                                      address: addressToBeUsed);
                                }

                                context
                                    .read<PlaceOrderBuyNowCubit>()
                                    .placeOrderBuyNow(
                                      product: widget.product,
                                      address: addressToBeUsed,
                                    );
                                Navigator.pop(context);
                              },
                              loadingIndicator: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (state is DisableButtonS) {
                            return GPayDisabledButton(
                              flatBuildingController: flatBuildingController,
                              areaController: areaController,
                              pincodeController: pincodeController,
                              cityController: cityController,
                              addressFormKey: _addressFormKey,
                            );
                          }

                          return GPayDisabledButton(
                            flatBuildingController: flatBuildingController,
                            areaController: areaController,
                            pincodeController: pincodeController,
                            cityController: cityController,
                            addressFormKey: _addressFormKey,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GPayDisabledButton extends StatelessWidget {
  const GPayDisabledButton({
    super.key,
    required this.flatBuildingController,
    required this.areaController,
    required this.pincodeController,
    required this.cityController,
    required GlobalKey<FormState> addressFormKey,
  });

  final TextEditingController flatBuildingController;
  final TextEditingController areaController;
  final TextEditingController pincodeController;
  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.grey.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      onPressed: () {
        showSnackBar(context, 'Vui lòng nhập địa chỉ của bạn');
      },
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Đặt hàng với ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/google_icon.png',
            height: 35,
            width: 35,
          ),
          const Text(
            'Thanh toán',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
