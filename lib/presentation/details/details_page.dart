import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/di/locator.dart';
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
  late final ProductDetailBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _productBloc = ProductDetailBloc(getIt())..add(FetchProductByID(widget.productID ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailBloc, ProductByIDState>(
      builder: (context, state) {
        return switch (state) {
          ProductByIDInitial() => throw UnimplementedError(),
          ProductByIDLoading() => throw UnimplementedError(),
          ProductByIDLoaded() => throw UnimplementedError(),
          ProductByIDError() => throw UnimplementedError(),
        };
      },
      listener: (context, state) {},
    );
  }

  @override
  void dispose() {
    _productBloc.close();
    super.dispose();
  }
}
