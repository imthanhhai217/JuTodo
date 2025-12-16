# JuTodo - Context Dự Án

## Tổng Quan
JuTodo là ứng dụng quản lý sản phẩm được xây dựng bằng Flutter với kiến trúc MVVM.

## Mục Đích
- Quản lý danh sách sản phẩm
- Xem chi tiết sản phẩm
- Thực hiện các thao tác CRUD với sản phẩm

## Tech Stack
- **Framework**: Flutter
- **Architecture**: MVVM
- **State Management**: BLoC
- **DI**: GetIt
- **HTTP Client**: Dio
- **Immutability**: Equatable

## API Endpoint
- Base URL: (Cập nhật URL API của bạn ở đây)
- Endpoints:
  - GET /products - Lấy danh sách sản phẩm
  - GET /products/:id - Lấy chi tiết sản phẩm
  - POST /products - Tạo sản phẩm mới
  - PUT /products/:id - Cập nhật sản phẩm
  - DELETE /products/:id - Xóa sản phẩm

## Cấu Trúc Hiện Tại

### Features Đã Có:
- ✅ Product Detail (Chi tiết sản phẩm)

### Features Cần Làm:
- ⏳ Product List (Danh sách sản phẩm)
- ⏳ Create Product (Tạo sản phẩm)
- ⏳ Update Product (Cập nhật sản phẩm)
- ⏳ Delete Product (Xóa sản phẩm)

## Dependencies Chính
```yaml
dependencies:
  flutter_bloc: ^8.x.x
  equatable: ^2.x.x
  dio: ^5.x.x
  get_it: ^7.x.x
```

## Ghi Chú
- Dự án sử dụng Dart 3.0+ với pattern matching
- Tuân thủ Material Design guidelines
- Code phải pass analysis_options.yaml
