# Hướng Dẫn Sử Dụng Environment Configuration

## 📋 Tổng Quan

Project JuTodo đã được cấu hình để hỗ trợ 3 môi trường:
- **Development** (Dev)
- **Staging** (Stg)
- **Production** (Prod)

## 🏗️ Cấu Trúc Files

```
lib/
├── core/
│   ├── config/
│   │   └── app_config.dart          # Cấu hình cho từng môi trường
│   └── constants/
│       └── app_constants.dart       # Hằng số chung
├── main.dart                        # Entry point mặc định (Dev)
├── main_common.dart                 # Logic chung cho tất cả môi trường
├── main_dev.dart                    # Entry point cho Development
├── main_staging.dart                # Entry point cho Staging
└── main_prod.dart                   # Entry point cho Production
```

## 🚀 Cách Chạy Ứng Dụng

### Development (Mặc định)
```bash
flutter run
# hoặc
flutter run -t lib/main_dev.dart
```

### Staging
```bash
flutter run -t lib/main_staging.dart
```

### Production
```bash
flutter run -t lib/main_prod.dart
```

## 📱 Build APK/IPA

### Android APK

**Development:**
```bash
flutter build apk -t lib/main_dev.dart
```

**Staging:**
```bash
flutter build apk -t lib/main_staging.dart
```

**Production:**
```bash
flutter build apk -t lib/main_prod.dart --release
```

### iOS

**Development:**
```bash
flutter build ios -t lib/main_dev.dart
```

**Staging:**
```bash
flutter build ios -t lib/main_staging.dart
```

**Production:**
```bash
flutter build ios -t lib/main_prod.dart --release
```

## ⚙️ Cấu Hình Môi Trường

Mở file `lib/core/config/app_config.dart` để chỉnh sửa cấu hình:

```dart
case Environment.dev:
  return AppConfig._(
    environment: env,
    apiBaseUrl: 'https://api-dev.example.com',  // ← Thay đổi URL
    appName: 'JuTodo (Dev)',
    enableLogging: true,
    apiTimeout: 30,
  );
```

### Các Thuộc Tính Có Thể Cấu Hình:

| Thuộc tính | Mô tả | Dev | Staging | Prod |
|------------|-------|-----|---------|------|
| `apiBaseUrl` | URL API server | api-dev.example.com | api-staging.example.com | api.example.com |
| `appName` | Tên hiển thị app | JuTodo (Dev) | JuTodo (Staging) | JuTodo |
| `enableLogging` | Bật/tắt logging | `true` | `true` | `false` |
| `apiTimeout` | Timeout (giây) | 30 | 30 | 30 |

## 💻 Sử Dụng Trong Code

### Lấy Cấu Hình Hiện Tại

```dart
import 'package:ju_reminder/core/config/app_config.dart';

// Lấy config instance
final config = AppConfig.instance;

// Sử dụng các thuộc tính
print(config.apiBaseUrl);        // https://api-dev.example.com
print(config.appName);            // JuTodo (Dev)
print(config.enableLogging);      // true
```

### Kiểm Tra Môi Trường

```dart
if (AppConfig.instance.isDev) {
  print('Đang chạy ở môi trường Development');
}

if (AppConfig.instance.isProduction) {
  // Tắt debug features
}
```

### Sử Dụng Trong Dio (HTTP Client)

File `di/locator.dart` sẽ tự động sử dụng `apiBaseUrl` từ config:

```dart
import 'package:ju_reminder/core/config/app_config.dart';

void setupGetItLocator() {
  // Dio với config từ environment
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.instance.apiBaseUrl,  // ← Tự động lấy từ config
      connectTimeout: Duration(seconds: AppConfig.instance.apiTimeout),
      receiveTimeout: Duration(seconds: AppConfig.instance.apiTimeout),
    ));
    
    // Chỉ log trong dev/staging
    if (AppConfig.instance.enableLogging) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
    
    return dio;
  });
}
```

## 🎯 VS Code Launch Configuration

Tạo file `.vscode/launch.json` để chạy nhanh từ VS Code:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "JuTodo (Dev)",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_dev.dart"
    },
    {
      "name": "JuTodo (Staging)",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_staging.dart"
    },
    {
      "name": "JuTodo (Production)",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_prod.dart"
    }
  ]
}
```

## 🔧 Thêm Cấu Hình Mới

Nếu cần thêm cấu hình (ví dụ: `apiKey`, `analyticsEnabled`):

1. Thêm property vào class `AppConfig`:

```dart
class AppConfig {
  final String apiKey;
  final bool analyticsEnabled;
  
  AppConfig._({
    // ... existing properties
    required this.apiKey,
    required this.analyticsEnabled,
  });
}
```

2. Cập nhật từng môi trường:

```dart
case Environment.dev:
  return AppConfig._(
    // ... existing config
    apiKey: 'dev-api-key-123',
    analyticsEnabled: false,
  );
```

## 📝 Best Practices

1. **Không commit API keys thật vào Git**
   - Sử dụng environment variables hoặc `.env` files
   - Thêm vào `.gitignore`

2. **Logging chỉ trong Dev/Staging**
   ```dart
   if (AppConfig.instance.enableLogging) {
     debugPrint('Debug info');
   }
   ```

3. **Khác biệt rõ ràng giữa các môi trường**
   - Dev: Màu xanh, có badge "(Dev)"
   - Staging: Màu vàng, có badge "(Staging)"
   - Prod: Màu chính thức, không có badge

4. **Test kỹ trước khi build Production**
   ```bash
   # Test staging trước
   flutter run -t lib/main_staging.dart
   
   # Sau đó build production
   flutter build apk -t lib/main_prod.dart --release
   ```

## 🐛 Troubleshooting

### Lỗi: "AppConfig chưa được khởi tạo"
**Nguyên nhân:** Gọi `AppConfig.instance` trước khi initialize

**Giải pháp:** Đảm bảo `AppConfig.initialize()` được gọi trong `main()`:
```dart
void main() {
  AppConfig.initialize(Environment.dev);
  mainCommon();
}
```

### Lỗi: API không kết nối được
**Kiểm tra:**
1. URL trong `app_config.dart` có đúng không?
2. Môi trường đang chạy có đúng không?
```dart
print(AppConfig.instance.apiBaseUrl);
```

## 📚 Tài Liệu Tham Khảo

- [Flutter Build Modes](https://docs.flutter.dev/testing/build-modes)
- [Environment Configuration Best Practices](https://docs.flutter.dev/deployment/flavors)
