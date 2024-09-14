import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_fact_app/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_cat_fact_app/presentation/home/home_page_cat_facts.dart';

import '../../core/di/injection_container.dart';

part 'home_page_banner.dart';

class HomePage extends StatelessWidget{

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
          create: (_)=> getIt<HomeBloc>()..add(GetCatFactsEvent()),
        child: _HomePageView(),
      )
    );
  }

}

class _HomePageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch(state) {
            case HomeInitial() : {
              return const Center(child: CircularProgressIndicator());
            }
            case HomeApiSuccess() : {
              return ListView(
                children: [
                  HomePageBanner(bannerList: state.banners),
                  Expanded(child: HomePageCatFacts(list: state.catFacts))
                ],
              );
            }
            case HomeApiFailed() : {
              return Text(state.errorMessage);
            }
          }
        }
    );
  }

}