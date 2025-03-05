import 'package:coinboost/controllers/time_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationToast extends StatelessWidget {
  const NotificationToast({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;
    final TimeController _timeController = Get.put(TimeController());
    return Container(
      height: 87,
      width: mobileWidth * (400 / 440),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            SizedBox(
              width: mobileWidth * (32 / 440),
            ),
            Icon(
              Icons.cancel,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(width: mobileWidth * (19 / 440)),
            Obx(() {
              return Text(
                _timeController.showTime(),
                style: TextStyle(color: Colors.black, fontSize: 15),
              );
            }),
            SizedBox(width: mobileWidth * (120 / 440)),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(width: 1, color: Colors.black))),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mobileWidth * (32 / 440)),
                child: Text(
                  'Claim',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'roboto',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
