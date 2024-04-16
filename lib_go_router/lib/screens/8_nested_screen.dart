import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedScreen extends StatelessWidget {
  final Widget child;

  const NestedScreen({
    super.key,
    required this.child,
  });

  int getIndex(BuildContext context) {
    final uri = GoRouterState.of(context).uri.toString();

    print(uri);

    if (uri == '/nested/a')
      return 0;
    else if (uri == '/nested/b')
      return 1;
    else
      return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${GoRouterState.of(context).uri.toString()}'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: getIndex(context),
        onTap: (index) {
          if (index == 0)
            context.go('/nested/a');
          else if (index == 1)
            context.go('/nested/b');
          else
            context.go('/nested/c');
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '사람',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '알림',
          ),
        ],
      ),
    );
  }
}
