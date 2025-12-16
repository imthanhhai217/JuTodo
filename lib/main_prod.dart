import 'core/config/app_config.dart';
import 'main_common.dart';

void main() {
  // Khởi tạo config cho môi trường Production
  AppConfig.initialize(Environment.production);

  // Chạy app
  mainCommon();
}
