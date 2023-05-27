import 'package:flutter/material.dart';

class TopHeadlineWidget extends StatelessWidget {
  final String headlineName;

  const TopHeadlineWidget({Key? key, required this.headlineName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(headlineName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),),
          TextButton(
            onPressed: () {},
            child: Text("See all",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.orange.shade500),),
          )
        ],
      ),
    );
  }
}
