import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1. 어떤 Provider를 사용할지 결정할 고민하지 않아도 된다.
final _testProvider = Provider<String>((ref) => 'Hello World');

@riverpod
String gState(GStateRef ref) {
  return 'Hello World';
}

// 2. Parameter(Family)
