import 'core/config/app_config.dart';
import 'main_common.dart';

void main() {
  // Khởi tạo config cho môi trường Staging
  AppConfig.initialize(Environment.staging);

  // Chạy app
  mainCommon();
}
