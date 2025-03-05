import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 359,
      height: 135,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rules of Task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'robotoMono',
              color: const Color(0xff000000),
            ),
          ),
          SizedBox(
            height: 29,
          ),
          Text(
            '1. Keep scrolling for 10 minutes.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'roboto',
              color: const Color(0xff000000),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            '2. Keep clicking every 30 seconds.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'roboto',
              color: const Color(0xff000000),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            '3. Don\'t leave still screen for more than 30 seconds.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'roboto',
              color: const Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
