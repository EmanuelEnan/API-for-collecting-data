import 'package:api_1/data_service.dart';
import 'package:api_1/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final DataService serviceDog = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.blue,
      body: Container(
        child: SafeArea(
          child: FutureBuilder(
            future: serviceDog.fetchServices(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.black45,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var currentPerson = snapshot.data![index];

                            return ListTile(
                              title: Text(currentPerson.Nation),
                              subtitle: Text(
                                'Population: ${currentPerson.Population}',
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 82.0,
                  ),
                );
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Loading at the moment, please hold the line.")
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
