
import 'package:flutter/material.dart';
import 'package:foods_delivery/api/model/category.dart';

class CategoryItemScreen extends StatefulWidget {
  final Category category;
  final VoidCallback callback;
  const CategoryItemScreen({Key? key, required this.category, required this.callback}) : super(key: key);

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState(category,callback);
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  final Category category;
  final VoidCallback callback;

  _CategoryItemScreenState(this.category, this.callback);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right : 12),
      child: SizedBox(
        height: 100,
        width: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 55,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(horizontal : 4,vertical: 8),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: callback,
                child: Image(image: NetworkImage(category.strCategoryThumb),),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              category.strCategory,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}