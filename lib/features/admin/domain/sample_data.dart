import 'package:flutter/material.dart';

enum AdminAccountRole { teacher, student }

extension AdminAccountRoleX on AdminAccountRole {
  String get label {
    return switch (this) {
      AdminAccountRole.teacher => '教师账号',
      AdminAccountRole.student => '学生账号',
    };
  }

  IconData get icon {
    return switch (this) {
      AdminAccountRole.teacher => Icons.co_present_outlined,
      AdminAccountRole.student => Icons.school_outlined,
    };
  }
}

class AdminAccountItem {
  const AdminAccountItem({
    required this.id,
    required this.role,
    required this.name,
    required this.identifier,
    required this.email,
    required this.department,
    required this.locked,
    required this.requiresPasswordReset,
    required this.lastActiveLabel,
    this.className,
    this.phone,
    this.note,
  });

  final String id;
  final AdminAccountRole role;
  final String name;
  final String identifier;
  final String email;
  final String department;
  final bool locked;
  final bool requiresPasswordReset;
  final String lastActiveLabel;
  final String? className;
  final String? phone;
  final String? note;

  String get roleLabel => role.label;

  String get structureLabel {
    if (className == null || className!.isEmpty) {
      return department;
    }
    return '$department · $className';
  }

  String get statusLabel {
    if (locked) {
      return '已锁定';
    }
    if (requiresPasswordReset) {
      return '待重置密码';
    }
    return '正常';
  }

  Color statusColor(ThemeData theme) {
    if (locked) {
      return theme.colorScheme.error;
    }
    if (requiresPasswordReset) {
      return theme.colorScheme.tertiary;
    }
    return theme.colorScheme.primary;
  }

  bool matchesQuery(String query) {
    final lower = query.trim().toLowerCase();
    if (lower.isEmpty) {
      return true;
    }
    return name.toLowerCase().contains(lower) ||
        identifier.toLowerCase().contains(lower) ||
        email.toLowerCase().contains(lower) ||
        department.toLowerCase().contains(lower) ||
        (className?.toLowerCase().contains(lower) ?? false) ||
        (phone?.toLowerCase().contains(lower) ?? false);
  }
}

class AdminAccountInvite {
  const AdminAccountInvite({
    required this.email,
    required this.role,
    required this.invitedBy,
    required this.createdAtLabel,
    required this.expiresAtLabel,
  });

  final String email;
  final AdminAccountRole role;
  final String invitedBy;
  final String createdAtLabel;
  final String expiresAtLabel;

  String get roleLabel => role.label;
}

const List<AdminAccountItem> adminAccountItems = [
  AdminAccountItem(
    id: 'T-1001',
    role: AdminAccountRole.teacher,
    name: '张老师',
    identifier: 'tzhang',
    email: 'tzhang@school.edu.cn',
    department: '数学学院',
    className: '线性代数教研组',
    phone: '138****1024',
    locked: false,
    requiresPasswordReset: false,
    lastActiveLabel: '昨天 21:30',
    note: '负责 23 级计科班课程',
  ),
  AdminAccountItem(
    id: 'T-1002',
    role: AdminAccountRole.teacher,
    name: '李老师',
    identifier: 'lli',
    email: 'lli@school.edu.cn',
    department: '数学学院',
    className: '数学竞赛辅导',
    phone: '139****8842',
    locked: false,
    requiresPasswordReset: true,
    lastActiveLabel: '今日 10:12',
    note: '最近重置密码请求',
  ),
  AdminAccountItem(
    id: 'S-2301',
    role: AdminAccountRole.student,
    name: '王同学',
    identifier: '2023012301',
    email: 's2301@school.edu.cn',
    department: '数学学院',
    className: '2023 级计科 1 班',
    phone: '187****5566',
    locked: true,
    requiresPasswordReset: false,
    lastActiveLabel: '上周五',
    note: '连续三次输错密码已锁定',
  ),
  AdminAccountItem(
    id: 'S-2308',
    role: AdminAccountRole.student,
    name: '陈同学',
    identifier: '2023012308',
    email: 's2308@school.edu.cn',
    department: '数学学院',
    className: '2023 级计科 2 班',
    phone: '186****3344',
    locked: false,
    requiresPasswordReset: false,
    lastActiveLabel: '今日 08:40',
    note: '申请加入教务实践项目',
  ),
  AdminAccountItem(
    id: 'S-2415',
    role: AdminAccountRole.student,
    name: '刘同学',
    identifier: '2023021415',
    email: 's2415@school.edu.cn',
    department: '数学学院',
    className: '2023 级大数据 1 班',
    phone: '185****9988',
    locked: false,
    requiresPasswordReset: true,
    lastActiveLabel: '3 天前',
    note: '第一次登录需重置密码',
  ),
];

