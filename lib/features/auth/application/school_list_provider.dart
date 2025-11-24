import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/auth_repository.dart';
import '../domain/school.dart';

final schoolListProvider = FutureProvider<List<School>>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  return repository.fetchSchools();
});
