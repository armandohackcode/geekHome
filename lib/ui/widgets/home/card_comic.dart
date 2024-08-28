import 'package:appgeekhome/domain/models/comic_vine.dart';
import 'package:appgeekhome/ui/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardComic extends StatelessWidget {
  final ComicVine comic;
  const CardComic({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailScreen(url: comic.apiDetailUrl),
          ),
        );
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // child: Image.network(comic.image.originalUrl),
                child: FadeInImage(
                  placeholder: const AssetImage(
                      'assets/images/sandra-munoz-loading-neon.gif'),
                  image: NetworkImage(comic.image.originalUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              comic.name,
              maxLines: 2,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
            if (comic.releaseDate != null)
              Text(
                "Published: ${DateFormat('dd-MM-yyyy HH:mm').format(comic.releaseDate!)}",
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}
