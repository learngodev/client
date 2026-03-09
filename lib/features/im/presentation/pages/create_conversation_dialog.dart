import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go/features/auth/domain/account.dart';
import 'package:learn_go/features/im/data/repositories/im_repository.dart';
import 'package:learn_go/features/im/domain/entities/conversation_candidate.dart';

class CreateConversationDialog extends ConsumerStatefulWidget {
  const CreateConversationDialog({super.key});

  @override
  ConsumerState<CreateConversationDialog> createState() =>
      _CreateConversationDialogState();
}

class _CreateConversationDialogState
    extends ConsumerState<CreateConversationDialog> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  List<ConversationCandidate> _candidates = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    unawaited(_searchCandidates(''));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      unawaited(_searchCandidates(value));
    });
  }

  Future<void> _searchCandidates(String rawQuery) async {
    final query = rawQuery.trim();

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final candidates = await ref
          .read(imRepositoryProvider)
          .searchConversationCandidates(query);

      if (mounted) {
        setState(() {
          _candidates = candidates;
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

  Future<void> _createConversation(ConversationCandidate candidate) async {
    try {
      final conversation = await ref
          .read(imRepositoryProvider)
          .createConversation(candidate.id);

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
                  hintText: '搜索用户（支持空关键字）',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                onChanged: _onSearchChanged,
                onSubmitted: (value) => unawaited(_searchCandidates(value)),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                    ? Center(child: Text('加载失败: $_error'))
                    : _candidates.isEmpty
                    ? const Center(child: Text('暂无可发起会话的用户'))
                    : ListView.builder(
                        itemCount: _candidates.length,
                        itemBuilder: (context, index) {
                          final candidate = _candidates[index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                candidate.displayName.isNotEmpty
                                    ? candidate.displayName[0]
                                    : '?',
                              ),
                            ),
                            title: Text(candidate.displayName),
                            subtitle: Text(candidate.role.label),
                            onTap: () => _createConversation(candidate),
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
