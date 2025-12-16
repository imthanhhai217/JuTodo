import 'core/config/app_config.dart';
import 'main_common.dart';

void main() {
  // Khởi tạo config cho môi trường Development
  AppConfig.initialize(Environment.dev);

  // Chạy app
  mainCommon();
}
