import 'package:flutter/material.dart';
import 'package:news_list_task/const/colors.dart';
import 'package:news_list_task/const/styles.dart';

class LatestNewsItemWidget extends StatelessWidget {
  const LatestNewsItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.publicationDate,
    required this.onTap,
    required this.readed,
  });

  final String image;
  final String title;
  final int publicationDate;
  final void Function() onTap;
  final bool readed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: AppColors.newscolor,
        borderRadius: BorderRadius.circular(9.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.textcolor.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: AppColors.newscolor,
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(9.0),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 23.0, left: 20.0, right: 20.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    image,
                    height: 60.0,
                    width: 90.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 23.0),
                Expanded(
                  child: SizedBox(
                    height: 60.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: MainStyles.kBlackColorW400(16.0),
                        ),
                        Row(
                          children: [
                            Text(
                              '$publicationDate ${publicationDate == 1 ? 'day' : 'days'} ago',
                              style: MainStyles.kGreyColorW400(12.0),
                            ),
                            const Expanded(child: SizedBox()),
                            readed
                                ? const Text(
                                    'Read',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(width: 6.0),
                            readed
                                ? const Icon(
                                    Icons.check_circle_outline_outlined,
                                    color: AppColors.subtextcolor,
                                    size: 10.0,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
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
