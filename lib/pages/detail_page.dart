import 'package:flutter/material.dart';
import 'package:future_jobs/models/job_model.dart';
import 'package:future_jobs/theme.dart';
import 'package:future_jobs/widgets/posted_card.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;
  // final String? imageUrl;
  // final String? jobTitle;
  // final String? company;
  DetailPage(this.job);

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

    Widget detailItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: primaryColor,
              size: 12,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                text,
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget aboutTheJob() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the job',
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children:
                  widget.job.about?.map((text) => detailItem(text)).toList() ??
                      [],
            ),
          ],
        ),
      );
    }

    Widget qualifications() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qualifications',
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: widget.job.qualifications
                      ?.map((text) => detailItem(text))
                      .toList() ??
                  [],
            ),
          ],
        ),
      );
    }

    Widget responsibilities() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsibilities',
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: widget.job.responsibilities
                      ?.map((text) => detailItem(text))
                      .toList() ??
                  [],
            ),
          ],
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
                  child: Image.network(
                    widget.job.companyLogo ?? '',
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    widget.job.name ?? '',
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
                    '${widget.job.companyName} • ${widget.job.location}',
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
                      aboutTheJob(),
                      qualifications(),
                      responsibilities(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
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
