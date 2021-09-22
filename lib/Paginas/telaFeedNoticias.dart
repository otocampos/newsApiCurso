import 'package:flutter/material.dart';
import 'package:news_app_aula/Models/Articles.dart';
import 'package:news_app_aula/Models/Results.dart';
import 'package:news_app_aula/Services/newsApi.dart';

class telaFeedNoticias extends StatefulWidget {
  @override
  _telaFeedNoticiasState createState() => _telaFeedNoticiasState();
}

class _telaFeedNoticiasState extends State<telaFeedNoticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('G1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Articles>?>(
          future: serviceNewsApi.getTopHeadLines(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    List<Articles>? itensList = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.only(left: 32, right: 32, top: 8),
                      child: InkWell(
                        onTap: (){
                          print('click ${itensList![index]}');
                        },
                        child: Card(
                          elevation: 4,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  itensList![index].urlToImage == null
                                      ? Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png')
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                              '${itensList![index].urlToImage}')),
                                  SizedBox(height: 10),
                                  Text('${itensList![index].publishedAt}'),
                                  Text(
                                    '${itensList![index].title}',
                                    style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  itensList![index].author == null
                                      ? Text('Fonte Desconhecida')
                                      : Text('Fonte: ${itensList![index].author}')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Container(
              alignment: AlignmentDirectional.center,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
