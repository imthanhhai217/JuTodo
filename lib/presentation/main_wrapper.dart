import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ju_reminder/constants/app_routers.dart';
import 'package:ju_reminder/themes/app_color.dart';

/// ---------------------------------------------------------------------------
/// MAIN WRAPPER – dùng để bao NavigationBar và phần body của ShellRoute
/// ---------------------------------------------------------------------------
class MainWrapper extends StatelessWidget {
  final Widget child;

  const MainWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child, bottomNavigationBar: _buildNavigationBar(context));
  }

  /// -------------------------------
  ///  BUILD CUSTOM NavigationBar
  /// -------------------------------
  Widget _buildNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        // Ẩn indicator
        indicatorColor: AppColor.transparent,
        backgroundColor: AppColor.bottomNavigationBackground,
        // Chỉ hiển thị label khi được chọn
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // Custom icon khi selected / unselected
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: AppColor.bottomNavigationSelected);
          }
          return IconThemeData(color: AppColor.bottomNavigationUnSelect);
        }),
        // Custom text style khi selected / unselected
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: AppColor.bottomNavigationSelected);
          }
          return TextStyle(color: AppColor.bottomNavigationUnSelect);
        }),
      ),
      child: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.description), label: 'Templates'),
          NavigationDestination(icon: Icon(Icons.add), label: 'Studio'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        // Nhấn tab → điều hướng
        onDestinationSelected: (index) => _go2Tab(context: context, index: index),
        // Set tab đang active dựa trên route hiện tại
        selectedIndex: _indexFromRoute(context),
      ),
    );
  }

  static final Map<int, String> _tabs = {0: rHome, 1: rTemplate, 2: rStudio, 3: rProfile};

  /// -------------------------------
  ///  Lấy index navigation dựa trên URL hiện tại
  /// -------------------------------
  int _indexFromRoute(BuildContext context) {
    final path = GoRouterState.of(context).uri.toString();
    return _selectedIndex(path);
  }

  int _selectedIndex(String path) {
    for (final tab in _tabs.entries) {
      if (path.startsWith(tab.value)) return tab.key;
    }
    return 0;
  }

  /// -------------------------------
  ///  Điều hướng đến tab tương ứng
  /// -------------------------------
  void _go2Tab({required BuildContext context, required int index}) {
    final path = _tabs[index] ?? rHome;
    context.go(path);
  }
}
