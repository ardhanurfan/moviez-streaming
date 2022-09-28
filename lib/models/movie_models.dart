import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  const MovieModel(
      {required this.title,
      required this.genre,
      required this.rate,
      required this.asset});

  final String title;
  final String genre;
  final int rate;
  final String asset;

  @override
  List<Object?> get props => [title, genre, rate, asset];
}
