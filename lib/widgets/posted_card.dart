import 'package:flutter/material.dart';
import 'package:future_jobs/pages/detail_page.dart';
import 'package:future_jobs/theme.dart';
import 'package:future_jobs/pages/detail_page.dart';

class PostedCard extends StatelessWidget {
  final String? job;
  final String? company;
  final String? imageUrl;

  PostedCard({this.company, this.imageUrl, this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  company: company,
                  jobTitle: job,
                  imageUrl: imageUrl,
                ),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Center(
                child: Image.asset(
                  imageUrl ?? '',
                  height: 45,
                ),
              ),
              SizedBox(
                width: 27.03,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(job ?? '', style: jobTextStyle),
                    SizedBox(
                      height: 2,
                    ),
                    Text(company ?? '', style: companyTextStyle),
                    SizedBox(
                      height: 18.5,
                    ),
                    Divider(
                      color: Color(0xffECEDF1),
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
