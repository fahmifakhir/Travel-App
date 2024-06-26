import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
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
}
