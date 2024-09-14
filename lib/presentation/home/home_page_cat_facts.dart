import 'package:flutter/material.dart';
import 'package:flutter_cat_fact_app/core/entity/cat_facts_entity.dart';
import 'package:format_date/format_date.dart';

class HomePageCatFacts extends StatelessWidget {
  final List<CatFactsEntity> list;

  HomePageCatFacts({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return itemCatFact(list[index]);
        });
  }

  final imageList = [
    "https://cdn.pixabay.com/photo/2022/07/27/06/43/cat-7347316_1280.png",
    "https://pics.craiyon.com/2023-10-18/3b500a23d340416d876afeaa04052164.webp",
    "https://cdn.openart.ai/uploads/image_1684475464028_1024.jpg"
  ];

  itemCatFact(CatFactsEntity entity) {
    return Card.filled(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      color: const Color(0xFFFFE5EE),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                (imageList..shuffle()).last,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 16)),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entity.text,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 14, color: Colors.pink),
                ),
                const SizedBox(height: 12),
                Text(
                  "Date: ${FormatDate.formatDate(dateTime: DateTime.parse(entity.createdAt), format: "dd-mm-yy")}",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
