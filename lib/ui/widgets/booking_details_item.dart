import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class bookingDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  const bookingDetailsItem(
      {super.key,
      required this.title,
      required this.value,
      required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 14,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 14,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
