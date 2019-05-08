import 'package:flutter_web/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> items = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Flutter Web Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Sayfası'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size.fromHeight(320.0),
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key('$index' + items.length.toString()),
                    direction: DismissDirection.up,
                    onDismissed: (direction) {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Text('card item ${items[index]}'),
                          Image.network(
                              'https://picsum.photos/200/200?random=${items[index]}')
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
