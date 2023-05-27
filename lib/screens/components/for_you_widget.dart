import 'package:flutter/material.dart';
import 'package:foods_delivery/api/model/for_you_model.dart';

class ForYouWidget extends StatelessWidget {
  final List<ForYouModel> lists;

  const ForYouWidget({Key? key, required this.lists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: lists.length,
      itemBuilder: (context, index) {
        var item = lists[index];
        return ForYouItemWidget(forYouItem: item);
      },
    );
  }
}

class ForYouItemWidget extends StatefulWidget {
  final ForYouModel forYouItem;

  const ForYouItemWidget({Key? key, required this.forYouItem})
      : super(key: key);

  @override
  State<ForYouItemWidget> createState() =>
      _ForYouItemWidgetState(forYouItem: forYouItem);
}

class _ForYouItemWidgetState extends State<ForYouItemWidget> {
  final ForYouModel forYouItem;

  _ForYouItemWidgetState({required this.forYouItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200, width: 1)),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image(
                      image: NetworkImage(forYouItem.strMealThumb),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    top: 4,
                    right: 4,
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(
                  height: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: (){},
                    child:Text("😍 Easy",style: Theme.of(context).textTheme.bodySmall,)
                  ),
                ),
                Text("🕛 15min",style: Theme.of(context).textTheme.bodySmall,),
                Text("♥ 120",style: Theme.of(context).textTheme.bodySmall,),
              ],
            ),
            const SizedBox(height: 8,),
            Text(forYouItem.strMeal,maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
      ),
    );
  }
}
