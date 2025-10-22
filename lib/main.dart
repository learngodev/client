import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_go/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _loadEnv();

  runApp(ProviderScope(child: const LearnGoApp()));
}

Future<void> _loadEnv() async {
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // 如果没有找到 .env 文件则忽略，后续可使用默认配置或远程配置。
  }
}
