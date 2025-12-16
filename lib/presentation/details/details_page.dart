import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/di/locator.dart';
import 'package:ju_reminder/presentation/common/global_loading/cubit/loading_cubit.dart';
import 'package:ju_reminder/presentation/details/bloc/product_detail_bloc.dart';
import 'package:ju_reminder/presentation/details/bloc/product_detail_state.dart';
import 'package:ju_reminder/presentation/products/bloc/product_event.dart';

class DetailsPage extends StatefulWidget {
  final String? productID;

  const DetailsPage(this.productID, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final ProductDetailBloc _productDetailBloc;

  @override
  void initState() {
    super.initState();
    _productDetailBloc = ProductDetailBloc(getIt())
      ..add(FetchProductByID(widget.productID ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<ProductDetailBloc, ProductByIDState>(
        builder: (context, state) {
          return switch (state) {
            ProductByIDLoaded(:final productResponse) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productResponse.data?.title ?? "",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '\$${productResponse.data?.price.toString() ?? ""}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            ProductByIDError(:final message) => Center(
              child: Text('Error: $message'),
            ),
            _ => const SizedBox.shrink(),
          };
        },
        bloc: _productDetailBloc,
        listener: (context, state) {
          if (state is ProductByIDLoading) {
            context.read<LoadingCubit>().showLoading("Loading details...");
          } else {
            context.read<LoadingCubit>().hideLoading();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _productDetailBloc.close();
    super.dispose();
  }
}
