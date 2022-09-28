import 'package:bwa_moviez_streaming/models/movie_models.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/rating.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(movie.asset),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Synopsis',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a nisi sollicitudin, rhoncus justo sit amet, pharetra nisi. Ut quis turpis ligula. Aenean sit amet purus vulputate, euismod magna ut, aliquet sem. Nam eget massa non turpis gravida elementum. Mauris at dapibus lorem. Vivamus dignissim id ante nec gravida. Nulla porta egestas risus eget mattis. Nam tempus ac neque sed aliquet. Morbi auctor viverra massa. Suspendisse nec viverra mi.',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: book,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
