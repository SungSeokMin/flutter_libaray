import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7/layout/default_layout.dart';

class PopBaseCreen extends StatelessWidget {
  const PopBaseCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        ElevatedButton(
          onPressed: () {
            context.push('/pop/return');
          },
          child: Text('Push Pop Rreturn Screen'),
        ),
        ElevatedButton(
          onPressed: () async {
            final result = await context.push('/pop/return');

            print(result);
          },
          child: Text('Push Pop Rreturn Screen With State'),
        ),
      ],
    ));
  }
}
