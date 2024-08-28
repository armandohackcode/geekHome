import 'package:any_link_preview/any_link_preview.dart';
import 'package:appgeekhome/config/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewLink extends StatelessWidget {
  final String title;
  final String url;
  const PreviewLink(
      {super.key,
      required this.context,
      required this.title,
      required this.url});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: 120,
      child: AnyLinkPreview(
        key: UniqueKey(),
        urlLaunchMode: LaunchMode.externalApplication,
        placeholderWidget: Center(
          child: LoadingAnimationWidget.stretchedDots(
            color: AppStyles.baseColor,
            size: 40,
          ),
        ),
        link: url,
        previewHeight: 0,
        displayDirection: UIDirection.uiDirectionHorizontal,
        showMultimedia: true,

        bodyMaxLines: 1,
        bodyTextOverflow: TextOverflow.ellipsis,
        titleStyle: const TextStyle(
          color: AppStyles.fontColorBlack,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        bodyStyle:
            const TextStyle(color: AppStyles.fontColorBlack, fontSize: 12),
        errorBody: 'Show my custom error body',
        errorTitle: 'Show my custom error title',

        errorWidget: Container(
          width: MediaQuery.of(context).size.width * 0.66,
          decoration: BoxDecoration(
              color: AppStyles.cardColor,
              borderRadius: BorderRadius.circular(10)),
          height: 100,
          child: Row(
            children: [
              Image.network(
                'https://img.icons8.com/?size=512&id=92941&format=png',
                width: 100,
                height: 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.66,
                height: 100,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppStyles.fontColorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        errorImage: "https://img.icons8.com/?size=512&id=92941&format=png",
        cache: const Duration(days: 1),
        backgroundColor: AppStyles.cardColor,
        borderRadius: 10,
        removeElevation: true,
        // This disables tap event
      ),
    );
  }
}
