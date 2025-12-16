---
description: Khởi chạy Flutter project
---

# Workflow: Khởi chạy Flutter Project

## Yêu cầu trước khi chạy
- Flutter SDK đã được cài đặt và thêm vào PATH
- Có ít nhất một thiết bị/emulator/simulator đang chạy

## Các bước thực hiện

### 1. Kiểm tra Flutter đã được cài đặt
```powershell
flutter --version
```

### 2. Kiểm tra trạng thái môi trường Flutter
```powershell
flutter doctor
```

### 3. Cài đặt dependencies
// turbo
```powershell
flutter pub get
```

### 4. Kiểm tra các thiết bị có sẵn
// turbo
```powershell
flutter devices
```

### 5. Chạy app (chọn một trong các option sau)

#### Option A: Chạy trên Chrome (Web)
```powershell
flutter run -d chrome
```

#### Option B: Chạy trên Windows Desktop
```powershell
flutter run -d windows
```

#### Option C: Chạy trên Android Emulator
```powershell
flutter run -d android
```

#### Option D: Chạy trên iOS Simulator (chỉ macOS)
```powershell
flutter run -d ios
```

#### Option E: Để Flutter tự chọn thiết bị
```powershell
flutter run
```

## Hot Reload
Khi app đang chạy, bạn có thể:
- Nhấn `r` để hot reload
- Nhấn `R` để hot restart
- Nhấn `q` để thoát

## Troubleshooting

### Nếu Flutter không được nhận diện
1. Kiểm tra Flutter đã được thêm vào PATH chưa
2. Khởi động lại terminal/PowerShell
3. Hoặc sử dụng đường dẫn đầy đủ: `C:\path\to\flutter\bin\flutter`

### Nếu không có thiết bị nào
1. Mở Android Studio và khởi động emulator
2. Hoặc chạy trên Chrome: `flutter run -d chrome`
3. Hoặc chạy trên Windows: `flutter run -d windows`

### Nếu có lỗi dependencies
```powershell
flutter clean
flutter pub get
```