const List<AdminAccountInvite> adminAccountInvites = [
  AdminAccountInvite(
    email: 'newteacher@school.edu.cn',
    role: AdminAccountRole.teacher,
    invitedBy: '系统管理员',
    createdAtLabel: '10-20 09:10',
    expiresAtLabel: '10-27 09:10',
  ),
  AdminAccountInvite(
    email: 'intern2023@school.edu.cn',
    role: AdminAccountRole.student,
    invitedBy: '张老师',
    createdAtLabel: '10-18 14:25',
    expiresAtLabel: '10-25 14:25',
  ),
];

class AdminOssCredential {
  const AdminOssCredential({
    required this.name,
    required this.endpoint,
    required this.region,
    required this.bucket,
    required this.accessKeyMasked,
    required this.directoryPrefix,
    required this.allowPublicRead,
    required this.allowMultipartUpload,
    required this.createdAtLabel,
    required this.lastRotatedLabel,
    this.isPrimary = false,
    this.active = true,
  });

  final String name;
  final String endpoint;
  final String region;
  final String bucket;
  final String accessKeyMasked;
  final String directoryPrefix;
  final bool allowPublicRead;
  final bool allowMultipartUpload;
  final String createdAtLabel;
  final String lastRotatedLabel;
  final bool isPrimary;
  final bool active;

  String get statusLabel => active ? '启用' : '停用';

  Color statusColor(ThemeData theme) {
    return active ? theme.colorScheme.primary : theme.colorScheme.outline;
  }
}

enum AdminOssPolicyStatus { enabled, readOnly, disabled }

extension AdminOssPolicyStatusX on AdminOssPolicyStatus {
  String get label {
    return switch (this) {
      AdminOssPolicyStatus.enabled => '启用',
      AdminOssPolicyStatus.readOnly => '仅读',
      AdminOssPolicyStatus.disabled => '已禁用',
    };
  }

  Color color(ThemeData theme) {
    return switch (this) {
      AdminOssPolicyStatus.enabled => theme.colorScheme.primary,
      AdminOssPolicyStatus.readOnly => theme.colorScheme.tertiary,
      AdminOssPolicyStatus.disabled => theme.colorScheme.outline,
    };
  }
}

class AdminOssPolicy {
  const AdminOssPolicy({
    required this.name,
    required this.description,
    required this.status,
    required this.lastUpdatedLabel,
    required this.appliesTo,
  });

  final String name;
  final String description;
  final AdminOssPolicyStatus status;
  final String lastUpdatedLabel;
  final String appliesTo;
}

class AdminOssAuditLog {
  const AdminOssAuditLog({
    required this.action,
    required this.operator,
    required this.timeLabel,
    required this.detail,
  });

  final String action;
  final String operator;
  final String timeLabel;
  final String detail;
}

const List<AdminOssCredential> adminOssCredentials = [
  AdminOssCredential(
    name: '主凭证 · 生产环境',
    endpoint: 'oss-cn-hangzhou.aliyuncs.com',
    region: '华东 1',
    bucket: 'learn-go-prod',
    accessKeyMasked: 'LTAI5t****f8w',
    directoryPrefix: 'prod/',
    allowPublicRead: false,
    allowMultipartUpload: true,
    createdAtLabel: '创建于 2024-08-12',
    lastRotatedLabel: '最后轮换：30 天前',
    isPrimary: true,
    active: true,
  ),
  AdminOssCredential(
    name: '备份凭证 · 教师资料',
    endpoint: 'oss-cn-hangzhou.aliyuncs.com',
    region: '华东 1',
    bucket: 'learn-go-teacher-materials',
    accessKeyMasked: 'STS9lE****s2Q',
    directoryPrefix: 'teacher/',
    allowPublicRead: true,
    allowMultipartUpload: true,
    createdAtLabel: '创建于 2024-10-01',
    lastRotatedLabel: '最后轮换：12 天前',
    active: true,
  ),
  AdminOssCredential(
    name: '测试凭证',
    endpoint: 'oss-cn-beijing.aliyuncs.com',
    region: '华北 2',
    bucket: 'learn-go-dev',
    accessKeyMasked: 'TMPvwq****0Px',
    directoryPrefix: 'dev/',
    allowPublicRead: false,
    allowMultipartUpload: false,
    createdAtLabel: '创建于 2023-12-05',
    lastRotatedLabel: '最后轮换：90 天前',
    active: false,
  ),
];

