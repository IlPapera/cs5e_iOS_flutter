import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget home = Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: const Text('1')),
                      Expanded(flex: 1, child: const Text('2')),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: const Text('3')),
                      Expanded(flex: 1, child: const Text('4')),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: const Text('5')),
                      Expanded(flex: 1, child: const Text('6')),
                    ],
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            children: [
              const Text('data01'),
              const Text('data02'),
              const Text('data03'),
              const Text('data04'),
              const Text('data05'),
              const Text('data06'),
              const Text('data07'),
              const Text('data08'),
              const Text('data09'),
              const Text('data10'),
              const Text('data11'),
              const Text('data12'),
              const Text('data13'),
              const Text('data14'),
              const Text('data15'),
              const Text('data16'),
              const Text('data17'),
              const Text('data18'),
              const Text('data19'),
              const Text('data20'),
              const Text('data21'),
              const Text('data22'),
              const Text('data23'),
              const Text('data24'),
              const Text('data25'),
              const Text('data26'),
              const Text('data27'),
              const Text('data28'),
              const Text('data29'),
              const Text('data30'),
              const Text('data31'),
              const Text('data32'),
              const Text('data33'),
              const Text('data34'),
              const Text('data35'),
              const Text('data36'),
              const Text('data37'),
              const Text('data38'),
              const Text('data39'),
              const Text('data40'),
              const Text('data41'),
              const Text('data42'),
              const Text('data43'),
              const Text('data44'),
              const Text('data45'),
              const Text('data46'),
              const Text('data47'),
              const Text('data48'),
              const Text('data49'),
              const Text('data50'),
            ],
          ),
        ),
      ],
    ));

    Widget inventory = Scaffold(
      body: Center(
        child: Container(
          child: const Text('inventory'),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          color: Colors.blue,
          height: 100,
          width: 100,
          //decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
    Widget spells = Scaffold(
      body: Center(
        child: Container(
          child: const Text('spells'),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          color: Colors.red,
          height: 100,
          width: 100,
          //decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );

    final tabPages = <Widget>[
      home,
      inventory,
      spells,
    ];

    final barItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded, color: Colors.grey),
          label: 'Home',
          activeIcon: Icon(Icons.home_rounded, color: Colors.green)),
      const BottomNavigationBarItem(
          icon: Icon(Icons.all_inbox_rounded, color: Colors.grey),
          label: 'Inventory',
          activeIcon: Icon(Icons.all_inbox_rounded, color: Colors.green)),
      const BottomNavigationBarItem(
          icon: Icon(Icons.auto_fix_high_rounded, color: Colors.grey),
          label: 'Spells',
          activeIcon: Icon(Icons.auto_fix_high_rounded, color: Colors.green)),
    ];

    assert(tabPages.length == barItems.length);

    final bottNavBar = BottomNavigationBar(
      items: barItems,
      currentIndex: currIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int indexIn) {
        setState(() {
          currIndex = indexIn;
        });
      },
    );

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Mammt tua mia'),
      ),
      body: tabPages[currIndex],
      bottomNavigationBar: bottNavBar,
    ));
  }
}
