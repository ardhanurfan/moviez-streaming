import 'package:bwa_moviez_streaming/models/movie_models.dart';
import 'package:bwa_moviez_streaming/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import 'rating.dart';

class ListCard extends StatelessWidget {
  const ListCard({
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
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Container(
              height: 127,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(21),
                ),
                image: DecorationImage(
                  image: AssetImage(movie.asset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style:
                      blackTextStyle.copyWith(fontWeight: heavy, fontSize: 20),
                ),
                const SizedBox(height: 7),
                Text(
                  movie.genre,
                  style: greyTextStyle.copyWith(fontWeight: book, fontSize: 16),
                ),
                const SizedBox(height: 23),
                Rating(rate: movie.rate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
