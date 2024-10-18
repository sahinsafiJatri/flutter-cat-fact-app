import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_fact_app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_cat_fact_app/presentation/home/home_page_cat_facts.dart';
import '../../core/di/injection_container.dart';

part 'home_page_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cats facts"),
          centerTitle: true
        ),
        body: BlocProvider(
          create: (_) => getIt<HomeBloc>()..add(GetCatFactsEvent()),
          child: _HomePageView(),
        ));
  }
}

class _HomePageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      switch (state) {
        case HomeInitial():{
          return const Center(child: CircularProgressIndicator());
        }
        case HomeApiSuccess():{
            return ListView(
              children: [
                HomePageBanner(bannerList: state.banners),
                factLabel(context),
                Expanded(child: HomePageCatFacts(list: state.catFacts))
              ],
            );
          }
        case HomeApiFailed():
          {
            return networkErrorView(state.errorMessage, context);
          }
      }
    });
  }

  factLabel(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: Text("Today's facts",
            style: Theme.of(context).textTheme.titleLarge
        ));
  }

  networkErrorView(String errorMessage, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.network_check_sharp,
            size: 100,
            color: Colors.pinkAccent,
          ),
          const Text(
            "Opps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(errorMessage),
          const Padding(padding: EdgeInsets.only(top: 16)),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(GetCatFactsEvent());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            child: const Text("Retry", style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
