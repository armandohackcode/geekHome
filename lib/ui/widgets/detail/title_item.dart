import 'package:appgeekhome/config/theme/app_styles.dart';
import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  final String title;
  const TitleItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppStyles.fontColor,
            ),
          ),
          const Divider(color: AppStyles.fontColor)
        ],
      ),
    );
  }
}
