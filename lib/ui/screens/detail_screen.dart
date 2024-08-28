import 'package:appgeekhome/config/theme/app_styles.dart';
import 'package:appgeekhome/domain/bloc/blocs.dart';
import 'package:appgeekhome/ui/widgets/detail/info_item.dart';
import 'package:appgeekhome/ui/widgets/detail/title_item.dart';
import 'package:appgeekhome/ui/widgets/error_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DetailScreen extends StatefulWidget {
  final String url;
  const DetailScreen({super.key, required this.url});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final date = DateFormat('dd MMMM yyyy HH:mm');
  @override
  void initState() {
    context.read<ComicDetailBloc>().add(LoadComicDetail(url: widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ComicDetailBloc, ComicLoaded>(
        builder: (context, state) {
          if (state.loading) {
            return Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: AppStyles.baseColor, size: 40),
            );
          } else if (state.errorMessage != null) {
            return ErrorLoading(
              message: state.errorMessage!,
              onPressed: () {
                context
                    .read<ComicDetailBloc>()
                    .add(LoadComicDetail(url: widget.url));
              },
            );
          } else if (state.comic == null) {
            return ErrorLoading(
              message: "Failed to load detail",
              onPressed: () {
                context
                    .read<ComicDetailBloc>()
                    .add(LoadComicDetail(url: widget.url));
              },
            );
          } else {
            return ListView(
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        state.comic!.image.tinyUrl,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      state.comic!.image.originalUrl,
                      fit: BoxFit.cover,
                      width: 250,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    state.comic!.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                if (state.comic!.dateAdded != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                        "⚃ Added: ${date.format(state.comic!.dateAdded!)}"),
                  ),
                if (state.comic!.dateLastUpdated != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                        "⚃ Last updated: ${date.format(state.comic!.dateLastUpdated!)}"),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text("● Rumtime: ${state.comic!.runtime}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text("● Raiting: ${state.comic!.rating}"),
                ),
                if (state.comic!.deck.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: HtmlWidget(
                      state.comic!.deck,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                if (state.comic!.description.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: HtmlWidget(
                      state.comic!.description,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                if (state.comic!.characters.isNotEmpty)
                  ExpansionTile(
                    title: const TitleItem(title: "Characters"),
                    children: [
                      ...state.comic!.characters.map(
                        (e) => InfoItem(item: e),
                      )
                    ],
                  ),
                if (state.comic!.teams.isNotEmpty)
                  ExpansionTile(
                    title: const TitleItem(title: "Teams"),
                    children: [
                      ...state.comic!.teams.map(
                        (e) => InfoItem(item: e),
                      )
                    ],
                  ),
                if (state.comic!.locations.isNotEmpty)
                  ExpansionTile(
                    title: const TitleItem(title: "Locations"),
                    children: [
                      ...state.comic!.locations.map(
                        (e) => InfoItem(item: e),
                      )
                    ],
                  ),
                if (state.comic!.concepts.isNotEmpty)
                  ExpansionTile(
                    title: const TitleItem(title: "Concepts"),
                    children: [
                      ...state.comic!.concepts.map(
                        (e) => InfoItem(item: e),
                      )
                    ],
                  ),
                if (state.comic!.objects.isNotEmpty)
                  ExpansionTile(
                    title: const TitleItem(title: "Objects"),
                    children: [
                      ...state.comic!.objects.map(
                        (e) => InfoItem(item: e),
                      )
                    ],
                  ),
                if (state.comic!.studios.isNotEmpty)
                  ExpansionTile(
                    title: const TitleItem(title: "Studios"),
                    children: [
                      ...state.comic!.studios.map(
                        (e) => InfoItem(item: e),
                      )
                    ],
                  ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget label(String label, String text) => Container(
        margin: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Text("$label: "),
            Text(text),
          ],
        ),
      );
}
