# Cài Đặt Dự Án Flutter - JuTodo

## Công Nghệ Sử Dụng

Dự án này sử dụng kiến trúc và thư viện sau:

- **Kiến trúc**: MVVM (Model-View-ViewModel)
- **Quản lý State**: BLoC (Business Logic Component) pattern
- **Dependency Injection**: GetIt
- **HTTP Client**: Dio
- **Tính bất biến**: Equatable
- **Ngôn ngữ**: Dart

## Cấu Trúc Dự Án

```
lib/
├── data/                    # Tầng dữ liệu (MVVM Model)
│   ├── models/             # Data models (DTOs)
│   ├── repositories/       # Triển khai Repository
│   └── datasources/        # Nguồn dữ liệu Remote & Local
├── domain/                  # Tầng domain (tùy chọn)
│   ├── entities/           # Business entities
│   ├── repositories/       # Giao diện Repository
│   └── usecases/           # Use cases logic nghiệp vụ
├── presentation/            # Tầng giao diện (MVVM View + ViewModel)
│   ├── [feature]/
│   │   ├── bloc/           # BLoC (ViewModel)
│   │   │   ├── [feature]_bloc.dart
│   │   │   ├── [feature]_event.dart
│   │   │   └── [feature]_state.dart
│   │   └── [feature]_page.dart  # UI (View)
│   └── widgets/            # Widgets tái sử dụng
├── di/                      # Dependency Injection
│   └── injection.dart      # Cài đặt GetIt service locator
├── constants/              # Hằng số ứng dụng
├── themes/                 # Themes ứng dụng
└── main.dart               # Entry point
```

## Hướng Dẫn Code

### 1. Quy Tắc BLoC Pattern

#### Đặt Tên Event
- Sử dụng tên mô tả với động từ hành động
- Thêm hậu tố với tên feature
- Ví dụ: `FetchProductById`, `UpdateProduct`, `DeleteProduct`

```dart
// ✅ Tốt
abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
  
  @override
  List<Object?> get props => [];
}

class FetchProductById extends ProductDetailEvent {
  final String productId;
  
  const FetchProductById(this.productId);
  
  @override
  List<Object?> get props => [productId];
}
```

#### Đặt Tên State
- Sử dụng tên state mô tả rõ ràng
- Các state phổ biến: `Initial`, `Loading`, `Loaded`, `Error`
- Bao gồm dữ liệu trong state khi cần

```dart
// ✅ Tốt
abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
  
  @override
  List<Object?> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final Product product;
  
  const ProductDetailLoaded(this.product);
  
  @override
  List<Object?> get props => [product];
}

class ProductDetailError extends ProductDetailState {
  final String message;
  
  const ProductDetailError(this.message);
  
  @override
  List<Object?> get props => [message];
}
```

#### Triển Khai BLoC
- Sử dụng `on<Event>` handlers
- Xử lý lỗi đúng cách
- Dùng `emit` để cập nhật state
- Giữ logic nghiệp vụ trong repositories/use cases

```dart
// ✅ Tốt
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository _repository;
  
  ProductDetailBloc(this._repository) : super(ProductDetailInitial()) {
    on<FetchProductById>(_onFetchProductById);
  }
  
  Future<void> _onFetchProductById(
    FetchProductById event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(ProductDetailLoading());
    try {
      final product = await _repository.getProductById(event.productId);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }
}
```

### 2. Sử Dụng Equatable

- Luôn extend `Equatable` cho events, states, và models
- Override `props` getter với tất cả các field dùng để so sánh
- Sử dụng `const` constructors khi có thể

```dart
// ✅ Tốt
class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  
  const Product({
    required this.id,
    required this.name,
    required this.price,
  });
  
  @override
  List<Object?> get props => [id, name, price];
}
```

### 3. Cấu Hình Dio

#### Cài Đặt trong DI
```dart
// ✅ Tốt - trong di/injection.dart
final getIt = GetIt.instance;

void setupDependencies() {
  // Dio
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
    
    // Thêm interceptors
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    
    return dio;
  });
  
  // Data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt()),
  );
  
  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );
  
  // BLoCs - Factory cho instance mới
  getIt.registerFactory<ProductDetailBloc>(
    () => ProductDetailBloc(getIt()),
  );
}
```

#### Triển Khai Repository
```dart
// ✅ Tốt
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;
  
  ProductRepositoryImpl(this._remoteDataSource);
  
  @override
  Future<Product> getProductById(String id) async {
    try {
      return await _remoteDataSource.getProductById(id);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }
  
  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Hết thời gian kết nối');
      case DioExceptionType.badResponse:
        return Exception('Lỗi server: ${error.response?.statusCode}');
      default:
        return Exception('Lỗi mạng: ${error.message}');
    }
  }
}
```

### 4. GetIt Dependency Injection

#### Các Loại Đăng Ký
- `registerSingleton`: Instance duy nhất được tạo ngay lập tức
- `registerLazySingleton`: Instance duy nhất được tạo khi sử dụng lần đầu
- `registerFactory`: Instance mới mỗi lần gọi

```dart
// ✅ Cách dùng tốt
void setupDependencies() {
  // Singletons cho services
  getIt.registerLazySingleton<Dio>(() => createDio());
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );
  
  // Factories cho BLoCs (instance mới mỗi màn hình)
  getIt.registerFactory<ProductDetailBloc>(
    () => ProductDetailBloc(getIt()),
  );
  
  // Factories cho use cases (nếu dùng Clean Architecture)
  getIt.registerFactory<GetProductByIdUseCase>(
    () => GetProductByIdUseCase(getIt()),
  );
}
```

