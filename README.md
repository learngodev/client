# Learn GO · Flutter Client

跨平台学生门户，提供作业、课程安排、AI 使用统计及提醒管理等界面。本应用使用 Flutter + Riverpod + Dio，默认对接位于 `../learn-go` 的 Go 后端（Gin）。

## 功能速览

- 🔐 账号登录 / 刷新 Token（`lib/features/auth`）。
- 🏠 学生仪表盘：实时拉取作业、考试、课表、消息、AI 使用情况（`StudentApiRepository`）。
- 🔔 自定义提醒：支持创建、编辑、删除，以及“单条/批量/全部完成”操作，对应后台 `/api/v1/student/reminders*` 系列接口。
- 📝 笔记、消息、AI 会话等模块的视图与状态管理（Riverpod）。

## 环境要求

- Flutter 3.24+（Dart 3.9，参见 `pubspec.yaml`）。
- Node/Java 并非必需，但若需运行 Android 模拟器或 iOS 构建，请安装对应 SDK。
- 已运行的 Go 后端（默认 `http://localhost:8080`）。

## 快速上手

1. **安装依赖**

	```powershell
	Set-Location F:/Projects/Flutter/learn_go
	flutter pub get
	```

2. **配置后端地址**

	- 复制 `.example.env` → `.env`；
	- 设置 `API_BASE_URL`，例如：

	  ```dotenv
	  API_BASE_URL=http://localhost:8080
	  ```

	- `AppEnvironment` 会在启动时加载该值（见 `lib/core/config/app_environment.dart`）。

3. **运行应用**

	```powershell
	flutter run -d chrome   # 或 android/ios/windows/macos
	```

4. **登录测试账号**：使用后端种子数据或管理员创建的学生账号进行体验。

## 学生提醒 API 配置

`StudentDashboard` 页面通过 `StudentApiRepository` 调用以下接口：

| 操作 | HTTP | 说明 |
| --- | --- | --- |
| 列表 | `GET /api/v1/student/reminders` | 获取自定义提醒及完成状态。|
| 新建 | `POST /api/v1/student/reminders` | 创建提醒，必填 `title`。|
| 更新 | `PATCH /api/v1/student/reminders/:id` | 修改字段；也可直接传 `completed`。|
| 删除 | `DELETE /api/v1/student/reminders/:id` | 删除自定义提醒。|
| 单条完成 | `POST /api/v1/student/reminders/:id/completion` | 请求体可省略 `completed`，默认 `true`，用于“标记完成/撤销完成”。|
| 批量完成 | `POST /api/v1/student/reminders/completion/batch` | 传 `reminder_ids` 数组及 `completed`，一次操作多条记录。|
| 全量完成 | `POST /api/v1/student/reminders/completion/all` | “全部完成/重置”按钮使用；向后兼容 `/reminders/complete_all`。|

- `completed` 缺省值为 `true`，因此请求体 `{}` 也视为“标记完成”；
- 传 `false` 可撤销完成状态；
- 单条/批量接口成功时返回 `200 OK`（携带最新 reminder）或 `204 No Content`，失败时根据后端返回 `404/400`。

## 命令速查

| 场景 | PowerShell 命令 |
| --- | --- |
| 安装依赖 | ```powershell
Set-Location F:/Projects/Flutter/learn_go
flutter pub get
``` |
| 运行 web 端 | ```powershell
flutter run -d chrome
``` |
| 运行移动端（示例：Android 模拟器） | ```powershell
flutter emulators --launch Pixel_7_API_34
flutter run -d emulator-5554
``` |
| 代码静态检查 | ```powershell
flutter analyze
``` |
| 单元/组件测试 | ```powershell
flutter test
``` |

> Windows 下可以使用 `;` 串联命令，例如 `Set-Location ...; flutter test`。

## 常见问题

- **401 自动退出**：`dio_provider` 在收到 401 时会触发 `authStateProvider` 的 `signOut`，请确认后端 token 有效或重新登录。
- **网络请求未发出**：确保 `.env` 中 `API_BASE_URL` 带协议（http/https），同时已允许设备访问后端端口。
- **Reminder 操作无 effect**：检查 Go 后端是否为最新代码，确保已提供 `/reminders/completion/*` 路由。

更多 Flutter 使用说明可参考官方文档：<https://docs.flutter.dev/>。