const List<AdminOssPolicy> adminOssPolicies = [
  AdminOssPolicy(
    name: '学生作业上传策略',
    description: '限制文件大小至 50MB，允许 PDF、图片与压缩包格式。',
    status: AdminOssPolicyStatus.enabled,
    lastUpdatedLabel: '更新于 2024-09-25',
    appliesTo: '学生端 · 作业上传',
  ),
  AdminOssPolicy(
    name: '教师资料共享策略',
    description: '开启只读公开访问，用于课堂资料分享。',
    status: AdminOssPolicyStatus.readOnly,
    lastUpdatedLabel: '更新于 2024-10-15',
    appliesTo: '教师端 · 资料管理',
  ),
  AdminOssPolicy(
    name: '内部备份策略',
    description: '仅允许管理端上传，禁止外部访问。',
    status: AdminOssPolicyStatus.disabled,
    lastUpdatedLabel: '更新于 2024-07-02',
    appliesTo: '运维备份任务',
  ),
];

const List<AdminOssAuditLog> adminOssAuditLogs = [
  AdminOssAuditLog(
    action: '轮换 AccessKey',
    operator: '系统管理员',
    timeLabel: '10-18 20:35',
    detail: '主凭证执行自动轮换并同步至应用配置。',
  ),
  AdminOssAuditLog(
    action: '修改公开访问策略',
    operator: '张老师',
    timeLabel: '10-15 09:12',
    detail: '教师资料共享策略切换为只读公开访问。',
  ),
  AdminOssAuditLog(
    action: '禁用测试凭证',
    operator: '系统管理员',
    timeLabel: '09-30 17:05',
    detail: '测试凭证在上线后被手动禁用。',
  ),
];

class AdminSystemSwitch {
  const AdminSystemSwitch({
    required this.title,
    required this.description,
    required this.enabled,
    required this.lastUpdatedLabel,
    required this.responsible,
    required this.icon,
    this.tags = const [],
    this.environment = '生产环境',
  });

  final String title;
  final String description;
  final bool enabled;
  final String lastUpdatedLabel;
  final String responsible;
  final IconData icon;
  final List<String> tags;
  final String environment;
}

class AdminSystemParameter {
  const AdminSystemParameter({
    required this.key,
    required this.value,
    required this.scope,
    required this.description,
    required this.lastUpdatedLabel,
    this.locked = false,
  });

  final String key;
  final String value;
  final String scope;
  final String description;
  final String lastUpdatedLabel;
  final bool locked;
}

enum AdminSystemBroadcastStatus { scheduled, sent, draft }

extension AdminSystemBroadcastStatusX on AdminSystemBroadcastStatus {
  String get label {
    return switch (this) {
      AdminSystemBroadcastStatus.scheduled => '待发送',
      AdminSystemBroadcastStatus.sent => '已发送',
      AdminSystemBroadcastStatus.draft => '草稿',
    };
  }

  Color color(ThemeData theme) {
    return switch (this) {
      AdminSystemBroadcastStatus.scheduled => theme.colorScheme.primary,
      AdminSystemBroadcastStatus.sent => theme.colorScheme.tertiary,
      AdminSystemBroadcastStatus.draft => theme.colorScheme.outline,
    };
  }
}

class AdminSystemBroadcast {
  const AdminSystemBroadcast({
    required this.title,
    required this.messagePreview,
    required this.status,
    required this.targetLabel,
    required this.scheduleLabel,
    required this.createdBy,
    this.pinned = false,
  });

  final String title;
  final String messagePreview;
  final AdminSystemBroadcastStatus status;
  final String targetLabel;
  final String scheduleLabel;
  final String createdBy;
  final bool pinned;
}

class AdminSystemAuditLog {
  const AdminSystemAuditLog({
    required this.category,
    required this.action,
    required this.operator,
    required this.timeLabel,
    required this.detail,
  });

  final String category;
  final String action;
  final String operator;
  final String timeLabel;
  final String detail;
}

