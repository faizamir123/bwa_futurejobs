import 'package:flutter/material.dart';
import 'package:future_jobs/models/category_model.dart';
import 'package:future_jobs/models/job_model.dart';
import 'package:future_jobs/providers/job_provider.dart';
import 'package:future_jobs/theme.dart';
import 'package:future_jobs/widgets/posted_card.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  final CategoryModel category;
  //final String? jobTitleHome;
  // final String? imageUrl;

  CategoriesPage(this.category);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      16,
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 270,
                          child: Image.network(
                            category.imageUrl ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 270,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0, 0),
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff2A327D).withOpacity(0),
                                Color(0xff0D1240),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 30,
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(category.name ?? '',
                                  style: jobTitleTextStyle),
                              Text(
                                '12,309 available',
                                style: jobSubTitleTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Big Comapnies',
                          style: titleTextStyle.copyWith(
                            color: Color(0xff272C2F),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FutureBuilder<List<JobModel>>(
                            future:
                                jobProvider.getJobsByCategory(category.name),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                var data = snapshot.data as List<JobModel>;
                                return Column(
                                  children: data
                                      .map((job) => PostedCard(job))
                                      .toList(),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                        // PostedCard(
                        //   imageUrl: 'assets/company_1.png',
                        //   company: 'Google',
                        //   job: 'Front-End Developer',
                        // ),
                        // PostedCard(
                        //   imageUrl: 'assets/company_2.png',
                        //   job: 'UI Designer',
                        //   company: 'Instagram',
                        // ),
                        // PostedCard(
                        //   imageUrl: 'assets/company_3.png',
                        //   job: 'Data Scientis',
                        //   company: 'Facebook',
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Startups',
                          style: titleTextStyle.copyWith(
                            color: Color(0xff272C2F),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FutureBuilder<List<JobModel>>(
                            future: jobProvider.getJobs(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                var data = snapshot.data as List<JobModel>;
                                return Column(
                                  children: data
                                      .map((job) => PostedCard(job))
                                      .toList(),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                        // PostedCard(
                        //   imageUrl: 'assets/company_1.png',
                        //   company: 'Google',
                        //   job: 'Front-End Developer',
                        // ),
                        // PostedCard(
                        //   imageUrl: 'assets/company_2.png',
                        //   job: 'UI Designer',
                        //   company: 'Instagram',
                        // ),
                        // PostedCard(
                        //   imageUrl: 'assets/company_3.png',
                        //   job: 'Data Scientis',
                        //   company: 'Facebook',
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
