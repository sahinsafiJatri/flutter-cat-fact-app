import 'package:flutter/cupertino.dart';
import 'package:flutter_cat_fact_app/core/entity/cat_facts_entity.dart';

class HomePageCatFacts extends StatelessWidget {

  final List<CatFactsEntity> list;

  const HomePageCatFacts({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Text(list[index].text);
        }
    );
  }

}