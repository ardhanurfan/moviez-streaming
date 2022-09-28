import 'package:bwa_moviez_streaming/models/movie_models.dart';
import 'package:bwa_moviez_streaming/shared/database.dart';
import 'package:bwa_moviez_streaming/shared/theme.dart';
import 'package:bwa_moviez_streaming/ui/widgets/list_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MovieModel> allData = movieData;

  List<MovieModel> macthQuery = List.from(allData);
  // ignore: non_constant_identifier_names
  int count_result = allData.length;

  void updateList(String value) {
    // update list when search
    setState(() {
      macthQuery = allData
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
      count_result = macthQuery.length;
    });
  }

  void suggest() {
    // Suggest by rating
    setState(() {
      List<MovieModel> allDataSort = List.from(allData);

      allDataSort.sort((b, a) => a.rate.compareTo(b.rate));

      MovieModel getFirstElement =
          List.from(Set.from(allDataSort).difference(Set.from(macthQuery)))[0];

      macthQuery.add(getFirstElement);

      count_result = macthQuery.length;
    });
  }

  Widget suggestButton() {
    // suggest button conditional
    if (count_result == allData.length) {
      return const SizedBox();
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 50, top: 30),
        height: 50,
        width: 220,
        child: TextButton(
          onPressed: () {
            suggest();
          },
          style: TextButton.styleFrom(
            backgroundColor: kBlackColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              'Suggest Movie',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Avenir',
                  fontWeight: medium,
                  fontSize: 16),
            ),
          ),
        ),
      );
    }
  }

  Widget result() {
    // result text conditional
    if (count_result == 0) {
      return const SizedBox();
    } else if (count_result < allData.length) {
      return Text(
        'Search Result ($count_result)',
        style: blackTextStyle.copyWith(fontWeight: black, fontSize: 20),
      );
    } else {
      return Text(
        'All Movies',
        style: blackTextStyle.copyWith(fontWeight: black, fontSize: 20),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (value) => updateList(value),
                  cursorColor: kBlackColor,
                  style:
                      blackTextStyle.copyWith(fontWeight: roman, fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'search movie',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 16),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 28,
                      color: kBlackColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kBlackColor),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 35),
                result(),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Expanded(
            child: count_result == 0
                ? Center(
                    child: Text(
                      'No Result Found',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: black),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: macthQuery
                              .map((result) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: ListCard(movie: result),
                                  ))
                              .toList(),
                        ),
                        suggestButton()
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
