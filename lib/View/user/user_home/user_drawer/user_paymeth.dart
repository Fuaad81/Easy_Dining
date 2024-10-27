import 'package:easy_dine_in/Providers/user_payment_provider.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/style/customtheme.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserPayMethod extends StatelessWidget {
  final List<Map<String, dynamic>> userDetails;
  const UserPayMethod({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Payment Method",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildPaymentOption(context, paymentProvider, "Cash on Delivery",
              "assets/icons/ic_money.png"),
          _buildPaymentOption(context, paymentProvider, "Google Pay",
              "assets/icons/ic_googlepay.png"),
          _buildPaymentOption(context, paymentProvider, "Visa / Master",
              "assets/icons/ic_visa.png"),
        ],
      ),
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            backgroundColor: WidgetStateProperty.all(myColor.maincolor),
            foregroundColor: WidgetStateProperty.all(myColor.background),
            minimumSize: WidgetStateProperty.all(Size(340.w, 45.h)),
          ),
          onPressed: () {},
          child: CustomText(text: "Confirm", size: 20.spMin)),
    );
  }

  Widget _buildPaymentOption(BuildContext context, PaymentProvider provider,
      String method, String iconPath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: ListTile(
        leading: Radio<String>(
          value: method,
          groupValue: provider.selectedPaymentMethod,
          onChanged: (String? value) {
            if (value != null) {
              provider
                  .setPaymentMethod(value); // Update selected payment method
            }
          },
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: lightTheme.dividerColor),
          borderRadius: BorderRadius.circular(10.spMin),
        ),
        title: CustomText(
          text: method,
          size: 18.spMin,
          weight: FontWeight.w500,
        ),
        trailing: Image.asset(iconPath, width: 35),
      ),
    );
  }
}
