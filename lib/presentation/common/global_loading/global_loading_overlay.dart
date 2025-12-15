import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/presentation/common/global_loading/cubit/loading_cubit.dart';
import 'package:ju_reminder/presentation/common/global_loading/loading_state.dart';
import 'package:ju_reminder/themes/app_color.dart';
import 'package:ju_reminder/themes/app_typography.dart';

class GlobalLoadingOverlay extends StatelessWidget {
  final Widget child;

  const GlobalLoadingOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, LoadingState>(
      builder: (context, state) {
        print(
          'GlobalLoadingOverlay: BlocBuilder triggered, isLoading=${state is Loading}',
        );
        return Stack(
          children: [
            child,
            if (state is Loading)
              Container(
                color: AppColor.backgroundLoadingDialogWithOpacity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      if (state.message != null) ...[
                        SizedBox(height: 16),
                        Text(
                          state.message ?? "",
                          style: AppTypography.dialogLoadingMessage.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
