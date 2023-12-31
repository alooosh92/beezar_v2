import 'package:beezer_v2/widget/change_date_to_day.dart';
import 'package:flutter/material.dart';

class InfoUserContact extends StatelessWidget {
  const InfoUserContact({
    super.key,
    required this.address,
    required this.username,
    required this.phone,
    required this.price,
    required this.date,
  });
  final String address;
  final String username;
  final String phone;
  final String price;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(address),
                ],
              ),
              Text("تم الانشاء منذ ${changeDateToDay(date)}"),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.person_outline_outlined),
              Text(username),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.phone_android_outlined),
              Text(phone),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.attach_money),
              Text(price),
            ],
          ),
        ],
      ),
    );
  }
}
