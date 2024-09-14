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
          title: const Text("Cats facts", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: BlocProvider(
          create: (_) => getIt<HomeBloc>(),
          child: _HomePageView(),
        ));
  }
}

class _HomePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageStateView();
}

class _HomePageStateView extends State<_HomePageView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetCatFactsEvent());
  }

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
                const Padding(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    child: Text("Today's facts",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                Expanded(child: HomePageCatFacts(list: state.catFacts))
              ],
            );
          }
        case HomeApiFailed():
          {
            return networkErrorView(state.errorMessage);
          }
      }
    });
  }

  networkErrorView(String errorMessage) {
    return Center(
      child: Column(
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
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
