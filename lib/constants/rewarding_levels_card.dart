import 'package:flutter/material.dart';

class RewardingLevelsCard extends StatelessWidget {
  final int level;
  final int minimumWithdrawal;
  final int yourEarnings;
  final bool isStarted;
  const RewardingLevelsCard({
    super.key,
    required this.level,
    required this.minimumWithdrawal,
    required this.yourEarnings,
    this.isStarted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 179,
      width: 343,
      child: Card(
        color: const Color(0xffF7931A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.74, top: 5),
              child: Text(
                'Level 0$level',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'robotoMono',
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Container(
              height: 137,
              width: 343,
              child: Card(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24.74,
                    top: 19,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Minimum Withdrawal = \$$minimumWithdrawal',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'robotoMono',
                          color: const Color(0xffF7931A),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Your earnings = \$$yourEarnings',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'robotoMono',
                          color: const Color(0xff555555),
                        ),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 19,
                            width: 282,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Color(0xffF7931A), width: 2),
                            ),
                          ),
                          isStarted
                              ? Container(
                                  height: 19,
                                  width: 282 * 0.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffF7931A)),
                                  child: Center(
                                    child: Text(
                                      '50%',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'robotoMono',
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ))
                              : SizedBox(),
                        ],
                      )
                    ],
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
