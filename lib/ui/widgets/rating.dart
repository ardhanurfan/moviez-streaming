import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key, required this.rate}) : super(key: key);

  final int rate;

  @override
  Widget build(BuildContext context) {
    List<Widget> star = [];

    for (var i = 0; i < 5; i++) {
      star += [
        Container(
          margin: const EdgeInsets.only(left: 2),
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: i < rate
                  ? const AssetImage('assets/star_active.png')
                  : const AssetImage('assets/star_unactive.png'),
            ),
          ),
        ),
      ];
    }

    return Row(
      children: star,
    );
  }
}