const List<AdminSystemSwitch> adminSystemSwitches = [
  AdminSystemSwitch(
    title: '夜间维护模式',
    description: '在每日 23:30 - 06:30 内限制学生端访问，教师端保持可用。',
    enabled: true,
    lastUpdatedLabel: '最近更新：2024-10-10 · 由 系统管理员',
    responsible: '运维团队',
    icon: Icons.nightlight_round,
    tags: ['计划任务', '自动恢复'],
  ),
  AdminSystemSwitch(
    title: '作业提交提醒推送',
    description: '距离截止时间 1 小时自动推送提醒至学生端与家长端。',
    enabled: true,
    lastUpdatedLabel: '最近更新：2024-09-28 · 由 教务处',
    responsible: '教务处',
    icon: Icons.notifications_active_outlined,
    tags: ['消息服务'],
  ),
  AdminSystemSwitch(
    title: '实验特性：AI 批改建议',
    description: '允许教师端使用智能批改建议，需单独开通权限。',
    enabled: false,
    lastUpdatedLabel: '最近更新：2024-10-18 · 由 创新组',
    responsible: '创新组',
    icon: Icons.auto_awesome_outlined,
    tags: ['实验功能', '需申请'],
  ),
];

const List<AdminSystemParameter> adminSystemParameters = [
  AdminSystemParameter(
    key: 'MAX_UPLOAD_SIZE_MB',
    value: '80',
    scope: '文件上传服务',
    description: '限制单个文件上传大小，单位 MB。',
    lastUpdatedLabel: '更新于 2024-09-30',
    locked: true,
  ),
  AdminSystemParameter(
    key: 'DEFAULT_TIMEZONE',
    value: 'Asia/Shanghai',
    scope: '全局时区',
    description: '用于课程表、作业截止时间的默认时区。',
    lastUpdatedLabel: '更新于 2024-08-20',
  ),
  AdminSystemParameter(
    key: 'SESSION_IDLE_TIMEOUT',
    value: '30m',
    scope: '认证服务',
    description: '后台管理端空闲自动退出时长。',
    lastUpdatedLabel: '更新于 2024-10-05',
  ),
  AdminSystemParameter(
    key: 'FEATURE_FLAGS',
    value: 'ai_grading,live_classroom',
    scope: '功能开关',
    description: '为指定院系开启的实验功能列表。',
    lastUpdatedLabel: '更新于 2024-10-18',
  ),
];

const List<AdminSystemBroadcast> adminSystemBroadcasts = [
  AdminSystemBroadcast(
    title: '10 月系统升级通知',
    messagePreview: '定于 10-28 02:00 - 03:00 进行数据库维护，期间服务可能短暂波动。',
    status: AdminSystemBroadcastStatus.scheduled,
    targetLabel: '全体教师、管理员',
    scheduleLabel: '计划发送：10-25 09:00',
    createdBy: '系统管理员',
    pinned: true,
  ),
  AdminSystemBroadcast(
    title: '作业批改新功能上线',
    messagePreview: 'AI 批改建议将在试点院系开放试用，如需参与请向教务处申请。',
    status: AdminSystemBroadcastStatus.draft,
    targetLabel: '教师端 · 试点院系',
    scheduleLabel: '草稿保存：10-19 16:20',
    createdBy: '创新组',
  ),
  AdminSystemBroadcast(
    title: '9 月例行巡检完成',
    messagePreview: '服务性能已恢复正常，如遇问题可提交工单。',
    status: AdminSystemBroadcastStatus.sent,
    targetLabel: '全体用户',
    scheduleLabel: '发送时间：09-30 07:30',
    createdBy: '运维团队',
  ),
];

const List<AdminSystemAuditLog> adminSystemAuditLogs = [
  AdminSystemAuditLog(
    category: '平台参数',
    action: '修改 MAX_UPLOAD_SIZE_MB',
    operator: '系统管理员',
    timeLabel: '10-05 11:36',
    detail: '将文件上传限制调整为 80MB，并同步至 CDN 缓存。',
  ),
  AdminSystemAuditLog(
    category: '安全策略',
    action: '启用夜间维护模式',
    operator: '运维团队',
    timeLabel: '10-10 22:15',
    detail: '设置自动开启与关闭时间，已推送至状态页。',
  ),
  AdminSystemAuditLog(
    category: '通知广播',
    action: '发布 9 月巡检完成公告',
    operator: '运维团队',
    timeLabel: '09-30 07:32',
    detail: '公告同步至网页端公告栏与短信渠道。',
  ),
];
