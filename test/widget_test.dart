// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:learn_go/app.dart';
import 'package:learn_go/core/storage/token_storage.dart';
import 'package:learn_go/features/auth/domain/auth_tokens.dart';

void main() {
  testWidgets('默认显示登录页', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          tokenStorageProvider.overrideWithValue(_FakeTokenStorage()),
        ],
        child: const LearnGoApp(),
      ),
    );

    // 等待首帧绘制。
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(find.text('登录 LearnGo 乐学'), findsOneWidget);
  });
}

class _FakeTokenStorage extends TokenStorage {
  _FakeTokenStorage() : super(const FlutterSecureStorage());

  AuthTokens? _tokens;

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    _tokens = tokens;
  }

  @override
  Future<AuthTokens?> readTokens() async => _tokens;

  @override
  Future<void> clear() async {
    _tokens = null;
  }
}
