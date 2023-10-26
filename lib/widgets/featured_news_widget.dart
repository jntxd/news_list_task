import 'package:flutter/material.dart';
import 'package:news_list_task/const/colors.dart';
import 'package:news_list_task/const/styles.dart';

class FeaturedNewsItemWidget extends StatelessWidget {
  const FeaturedNewsItemWidget({
    super.key,
    required this.title,
    required this.image,
    required this.readed,
    required this.onTap,
  });

  final String image;
  final String title;
  final bool readed;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.textcolor.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 14,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            readed
                ? const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Read',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Icon(
                          Icons.check_circle,
                          color: AppColors.newscolor,
                          size: 14.0,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: Text(
                title,
                style: MainStyles.kWhiteColor2W400(28.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
