import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
    required this.onTapReaded,
  });

  final void Function() onTapReaded;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Icon(Icons.arrow_back_ios)),
                ),
              ),
              const Text(
                'News',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(
                      onTap: onTapReaded,
                      child: const Text(
                        'Mark All Read',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
