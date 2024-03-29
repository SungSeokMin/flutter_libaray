import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedScreen extends StatelessWidget {
  final Widget child;
  const NestedScreen({
    super.key,
    required this.child,
  });

  int getIndex(BuildContext context) {
    if (GoRouterState.of(context).uri.toString() == '/nested/a') {
      return 0;
    } else if (GoRouterState.of(context).uri.toString() == '/nested/b') {
      return 1;
    } else {
      return 2;
    }
  }

  // route들을 전체를 감싸고 있는 위젯을 만드들 수 있는게 중요
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${GoRouterState.of(context).uri.toString()}'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            context.go('/nested/a');
          } else if (index == 1) {
            context.go('/nested/b');
          } else {
            context.go('/nested/c');
          }
        },
        currentIndex: getIndex(context),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notifications',
          ),
        ],
      ),
    );
  }
}
