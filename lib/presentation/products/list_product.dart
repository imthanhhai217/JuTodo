import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ju_reminder/bs/Basic.dart';
import 'package:ju_reminder/constants/app_routers.dart';
import 'package:ju_reminder/constants/constants.dart';
import 'package:ju_reminder/data/models/product_models.dart';
import 'package:ju_reminder/di/locator.dart';
import 'package:ju_reminder/presentation/common/global_loading/cubit/loading_cubit.dart';
import 'package:ju_reminder/presentation/common/global_loading/loading_state.dart';
import 'package:ju_reminder/presentation/products/bloc/product_bloc.dart';
import 'package:ju_reminder/presentation/products/bloc/product_event.dart';
import 'package:ju_reminder/presentation/products/bloc/product_state.dart';
import 'package:ju_reminder/themes/app_typography.dart';
import 'package:ju_reminder/themes/dimens.dart';
import 'package:ju_reminder/widgets/clickable_wrapper.dart';
import 'package:ju_reminder/widgets/image_loader.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductListViewState();
  }
}

class _ProductListViewState extends State<ProductListView> {
  late final ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _productBloc = ProductBloc(getIt())..add(FetchProduct());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: _productBloc,
        listener: (context, state) {
          if (state is LoadingState) {
            context.read<LoadingCubit>().showLoading("Loading products...");
          } else {
            context.read<LoadingCubit>().hideLoading();
          }
        },
        builder: (context, state) {
          return switch (state) {
            ProductInitial() => Center(child: Text("No data...", style: AppTypography.mini)),
            ProductLoaded(:final productResponse) => _buildProductList(productResponse.data?.products ?? []),
            ProductError(:final message) => Center(child: Text(message, style: AppTypography.miniError)),
            _ => const Center(child: Text("Unknown state")),
          };
        },
      ),
    );
  }

  ListView _buildProductList(List<Products> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductItem(product);
      },
    );
  }

  Widget _buildProductItem(Products product) => ClickableWrapper(
    onClick: () {
      final productID = product.id?.toString() ?? -1;
      if (productID == -1) {
        print("$TAG Invalid product ID");
        return;
      }
      print("$TAG Click $productID");
      context.push(rDetails, extra: productID);
    },
    child: ListTile(
      leading: SizedBox(
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(AppDimen.kDefaultBorderRadius),
          child: ImageNetworkLoader(url: product.thumbnail ?? kDefaultAvatar),
        ),
      ),
      title: Text(product.title ?? "No Title"),
      subtitle: Text("\$${product.price}"),
    ),
  );

  @override
  void dispose() {
    _productBloc.close();
    super.dispose();
  }
}
