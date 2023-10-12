import 'package:flutter/material.dart';

Widget profileItem(String title, {VoidCallback? onTap}) => GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
