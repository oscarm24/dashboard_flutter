import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main (){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dasboard",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50)
              )
            ),
            child: Column(
              children: [
                const SizedBox(height: 55),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 35),
                  title: Text('Bienvenido!!', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white
                  )),
                  subtitle: Text('al dashboard', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white54
                  ),),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user2.png'),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Categoria 1', CupertinoIcons.play_rectangle, Colors.deepOrange),
                  itemDashboard('Categoria 2', CupertinoIcons.graph_circle, Colors.green),
                  itemDashboard('Categoria 3', CupertinoIcons.person_2, Colors.purple),
                  itemDashboard('Categoria 4', CupertinoIcons.chat_bubble_2, Colors.brown),
                  itemDashboard('Categoria 5', CupertinoIcons.money_dollar_circle, Colors.indigo),
                  itemDashboard('Categoria 6', CupertinoIcons.add_circled, Colors.teal),
                  itemDashboard('Categoria 7', CupertinoIcons.question_circle, Colors.blue),
                  itemDashboard('Categoria 8', CupertinoIcons.phone, Colors.pinkAccent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
itemDashboard(String title, IconData, Color background) => Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 5),
        color: Theme.of(context).primaryColor.withOpacity(.2),
        spreadRadius: 2,
        blurRadius: 5
      )
    ]
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: background,
          shape: BoxShape.circle
        ),
        child: Icon(IconData, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Text(title, style: Theme.of(context).textTheme.titleMedium),
    ],
  ),
);

}

