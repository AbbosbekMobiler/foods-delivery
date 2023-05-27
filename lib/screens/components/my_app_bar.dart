import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello, Abbosbek',style:Theme.of(context).textTheme.headlineSmall),
              Text('What do you want to cook today?',style:Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.cover
                ),
                shape: BoxShape.circle
            ),
          )
        ],
      ),
    );
  }
}
