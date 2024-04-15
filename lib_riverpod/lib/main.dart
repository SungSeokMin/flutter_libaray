import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_tutorial/riverpod/provider_observer.dart';
import 'package:flutter_state_tutorial/screen/home_screen.dart';

void main() {
  return runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
