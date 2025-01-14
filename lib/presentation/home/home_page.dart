import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_fact_app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_cat_fact_app/presentation/home/home_page_cat_facts.dart';
import '../../core/di/injection_container.dart';
import '../../core/ui/NetworkError.dart';

part 'home_page_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cats facts"),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (_) => getIt<HomeBloc>()..add(GetCatFactsEvent()),
          child: _buildBody(),
        ));
  }

  Widget _buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {

      if(state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if(state.errorMessage.isNotEmpty) {
        return NetworkError(
            errorMessage: state.errorMessage,
            retry: (){
              BlocProvider.of<HomeBloc>(context).add(GetCatFactsEvent());
            }
        );
      }

      return ListView(
        children: [
          HomePageBanner(bannerList: state.banners),
          factLabel(context),
          Expanded(child: HomePageCatFacts(list: state.catFacts))
        ],
      );

    });
  }

  factLabel(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: Text("Today's facts", style: Theme.of(context).textTheme.titleLarge)
    );
  }

}
