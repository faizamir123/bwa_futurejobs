import 'package:flutter/material.dart';
import 'package:future_jobs/models/category_model.dart';
import 'package:future_jobs/pages/categories_page.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatelessWidget {
  final CategoryModel category;
  //final String? text;
  // final String? imageUrl;

  JobCard(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesPage(category),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 200,
            width: 150,
            child: Stack(
              children: [
                Image.network(category.imageUrl),
                Container(
                  height: 200,
                  width: 150,
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
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      bottom: 16,
                      right: 16,
                    ),
                    child: Text(
                      category.name,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
