import 'package:diet_planner/blocs/cart_bloc.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/configuration/app_theme.dart';
import 'package:diet_planner/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../configuration/app_events.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocBuilder<CartBloc, AppState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is EmptyState) {
            return const Center(
              child: Text('No items in the cart'),
            );
          } else if (state is LoadedState) {
            List<MealModel> cartItemsList = state.data as List<MealModel>;
            return ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Row(
                            children: [
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItemsList[index].name,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "${cartItemsList[index].price} AED",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.primaryColor),
                                  ),
                                  const SizedBox(height: 8,),
                                  Container(
                                    width: 124,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppTheme.secondaryColor),
                                      borderRadius: BorderRadius.circular(50)
                                      ),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<CartBloc>(context).add(
                                                RemoveEvent(cartItemsList[index].id));
                                          },
                                          icon: const Icon(Icons.remove,size: 14,color: Color(0xFF8C8C8C),),
                                        ),
                                        Text('${cartItemsList[index].quantity}',style: GoogleFonts.poppins(color: AppTheme.primaryColor,fontSize: 16,fontWeight: FontWeight.w500),),
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<CartBloc>(context).add(
                                                AddEvent(cartItemsList[index].id));
                                          },
                                          icon: const Icon(Icons.add,size: 14,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              ClipRRect(borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  cartItemsList[index].image,
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                  Container(height: 1,color: AppTheme.secondaryColor,)
                  ],
                ),
                itemCount: cartItemsList.length);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