#### Sử Dụng trong Widgets
```dart
// ✅ Tốt - Dùng BlocProvider với GetIt
class ProductDetailPage extends StatelessWidget {
  final String productId;
  
  const ProductDetailPage({required this.productId, Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailBloc>()
        ..add(FetchProductById(productId)),
      child: const _ProductDetailView(),
    );
  }
}
```

### 5. Hướng Dẫn Model & Entity

#### Data Models (DTOs)
```dart
// ✅ Tốt - trong data/models/
class ProductModel extends Equatable {
  final String id;
  final String name;
  final double price;
  
  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
  });
  
  // Từ JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
  
  // Sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
  
  // Sang Entity (nếu dùng domain layer)
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      price: price,
    );
  }
  
  @override
  List<Object?> get props => [id, name, price];
}
```

### 6. Xử Lý Lỗi

```dart
// ✅ Tốt - Custom exceptions
class ServerException implements Exception {
  final String message;
  final int? statusCode;
  
  ServerException(this.message, [this.statusCode]);
}

class NetworkException implements Exception {
  final String message;
  
  NetworkException(this.message);
}

// Trong repository
Future<Product> getProductById(String id) async {
  try {
    final response = await _dio.get('/products/$id');
    return ProductModel.fromJson(response.data).toEntity();
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      throw NetworkException('Hết thời gian kết nối');
    }
    if (e.response?.statusCode == 404) {
      throw ServerException('Không tìm thấy sản phẩm', 404);
    }
    throw ServerException('Lỗi server', e.response?.statusCode);
  }
}
```

### 7. Best Practices Tầng UI

```dart
// ✅ Tốt - Tách view khỏi page
class ProductDetailPage extends StatelessWidget {
  final String productId;
  
  const ProductDetailPage({required this.productId, Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailBloc>()
        ..add(FetchProductById(productId)),
      child: const _ProductDetailView(),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chi Tiết Sản Phẩm')),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return switch (state) {
            ProductDetailInitial() => const SizedBox.shrink(),
            ProductDetailLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            ProductDetailLoaded(:final product) => _buildProductDetail(product),
            ProductDetailError(:final message) => Center(
                child: Text('Lỗi: $message'),
              ),
          };
        },
      ),
    );
  }
  
  Widget _buildProductDetail(Product product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.name, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text('\$${product.price}', style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
```

## Các Pattern Phổ Biến

### 1. Cấu Trúc Feature
Khi tạo feature mới, tuân theo cấu trúc này:

```
lib/presentation/[feature_name]/
├── bloc/
│   ├── [feature]_bloc.dart
│   ├── [feature]_event.dart
│   └── [feature]_state.dart
├── widgets/
│   └── [custom_widgets].dart
└── [feature]_page.dart
```

### 2. Repository Pattern
```
lib/data/
├── models/
│   └── [model]_model.dart
├── datasources/
│   ├── [feature]_remote_datasource.dart
│   └── [feature]_local_datasource.dart (tùy chọn)
└── repositories/
    └── [feature]_repository.dart
```

### 3. Luồng Khởi Tạo
```dart
// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Cài đặt dependencies
  setupDependencies();
  
  runApp(const MyApp());
}
```

## Hướng Dẫn Testing

### BLoC Testing
```dart
blocTest<ProductDetailBloc, ProductDetailState>(
  'phát ra [Loading, Loaded] khi FetchProductById thành công',
  build: () {
    when(() => mockRepository.getProductById(any()))
        .thenAnswer((_) async => mockProduct);
    return ProductDetailBloc(mockRepository);
  },
  act: (bloc) => bloc.add(const FetchProductById('1')),
  expect: () => [
    ProductDetailLoading(),
    ProductDetailLoaded(mockProduct),
  ],
);
```

## Phong Cách Code

- Sử dụng `const` constructors bất cứ khi nào có thể
- Dùng named parameters cho constructors có nhiều tham số
- Dùng trailing commas để format tốt hơn
- Dùng `final` cho biến bất biến
- Ưu tiên `async/await` hơn `.then()`
- Dùng pattern matching với `switch` expressions (Dart 3.0+)
- Dùng records cho nhiều giá trị trả về (Dart 3.0+)

## Những Điều Không Nên Làm

❌ Không đặt logic nghiệp vụ trong BLoC - dùng repositories/use cases
❌ Không dùng `registerSingleton` cho BLoCs - dùng `registerFactory`
❌ Không quên đóng BLoCs - dùng `BlocProvider` để tự động dispose
❌ Không catch `Exception` chung chung - catch exceptions cụ thể
❌ Không quên thêm fields vào Equatable `props`
❌ Không gọi API trực tiếp trong BLoC - dùng repositories
❌ Không dùng `BuildContext` trong BLoC

## Ghi Chú Bổ Sung

- Luôn xử lý các trạng thái loading, success, và error
- Dùng tên có ý nghĩa cho events và states
- Giữ widgets nhỏ và tập trung
- Tách các widgets tái sử dụng ra file riêng
- Dùng dependency injection để dễ test
- Viết tests cho BLoCs và repositories
