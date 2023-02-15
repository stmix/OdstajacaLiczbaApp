import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zadanie_rekrutacyjne/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Zadanie rekrutacyjne'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();

  String znajdzOdstajacaLiczbe(String list) {
    int evc = 0;
    int odc = 0;
    String evcnum = '';
    String odcnum = '';
    String res = '';
    List<String> splitList = list.split(',');
    if (splitList.length < 3) {
      res = 'Podana lista jest zbyt krótka (min. 3 znaki)';
      return res;
    }
    for (int i = 0; i < splitList.length; i++) {
      if (int.parse(splitList[i]) % 2 == 0) {
        evc++;
        evcnum = splitList[i];
      } else if (int.parse(splitList[i]) % 2 == 1) {
        odc++;
        odcnum = splitList[i];
      }
    }

    if (evc != 1 && odc == 1) {
      res = odcnum;
    } else if (evc == 1 && odc != 1) {
      res = evcnum;
    } else if (evc == 0) {
      res = 'Wszystkie podane liczby są nieparzyste';
    } else if (odc == 0) {
      res = 'Wszystkie podane liczby są parzyste';
    } else if (evc > 1 && odc > 1) {
      res = "Brak odstającej liczby";
    } else {
      res = "Wystąpił nieznany błąd!";
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Podaj zestaw liczb oddzielonych przecinkami',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                          result: znajdzOdstajacaLiczbe(
                                              _textEditingController.text))));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                'Wyszukaj',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
