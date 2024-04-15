import 'package:go_router/go_router.dart';
import 'package:go_router_v7/screens/1_basic_screen.dart';
import 'package:go_router_v7/screens/2_named_screen.dart';
import 'package:go_router_v7/screens/root_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => RootScreen(),
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) => BasicScreen(),
        ),
        GoRoute(
          path: 'named',
          name: NamedScreen.name,
          builder: (context, state) => NamedScreen(),
        ),
      ],
    ),
  ],
);
