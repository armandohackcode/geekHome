import 'package:appgeekhome/ui/screens/detail_screen.dart';
import 'package:appgeekhome/ui/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _publicRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Home(),
  ),
  GoRoute(
    path: '/detail/:url',
    builder: (context, state) {
      final url = Uri.decodeComponent(state.pathParameters['url']!);
      return DetailScreen(url: url);
    },
  ),
]);

class AppRouter extends Cubit<GoRouter> {
  AppRouter() : super(_publicRouter);
  void goBack() {
    state.pop();
  }

  void goHome() {
    state.go('/');
  }

  void goToDetail(String url) {
    final encodedUrl = Uri.encodeComponent(url);
    state.go('/detail/$encodedUrl');
  }
}
