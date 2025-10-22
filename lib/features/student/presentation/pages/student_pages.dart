import 'package:flutter/material.dart';

class StudentOverviewPage extends StatelessWidget {
  const StudentOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Placeholder(title: '学习空间', description: '查看今日任务、未完成作业、课程提醒。');
  }
}

class StudentSchedulePage extends StatelessWidget {
  const StudentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Placeholder(
      title: '课表',
      description: '周视图、日视图切换，支持查看教室与教师信息。',
    );
  }
}

class StudentAssignmentsPage extends StatelessWidget {
  const StudentAssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Placeholder(title: '作业中心', description: '提交作业、查看已批改、补交权限控制。');
  }
}

class StudentExamsPage extends StatelessWidget {
  const StudentExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Placeholder(title: '考试安排', description: '查看考试倒计时、准考证信息和结果。');
  }
}

class StudentNotesPage extends StatelessWidget {
  const StudentNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Placeholder(title: '随手笔记', description: '同步草稿、回收站、公开共享内容。');
  }
}

class StudentMessagesPage extends StatelessWidget {
  const StudentMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Placeholder(title: '消息', description: '即时聊天、系统通知、好友请求管理。');
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('即将接入真实数据与交互。'),
        ],
      ),
    );
  }
}
