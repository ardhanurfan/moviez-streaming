import 'package:bwa_moviez_streaming/models/movie_models.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../pages/detail_page.dart';
import 'rating.dart';

class LargeCard extends StatelessWidget {
  const LargeCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(movie: movie),
            ));
      },
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 207,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(21),
                ),
                image: DecorationImage(
                    image: AssetImage(movie.asset), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: blackTextStyle.copyWith(
                        fontWeight: heavy,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      movie.genre,
                      style: blackTextStyle.copyWith(
                        fontWeight: book,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Rating(
                  rate: movie.rate,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
