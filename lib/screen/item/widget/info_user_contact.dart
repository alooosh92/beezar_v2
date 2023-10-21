import 'package:flutter/material.dart';

class InfoUserContact extends StatelessWidget {
  const InfoUserContact({
    super.key,
    required this.address,
    required this.username,
    required this.phone,
    required this.price,
  });
  final String address;
  final String username;
  final String phone;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              Text(address),
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
