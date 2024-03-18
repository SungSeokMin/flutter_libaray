import 'package:go_router/go_router.dart';
import 'package:go_router_v7/screens/1_basic_screen.dart';
import 'package:go_router_v7/screens/2_named_screen.dart';
import 'package:go_router_v7/screens/3_push_screen.dart';
import 'package:go_router_v7/screens/4_pop_base_screen.dart';
import 'package:go_router_v7/screens/5_pop_return_screen.dart';
import 'package:go_router_v7/screens/6_path_param.screen.dart';
import 'package:go_router_v7/screens/7_query_parameter_screen.dart';
import 'package:go_router_v7/screens/8_nested_child_screen.dart';
import 'package:go_router_v7/screens/8_nested_screen.dart';
import 'package:go_router_v7/screens/9_login_screen.dart';
import 'package:go_router_v7/screens/9_private_screen.dart';
import 'package:go_router_v7/screens/root_screen.dart';

// 로그인 여부
bool authState = false;

final router = GoRouter(
  redirect: (context, state) {
    // return string -> 해당 라우트로 이동
    // return null -> 원래 이동하려던 페이지로 이동
    if (state.uri.toString() == '/login/private' && !authState) {
      return '/login';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RootScreen(),
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) => const BasicScreen(),
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) => const NamedScreen(),
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) => const PushScreen(),
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) => const PopBaseCreen(),
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) => const PopReturnScreen(),
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
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (context, state) => NestedChildScreen(routeName: '/nested/a'),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (context, state) => NestedChildScreen(routeName: '/nested/b'),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (context, state) => NestedChildScreen(routeName: '/nested/c'),
            ),
          ],
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => PrivateScreen(),
              redirect: (context, state) {
                if (!authState) return '/login2';

                return null;
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
