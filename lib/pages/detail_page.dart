import 'package:flutter/material.dart';
import 'package:future_jobs/theme.dart';
import 'package:future_jobs/widgets/posted_card.dart';

class DetailPage extends StatefulWidget {
  final String? imageUrl;
  final String? jobTitle;
  final String? company;
  DetailPage({this.company, this.imageUrl, this.jobTitle});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;
  @override
  Widget build(BuildContext context) {
    Widget cancelApplyButton() {
      return Center(
        child: SizedBox(
          height: 45,
          width: MediaQuery.of(context).size.width - (2 * 80),
          child: TextButton(
              onPressed: () {
                setState(() {
                  isApplied = !isApplied;
                });
              },
              child: Text(
                'Cancel Apply',
                style: buttonTextStyle,
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xffFD4F56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
              )),
        ),
      );
    }

    Widget appliedNotification() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - (2 * 24),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 9,
                horizontal: 24,
              ),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'You have applied this job and the \nrecruiter will contact you',
                    textAlign: TextAlign.center,
                    style: buttonTextStyle.copyWith(
                      color: Color(0xffA2A6B4),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffECEDF1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66),
                    ),
                  )),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isApplied
                    ? appliedNotification()
                    : SizedBox(
                        height: 80,
                      ),
                Center(
                  child: Image.asset(
                    widget.imageUrl ?? '',
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    widget.jobTitle ?? '',
                    style: jobTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Center(
                  child: Text(
                    '${widget.company}, inc • Jakarta',
                    style: companyTextStyle.copyWith(
                      color: Color(0xffB3B5C4),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About the job',
                        style: titleRequirements,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/dot.png',
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Full-Time On Site'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/dot.png',
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Start at \$18,000 per month'),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qualifications',
                        style: titleRequirements,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/dot.png',
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              'Candidate must possess at least a Bachelor\'s Degree.'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/dot.png',
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Able to use Microsoft Office and Google based service.',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/dot.png',
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Text(
                              'Have an excellent time management, good at organized and details',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Responsibilities',
                        style: titleRequirements,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/dot.png',
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Text(
                                'Initiate and promote any programs, events, training, or activities.'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/dot.png',
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Text(
                              'Assessing and anticipating needs and collaborate with Division.',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 51,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width - (2 * 80),
                    child: isApplied
                        ? cancelApplyButton()
                        : TextButton(
                            onPressed: () {
                              setState(() {
                                isApplied = !isApplied;
                              });
                            },
                            child: Text(
                              'Apply for Job',
                              style: buttonTextStyle,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff4141A4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(66),
                              ),
                            )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Message Recruiter',
                    style: contentRequirements.copyWith(
                      color: Color(0xffB3B5C4),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
