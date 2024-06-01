import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GorevListesi(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title:Text('Gorevler'),
          home: GorevListesiUIWidget()),
    );
  }
}

class GorevListesiUIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var GorevListesiNesnesi = Provider.of<GorevListesi>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gorevler'),
      ),
      body: ListView.builder(
        GorevCount: GorevListesiNesnesi.gorevler.length,
        GorevBuilder: (context, index) {
          var Gorev = GorevListesiNesnesi.gorevler[index];
          return CardWidget(Gorev: Gorev);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  Gorev gorev;

  
  CardWidget({required this.Gorev});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.shopping_cart),
        title: Text(Gorev.baslik),
        subtitle: Text(Gorev.aciklama),
        trailing: Text(" \$ ${Gorevler}"),
      ),
    );
  }
}

class Gorev {
  String Name;
  String Despriction;
  String Start_Date;
  String End_Date;

  
  Gorev(this.Name, this.Despriction, this.Start_Date,this.End_Date);
}

class GorevListesi with ChangeNotifier {
  List<Gorev> gorevler = [
    Gorev('Hi-Kod Odev','Hi-Kod odevi yapilacak.' , 100),
    Gorev('Final Sinavi Calisma', 'Final sinavlarina calisilacak.', 200),
    Gorev('Kiyafet Yikama', 'Kiyafetleri yika.'  , 300),
  ];

  void addTask(Gorev gorev) {
    gorevler.add(gorev);
    notifyListeners();
  }

  void GoreviSil(Gorev gorev) {
    gorevler.remove(gorev);
    notifyListeners();
  }
}

class AddTask extends StatefulWidget {
  @override
  State<additem> createState() => _AddTaskState();
}

class _AddTaskState extends State<addGorev> {
  TextEditingController NameController = TextEditingController();
  TextEditingController DesprictionController = TextEditingController();
  TextEditingController Start_DateController = TextEditingController();
  TextEditingController End_DateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var GorevListesiNesnesi = Provider.of<GorevListesi>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: NameController,
              decoration: InputDecoration(
                hintText: "Isim",
              ),
            ),
            TextField(
              controller: DesprictionController,
              decoration: InputDecoration(
                hintText: "Desprictions",
              ),
            ),
            TextField(
              controller:  Start_DateController ,
              decoration: InputDecoration(
                hintText: "Baslangici",
              ),
            ),
             TextField(
              controller: End_DateController ,
              decoration: InputDecoration(
                hintText: "Bitisi",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                var newGorev = Gorev(
                  NameController.text,
                  DesprictionController.text,
                  Start_DateController.text,
                  End_DateController,
                );

                GorevListesiNesnesi.addTask(newGorev);
                print(" DİKKKAT $ NameController");
                Navigator.pop(context);
              },
              child: Text("Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}
</GorevListesi></addGorev></addGorev></Gorev></GorevListesi>