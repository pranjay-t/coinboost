import 'package:coinboost/constants/notification_toast.dart';
import 'package:flutter/material.dart';
import 'package:coinboost/widgets/bottom_app_bar_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final mobileHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: mobileHeight * 0.115,
                    color: const Color(0xffF7931A),
                  ),
                  Image.asset(
                    'assets/images/task_pic.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: mobileHeight * 0.05, left: 25, child: NotificationToast()),
        ],
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}
