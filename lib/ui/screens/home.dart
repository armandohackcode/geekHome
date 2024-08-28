import 'package:appgeekhome/config/theme/app_styles.dart';
import 'package:appgeekhome/domain/bloc/blocs.dart';
import 'package:appgeekhome/ui/widgets/error_loading.dart';
import 'package:appgeekhome/ui/widgets/home/card_comic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    context.read<HomeBloc>().add(LoadComics());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<HomeBloc>().add(const LoadComicsMore());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 70,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 32,
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeLoaded>(
        builder: (context, state) {
          if (state.loading) {
            return Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: AppStyles.baseColor, size: 40),
            );
          } else if (state.errorMs != null) {
            return ErrorLoading(
              message: state.errorMs!,
              onPressed: () {
                context.read<HomeBloc>().add(LoadComics());
              },
            );
          } else {
            return Stack(
              alignment: const Alignment(0, 1),
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeBloc>().add(LoadComics());
                  },
                  child: GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 60),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.56,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: state.comics.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardComic(comic: state.comics[index]);
                    },
                  ),
                ),
                if (state.loadingMore)
                  LoadingAnimationWidget.stretchedDots(
                    color: AppStyles.baseColor,
                    size: 40,
                  )
              ],
            );
          }
        },
      ),
    );
  }
}
