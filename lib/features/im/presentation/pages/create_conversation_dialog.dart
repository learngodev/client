import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go/features/im/data/repositories/im_repository.dart';
import 'package:learn_go/features/auth/domain/account.dart';
import 'package:learn_go/features/auth/application/auth_controller.dart';

class CreateConversationDialog extends ConsumerStatefulWidget {
  const CreateConversationDialog({super.key});

  @override
  ConsumerState<CreateConversationDialog> createState() =>
      _CreateConversationDialogState();
}

class _CreateConversationDialogState
    extends ConsumerState<CreateConversationDialog> {
  final _searchController = TextEditingController();
  List<Account> _members = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadMembers([String? query]) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final members = await ref
          .read(imRepositoryProvider)
          .getSchoolMembers(query: query);

      final currentUserId = ref.read(authStateProvider).account?.id;
      final filteredMembers = members
          .where((m) => m.id != currentUserId)
          .toList();

      if (mounted) {
        setState(() {
          _members = filteredMembers;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _createConversation(Account member) async {
    try {
      final conversation = await ref
          .read(imRepositoryProvider)
          .createConversation(member.id);

      if (mounted) {
        Navigator.pop(context);
        context.push('/conversations/${conversation.id}');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('创建会话失败: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('发起新会话', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: '搜索用户...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                onSubmitted: _loadMembers,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                    ? Center(child: Text('加载失败: $_error'))
                    : _members.isEmpty
                    ? const Center(child: Text('未找到用户'))
                    : ListView.builder(
                        itemCount: _members.length,
                        itemBuilder: (context, index) {
                          final member = _members[index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                member.displayName.isNotEmpty
                                    ? member.displayName[0]
                                    : '?',
                              ),
                            ),
                            title: Text(member.displayName),
                            subtitle: Text(member.role.label),
                            onTap: () => _createConversation(member),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('取消'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
