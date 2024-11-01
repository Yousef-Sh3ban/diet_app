import 'package:diet_planner/blocs/branch_bloc.dart';
import 'package:diet_planner/blocs/delivery_method_bloc.dart';
import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/configuration/app_theme.dart';
import 'package:diet_planner/custom_widgets/cart_widget.dart';
import 'package:diet_planner/custom_widgets/checkout_dialog.dart';
import 'package:diet_planner/custom_widgets/show_dialog.dart';
import 'package:diet_planner/custom_widgets/voucher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});
  bool deliveryTax = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "  Cart",
              style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CartWidget(
                  name: "Pizza Ransh extra cheese",
                  price: 1500,
                  imagePath: "assets/images/pizza0.png"),
              const CartWidget(
                  name: "Pizza Ransh extra cheese",
                  price: 1500,
                  imagePath: "assets/images/chiken1.png"),
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Voucher',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const VoucherWidget(),
                    const SizedBox(
                      height: 29,
                    ),
                    Text(
                      'Choose the method',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<DeliveryMethodBloc, AppState>(
                      builder: (context, state) {
                        if (state is DeliveryMethodState) {
                          deliveryTax = state.isDelivery;
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<DeliveryMethodBloc>(context)
                                      .add(DeliveryMethodEvent(
                                          isDelivery: true, isPickup: false));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: state.isDelivery
                                          ? const Color(0xFFE8F2EC)
                                          : Colors.white,
                                      border: Border.all(
                                          color: state.isDelivery
                                              ? Colors.white
                                              : AppTheme.secondaryColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  width: 163,
                                  height: 52,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      state.isDelivery
                                          ? Container(
                                              decoration: const BoxDecoration(
                                                color: AppTheme.primaryColor,
                                                borderRadius:
                                                    BorderRadiusDirectional.only(
                                                  topStart: Radius.circular(6),
                                                  bottomStart: Radius.circular(6),
                                                ),
                                              ),
                                              width: 10,
                                            )
                                          : const SizedBox(
                                              width: 10,
                                            ),
                                      const Expanded(child: SizedBox()),
                                      SvgPicture.asset("assets/icons/del.svg"),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Delivery',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<DeliveryMethodBloc>(context)
                                      .add(DeliveryMethodEvent(
                                          isDelivery: false, isPickup: true));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: state.isPickup
                                          ? const Color(0xFFE8F2EC)
                                          : Colors.white,
                                      border: Border.all(
                                          color: state.isPickup
                                              ? Colors.white
                                              : AppTheme.secondaryColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  width: 163,
                                  height: 52,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      state.isPickup
                                          ? Container(
                                              decoration: const BoxDecoration(
                                                color: AppTheme.primaryColor,
                                                borderRadius:
                                                    BorderRadiusDirectional.only(
                                                  topStart: Radius.circular(6),
                                                  bottomStart: Radius.circular(6),
                                                ),
                                              ),
                                              width: 10,
                                            )
                                          : const SizedBox(
                                              width: 10,
                                            ),
                                      const Expanded(child: SizedBox()),
                                      SvgPicture.asset("assets/icons/pick.svg"),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Pickup',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Select a branch",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<BranchBloc, BranchState>(
                        builder: (context, state) {
                      String? branchName = state.branch;
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppTheme.secondaryColor)),
                        height: 52,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              branchName,
                              style: branchName == "Select..."
                                  ? GoogleFonts.poppins(
                                      color: const Color(0xFFBFBFBF))
                                  : GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                            ),
                            const Expanded(child: SizedBox()),
                            InkWell(
                                onTap: () {
                                  
                                  showChoiceDialog(context, branchName);
                                },
                                child: SvgPicture.asset(
                                    "assets/icons/arrow-down.svg")),
                            const SizedBox(
                              width: 14,
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Order Summury",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.secondaryColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "3000 AED",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tax",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "5 AED",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<DeliveryMethodBloc, AppState>(
                        builder: (context, state) {
                      if (state is DeliveryMethodState&&state.isDelivery)  {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "15 AED",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      }else {
                        return const SizedBox();
                      }
                    }),
                    Container(
                      height: 1,
                      color: AppTheme.secondaryColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        BlocBuilder<DeliveryMethodBloc, AppState>(
                          builder: (context,state) {
                            return Text(
                              "${state is DeliveryMethodState&&state.isDelivery?"170":"155"} AED",
                              style: GoogleFonts.poppins(
                                color: AppTheme.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE8F2EC),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                "Add More items",
                                style: GoogleFonts.poppins(
                                  color: AppTheme.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                                color: AppTheme.primaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: InkWell(
                              onTap: (){
                                
                                checkoutDialog(context);
                              },
                              child: Center(
                                child: Text(
                                  "Checkout",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
