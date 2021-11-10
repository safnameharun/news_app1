import 'package:flutter/material.dart';
import 'package:news_app1/models/news_model.dart';
import 'package:news_app1/providers/news_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'RECENT NEWS',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'CATEGORY',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.ac_unit,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('News App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 1.0,
              )),
        ),
        body: FutureBuilder(
            future: newsProvider.fetchData('home'),
            builder: (context, AsyncSnapshot response) {
              if (response.hasData) {
                List<NewsModel> data = response.data;
                return TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: data.map((item) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'specific',
                                        arguments: {
                                          'title': item.title,
                                          'image': item.image,
                                          'description': item.description,
                                          'date': item.date
                                        });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 75.0,
                                          height: 75.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  item.image.toString()),
                                            ),
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(50.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.title.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            Text(
                                              item.date.toString(),
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: 270.0,
                                        // height: 80.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.grey.shade200,
                                  height: 10.0,
                                ),
                              ],
                            );
                          }).toList()),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: {'section': 'Food'});
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.fastfood_rounded,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(50.0),
                                                color: Colors.orangeAccent,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                child: Text(
                                              'Food',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: {'section': 'Books'});
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.menu_book,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(50.0),
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                child: Text(
                                              'Books',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: {'section': 'Business'});
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.business_center,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(50.0),
                                                color: Colors.pink,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                child: Text(
                                              'Business',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: {'section': 'Health'});
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.medical_services,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(50.0),
                                                color: Colors.yellow,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                child: Text(
                                              'Health',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: {'section': 'Movies'});
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.movie_creation_outlined,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(50.0),
                                                color: Colors.lightBlue,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                child: Text(
                                              'Movies',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: {'section': 'Home'});
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.home,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(50.0),
                                                color: Colors.greenAccent,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                child: Text(
                                              'Home',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: {'section': 'Sports'});
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.sports_handball,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(50.0),
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                child: Text(
                                              'Sports',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: {'section': 'Travel'});
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.card_travel,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(50.0),
                                                color: Colors.purpleAccent,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                child: Text(
                                              'Travel',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
