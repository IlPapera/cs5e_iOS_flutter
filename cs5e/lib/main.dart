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

Text randomChild = const Text('');

int level = 2;

String nomePersonaggio = 'Riven Gudsen';

void main() {
  runApp(const MyApp());
}

int profBonusFromLevel(int level) {
  return 2;
}

int modifierFromValue(int value) {
  int modifier = (((value - value % 2) - 10) / 2).round();

  return modifier;
}

String valueToSignedString(int value) {
  return value > 0 ? '+${value.toString()}' : value.toString();
}

Widget attributeBoxGenerator(
    String name, int value, List<String> stats, List<String> profs) {
  String statistic = '';
  String modifier = '';

  if (value < 10) {
    statistic = '0';
  }

  modifier = valueToSignedString(modifierFromValue(value));

  statistic = statistic + value.toString();

  Widget returnBox = Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(name),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(modifier),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Card(child: Text(statistic)),
                  ),
                )
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: VerticalDivider(),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(stats[0]),
                  ),
                ),
                const Divider(),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(stats[1]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(stats[2]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(stats[3]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(stats[4]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(stats[5]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(valueToSignedString(modifierFromValue(value) +
                      profBonusFromLevel(level) * int.parse(profs[0]))),
                ),
                const Expanded(child: Text('')),
                Expanded(
                  flex: 1,
                  child: Text(profs[1] == ''
                      ? ''
                      : valueToSignedString(modifierFromValue(value) +
                          profBonusFromLevel(level) * int.parse(profs[1]))),
                ),
                Expanded(
                  flex: 1,
                  child: Text(profs[2] == ''
                      ? ''
                      : valueToSignedString(modifierFromValue(value) +
                          profBonusFromLevel(level) * int.parse(profs[2]))),
                ),
                Expanded(
                  flex: 1,
                  child: Text(profs[3] == ''
                      ? ''
                      : valueToSignedString(modifierFromValue(value) +
                          profBonusFromLevel(level) * int.parse(profs[3]))),
                ),
                Expanded(
                  flex: 1,
                  child: Text(profs[4] == ''
                      ? ''
                      : valueToSignedString(modifierFromValue(value) +
                          profBonusFromLevel(level) * int.parse(profs[4]))),
                ),
                Expanded(
                  flex: 1,
                  child: Text(profs[5] == ''
                      ? ''
                      : valueToSignedString(modifierFromValue(value) +
                          profBonusFromLevel(level) * int.parse(profs[5]))),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return returnBox;
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
    List<Widget> attributes = [];

    attributes.add(
      attributeBoxGenerator(
        attributeNames[0],
        8,
        ['Saving Throws', '', '', '', '', 'Athletics'],
        ['0', '', '', '', '', '1'],
      ),
    );
    attributes.add(attributeBoxGenerator(
        attributeNames[1],
        15,
        ['Saving Throws', '', '', 'Acrobatics', 'Sleight of Hand', 'Stealth'],
        ['0', '', '', '0', '0', '0']));
    attributes.add(
      attributeBoxGenerator(
        attributeNames[2],
        14,
        ['Saving Throws', '', '', '', '', ''],
        ['0', '', '', '', '', ''],
      ),
    );
    attributes.add(
      attributeBoxGenerator(
        attributeNames[3],
        10,
        [
          'Saving Throws',
          'Arcana',
          'History',
          'Investigation',
          'Nature',
          'Religion'
        ],
        ['0', '0', '0', '1', '0', '0'],
      ),
    );
    attributes.add(
      attributeBoxGenerator(
        attributeNames[4],
        12,
        [
          'Saving Throws',
          'Animal Handling',
          'Insight',
          'Medicine',
          'Perception',
          'Survival'
        ],
        ['1', '0', '0', '0', '1', '0'],
      ),
    );
    attributes.add(
      attributeBoxGenerator(
        attributeNames[5],
        16,
        [
          'Saving Throws',
          '',
          'Deception',
          'Intimidation',
          'Performance',
          'Persuasion'
        ],
        ['1', '', '1', '1', '0', '0'],
      ),
    );

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------  HOME  ------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Widget home = Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: attributes[0]),
                      Expanded(flex: 1, child: attributes[1]),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: attributes[2]),
                      Expanded(flex: 1, child: attributes[3]),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: attributes[4]),
                      Expanded(flex: 1, child: attributes[5]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
            ),
          ),
        ],
      ),
    );

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------  INVENTORY  ------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Widget inventory = Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    color: Colors.blue,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      child: const Text('Inventory'),
                      //decoration: BoxDecoration(shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    color: Colors.blue,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      child: const Text('Inventory'),
                      //decoration: BoxDecoration(shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------  SPELLS  ------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Widget spells = Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    color: Colors.red,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      child: const Text('spells'),
                      //decoration: BoxDecoration(shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    color: Colors.red,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      child: const Text('spells'),
                      //decoration: BoxDecoration(shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
          label: 'Home',
          activeIcon: Icon(Icons.home_rounded, color: Colors.grey)),
      const BottomNavigationBarItem(
          tooltip: 'Inventoiry',
          icon: Icon(Icons.all_inbox_rounded, color: Colors.grey),
          label: 'Inventory',
          activeIcon: Icon(Icons.all_inbox_rounded, color: Colors.grey)),
      const BottomNavigationBarItem(
          tooltip: 'Spells',
          icon: Icon(Icons.auto_fix_high_rounded, color: Colors.grey),
          label: 'Spells',
          activeIcon: Icon(Icons.auto_fix_high_rounded, color: Colors.grey)),
    ];

    final bottNavBar = BottomNavigationBar(
      items: barItems,
      fixedColor: Colors.grey,
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
          title: Text(nomePersonaggio),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: tabPages[currIndex],
        ),
        bottomNavigationBar: bottNavBar,
      ),
    );
  }
}
