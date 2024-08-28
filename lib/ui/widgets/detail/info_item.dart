import 'package:appgeekhome/config/theme/app_styles.dart';
import 'package:appgeekhome/domain/models/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoItem extends StatelessWidget {
  final ItemDetail item;

  const InfoItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
      child: TextButton(
          onPressed: () async {
            await launchUrl(Uri.parse(item.siteDetailUrl),
                mode: LaunchMode.externalApplication);
          },
          child: Text(
            "●  ${item.name}",
            style: const TextStyle(color: AppStyles.baseColor),
          )),
    );
  }
}
