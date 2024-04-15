import 'package:flutter/material.dart';
import 'package:go_router_v7/route/router.dart';

void main() {
  return runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
