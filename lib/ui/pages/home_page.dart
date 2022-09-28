import 'package:bwa_moviez_streaming/shared/database.dart';
import 'package:bwa_moviez_streaming/shared/theme.dart';
import 'package:bwa_moviez_streaming/ui/pages/search_page.dart';
import 'package:bwa_moviez_streaming/ui/widgets/large_card.dart';
import 'package:bwa_moviez_streaming/ui/widgets/list_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 33, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Moviez',
                            style: blackTextStyle.copyWith(
                              fontWeight: black,
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            'Watch much easier',
                            style: greyTextStyle.copyWith(
                              fontWeight: book,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 28,
                          color: kBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 24,
                    ),
                    child: Row(
                      children: [
                        LargeCard(
                          movie: movieData[2],
                        ),
                        LargeCard(
                          movie: movieData[3],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 33),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From Disney',
                        style: blackTextStyle.copyWith(
                          fontWeight: black,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ListCard(
                        movie: movieData[0],
                      ),
                      ListCard(
                        movie: movieData[1],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'John Wick 4',
    'Bohemian',
    'Mulan Session',
    'Beauty & Beast',
    'The Dark II',
    'The Dark Knight',
    'The Dark Tower'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> macthQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        macthQuery.add(item);
      }
    }

    return ListView.builder(
        itemCount: macthQuery.length,
        itemBuilder: (context, index) {
          var result = macthQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> macthQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        macthQuery.add(item);
      }
    }

    return ListView.builder(
        itemCount: macthQuery.length,
        itemBuilder: (context, index) {
          var result = macthQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
