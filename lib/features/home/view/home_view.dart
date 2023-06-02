import 'package:bloc_advance/features/home/cubit/home_cubit.dart';
import 'package:bloc_advance/features/home/service/home_service.dart';
import 'package:bloc_advance/product/constant/application_constant.dart';
import 'package:bloc_advance/product/network/product_network_manager.dart';
import 'package:bloc_advance/product/widget/loading_center_widget.dart';
import 'package:bloc_advance/product/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(ProductNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          actions: [_loadingCenter()],
        ),
        body: _bodyListView(),
      ),
    );
  }

  Widget _bodyListView() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.items?.length ?? kZero.toInt(),
          itemBuilder: (context, index) =>
              ProductCard(model: state.items?[index]),
        );
      },
    );
  }

  Widget _loadingCenter() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? kOne : kZero,
          duration: context.durationLow,
          child: LoadingCenterWidget(),
        );
      },
    );
  }
}
