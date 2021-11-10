import 'package:flutter/material.dart';
import 'package:news_app1/models/news_model.dart';
import 'package:news_app1/providers/news_provider.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context).settings.arguments as Map;
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'LIST',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
          future: newsProvider.fetchData(argument['section'].toString()),
          builder: (context, AsyncSnapshot response) {
            if (response.hasData) {
              List<NewsModel> data = response.data;
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: data.map((item) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'specific',
                                arguments: {
                                  'title': item.title,
                                  'image': item.image,
                                  'description': item.description,
                                  'date': item.date
                                });
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 75.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              item.image.toString()),
                                        ),
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                50.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Container(
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
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            height: 100.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20.0,
                                ),
                              ],
                              borderRadius:
                                  BorderRadiusDirectional.circular(9.0),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }).toList()),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
