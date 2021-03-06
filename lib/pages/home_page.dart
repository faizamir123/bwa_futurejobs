import 'package:flutter/material.dart';
import 'package:future_jobs/models/category_model.dart';
import 'package:future_jobs/models/job_model.dart';
import 'package:future_jobs/providers/category_provider.dart';
import 'package:future_jobs/providers/job_provider.dart';
import 'package:future_jobs/providers/user_provider.dart';
import 'package:future_jobs/theme.dart';
import 'package:future_jobs/widgets/btn_navbar_item.dart';
import 'package:future_jobs/widgets/job_card.dart';
import 'package:future_jobs/widgets/posted_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);
    Widget header() {
      return Padding(
        padding: EdgeInsets.only(left: 24, top: 30, right: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy',
                  style: titleTextStyle,
                ),
                Text(
                  userProvider.user?.name ?? 'USER',
                  style: subTitleTextStyle,
                ),
              ],
            ),
            Spacer(),
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/border_pic.png',
                    width: 58,
                    height: 58,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/user_pic.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget HotCategories() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 20,
              ),
              child: Text(
                'Hot Categories',
                style: titleTextStyle.copyWith(
                  color: Color(0xff272C2F),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child: FutureBuilder<List<CategoryModel>>(
                  future: categoryProvider.getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<CategoryModel> data =
                          snapshot.data as List<CategoryModel>;

                      int index = -1;
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: data.map((category) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(left: index == 0 ? 24 : 0),
                            child: JobCard(
                              category,
                            ),
                          );
                        }).toList(),
                        // children: [
                        //   SizedBox(
                        //     width: 24,
                        //   ),
                        //   JobCard(
                        //     text: 'Website Developer',
                        //     imageUrl: 'assets/image_1.png',
                        //   ),
                        //   JobCard(
                        //     text: 'Mobile Developer',
                        //     imageUrl: 'assets/image_2.png',
                        //   ),
                        //   JobCard(
                        //     text: 'App Designer',
                        //     imageUrl: 'assets/image_3.png',
                        //   ),
                        //   JobCard(
                        //     text: 'Content Writer',
                        //     imageUrl: 'assets/image_4.png',
                        //   ),
                        //   JobCard(
                        //     text: 'Video Grapher',
                        //     imageUrl: 'assets/image_5.png',
                        //   ),
                        // ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    }

    Widget JustPosted() {
      return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Just Posted',
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
                    if (snapshot.connectionState == ConnectionState.done) {
                      var data = snapshot.data as List<JobModel>;
                      return Column(
                        children: data.map((job) => PostedCard(job)).toList(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
              // PostedCard(
              //   imageUrl: 'assets/company_1.png',
              //   job: 'Front-End Developer',
              //   company: 'Google',
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
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            SizedBox(
              height: 30,
            ),
            HotCategories(),
            JustPosted(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          selectedItemColor: Color(0xff272C2F),
          unselectedItemColor: Color(0xffB3B5C4),
          currentIndex: 0,
          elevation: 0,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/btn_navbar_apps.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/btn_navbar_notification.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/btn_navbar_favourite.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/btn_navbar_user.png'),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
