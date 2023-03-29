import 'package:flutter/material.dart';

final List<String> attributeNames = [
  'Strength',
  'Dexterity',
  'Constitution',
  'Intelligence',
  'Wisdom',
  'Charisma',
];

final List<String> keys = [
  '00-serial',
  '01-cName',
  '02-pName',
  '03-race',
  '04-class',
  '05-background',
  '06-alignment',
  '07-strength',
  '08-dexterity',
  '09-constitution',
  '10-intelligence',
  '11-wisdom',
  '12-charisma',
  '13-maxHealth',
  '14-currentHealth',
  '15-hitDice',
  '16-speed',
  '17-experience',
  '18-profStrength',
  '19-profDexterity',
  '20-profConstitution',
  '21-profIntelligence',
  '22-profWisdom',
  '23-profCharisma',
  '24-profAthletics',
  '25-profAcrobatics',
  '26-profSleightOfHand',
  '27-profStealth',
  '28-profArcana',
  '29-profHistory',
  '30-profInvestigation',
  '31-profNature',
  '32-profReligion',
  '33-profAnimalHandling',
  '34-profInsight',
  '35-profMedicine',
  '36-profPerception',
  '37-profSurvival',
  '38-profDeception',
  '39-profIntimidation',
  '40-profPerformance',
  '41-profPersuasion',
  '42-inspiration',
  '43-bronzeCoins',
  '44-silverCoins',
  '45-goldCoins',
  '46-platinumCoins',
  '47-currSpeed',
];

void main() {
  runApp(const MyApp());
}

Widget attributeBoxGenerator(
    String name, int value, List<String> stats, List<int> profs) {
  Widget ret = Padding(
    padding: const EdgeInsets.all(0.5),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(value.toString()),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(name),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(stats[0]),
                ),
                Expanded(
                  flex: 1,
                  child: Text(stats[1]),
                ),
                Expanded(
                  flex: 1,
                  child: Text(stats[2]),
                ),
                Expanded(
                  flex: 1,
                  child: Text(stats[3]),
                ),
                Expanded(
                  flex: 1,
                  child: Text(stats[4], style: const TextStyle()),
                ),
                Expanded(
                  flex: 1,
                  child: Text(stats[5]),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
  return ret;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currIndex = 0;

  static const String nomePersonaggio = 'Pallad';

  final drawerItems = ListView();

  @override
  Widget build(BuildContext context) {
    List<Widget> attributes = [];

    attributes.add(attributeBoxGenerator(attributeNames[0], 1,
        ['name1', 'name2', 'name3', 'name4', 'name5', 'name6'], []));
    attributes.add(attributeBoxGenerator(attributeNames[0], 2,
        ['name1', 'name2', 'name3', 'name4', 'name5', 'name6'], []));
    attributes.add(attributeBoxGenerator(attributeNames[0], 3,
        ['name1', 'name2', 'name3', 'name4', 'name5', 'name6'], []));
    attributes.add(attributeBoxGenerator(attributeNames[0], 4,
        ['name1', 'name2', 'name3', 'name4', 'name5', 'name6'], []));
    attributes.add(attributeBoxGenerator(attributeNames[0], 5,
        ['name1', 'name2', 'name3', 'name4', 'name5', 'name6'], []));
    attributes.add(attributeBoxGenerator(attributeNames[0], 6,
        ['name1', 'name2', 'name3', 'name4', 'name5', 'name6'], []));

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------  HOME  ------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Widget home = Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: attributes[0]),
                        Expanded(flex: 1, child: attributes[1]),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: attributes[2]),
                        Expanded(flex: 1, child: attributes[3]),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: attributes[4]),
                        Expanded(flex: 1, child: attributes[5]),
                      ],
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: const [
                Text('data01'),
                Text('data02'),
                Text('data03'),
                Text('data04'),
                Text('data05'),
                Text('data06'),
                Text('data07'),
                Text('data08'),
                Text('data09'),
                Text('data10'),
                Text('data11'),
                Text('data12'),
                Text('data13'),
                Text('data14'),
                Text('data15'),
                Text('data16'),
                Text('data17'),
                Text('data18'),
                Text('data19'),
                Text('data20'),
                Text('data21'),
                Text('data22'),
                Text('data23'),
                Text('data24'),
                Text('data25'),
                Text('data26'),
                Text('data27'),
                Text('data28'),
                Text('data29'),
                Text('data30'),
                Text('data31'),
                Text('data32'),
                Text('data33'),
                Text('data34'),
                Text('data35'),
                Text('data36'),
                Text('data37'),
                Text('data38'),
                Text('data39'),
                Text('data40'),
                Text('data41'),
                Text('data42'),
                Text('data43'),
                Text('data44'),
                Text('data45'),
                Text('data46'),
                Text('data47'),
                Text('data48'),
                Text('data49'),
                Text('data50'),
              ],
            ),
          ),
        ],
      ),
    );

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------  INVENTORY  ------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Widget inventory = Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          color: Colors.blue,
          height: 100,
          width: 100,
          child: const Text('inventory'),
          //decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------  SPELLS  ------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Widget spells = Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          color: Colors.red,
          height: 100,
          width: 100,
          child: const Text('spells'),
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
          tooltip: 'Home',
          icon: Icon(Icons.home_rounded, color: Colors.grey),
          label: '',
          activeIcon: Icon(Icons.home_rounded, color: Colors.grey)),
      const BottomNavigationBarItem(
          tooltip: 'Inventoiry',
          icon: Icon(Icons.all_inbox_rounded, color: Colors.grey),
          label: '',
          activeIcon: Icon(Icons.all_inbox_rounded, color: Colors.grey)),
      const BottomNavigationBarItem(
          tooltip: 'Spells',
          icon: Icon(Icons.auto_fix_high_rounded, color: Colors.grey),
          label: '',
          activeIcon: Icon(Icons.auto_fix_high_rounded, color: Colors.grey)),
    ];

    assert(tabPages.length == barItems.length);

    final bottNavBar = BottomNavigationBar(
      items: barItems,
      //backgroundColor: Colors.grey,
      currentIndex: currIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int indexIn) {
        setState(() {
          currIndex = indexIn;
        });
      },
    );

    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[650],
          title: const Text(nomePersonaggio),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: tabPages[currIndex],
        ),
        bottomNavigationBar: bottNavBar,
        drawer: Drawer(
          child: drawerItems,
        ),
      ),
    );
  }
}
