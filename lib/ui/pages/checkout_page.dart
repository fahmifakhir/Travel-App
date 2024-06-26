import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(
    this.transaction, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTE - DESTINATION TILE
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaction.destination.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ],
            ),
            //NOTE - BOOKING DETAILS
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
            //NOTE - BOOKING DETAIL TEXT
            bookingDetailsItem(
              title: 'Traveler',
              value: '${transaction.amountOfTraveler} person',
              valueColor: kBlackColor,
            ),
            bookingDetailsItem(
              title: 'Seat',
              value: transaction.selectedSeat,
              valueColor: kBlackColor,
            ),
            bookingDetailsItem(
              title: 'Insurance',
              value: transaction.insurance ? 'YES' : 'NO',
              valueColor: transaction.insurance ? kGreenColor : kRedColor,
            ),
            bookingDetailsItem(
              title: 'Refundable',
              value: transaction.refundable ? 'YES' : 'NO',
              valueColor: transaction.refundable ? kGreenColor : kRedColor,
            ),
            bookingDetailsItem(
              title: 'VAT',
              value: '${(transaction.vat * 100).toStringAsFixed(0)}%',
              valueColor: kBlackColor,
            ),
            bookingDetailsItem(
              title: 'price',
              value: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.price),
              valueColor: kBlackColor,
            ),
            bookingDetailsItem(
              title: 'Grand Total',
              value: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(transaction.grandTotal),
              valueColor: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16, right: 16),
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image_card.png'),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/icon_plane.png'),
                                ),
                              ),
                            ),
                            Text(
                              'Pay',
                              style: whiteTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(state.user.balance),
                              style: blackTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Current Balance',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            print(state.error);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: 'Pay Now',
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
            margin: EdgeInsets.only(top: 30),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        child: Text(
          'Term and Condition',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton(),
        ],
      ),
    );
  }
}
