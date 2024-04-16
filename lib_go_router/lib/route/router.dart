import 'package:go_router/go_router.dart';
import 'package:go_router_v7/screens/1_basic_screen.dart';
import 'package:go_router_v7/screens/2_named_screen.dart';
import 'package:go_router_v7/screens/3_push_screen.dart';
import 'package:go_router_v7/screens/4_pop_base_screen.dart';
import 'package:go_router_v7/screens/5_pop_return_screen.dart';
import 'package:go_router_v7/screens/6_path_param_screen.dart';
import 'package:go_router_v7/screens/7_query_parameter_screen.dart';
import 'package:go_router_v7/screens/8_nested_child_screen.dart';
import 'package:go_router_v7/screens/8_nested_screen.dart';
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
        GoRoute(
          path: 'push',
          name: PushScreen.name,
          builder: (context, state) => PushScreen(),
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) => PopBaseScreen(),
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) => PopReturnScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) => PathParamScreen(),
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) => PathParamScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) => QueryParameterScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) => NestedScreen(child: child),
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (_, state) => NestedChildScreen(
                routeName: 'nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (_, state) => NestedChildScreen(
                routeName: 'nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (_, state) => NestedChildScreen(
                routeName: 'nested/c',
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
