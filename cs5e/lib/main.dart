import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'dart:io';

final List<String> attributeNames = [
  'Strength',
  'Dexterity',
  'Constitution',
  'Intelligence',
  'Wisdom',
  'Charisma',
];

final List<String> keys = [
  'serial',
  'cName',
  'pName',
  'race',
  'class',
  'background',
  'alignment',
  'strength',
  'dexterity',
  'constitution',
  'intelligence',
  'wisdom',
  'charisma',
  'maxHealth',
  'currentHealth',
  'hitDice',
  'speed',
  'experience',
  'profStrength',
  'profDexterity',
  'profConstitution',
  'profIntelligence',
  'profWisdom',
  'profCharisma',
  'profAthletics',
  'profAcrobatics',
  'profSleightOfHand',
  'profStealth',
  'profArcana',
  'profHistory',
  'profInvestigation',
  'profNature',
  'profReligion',
  'profAnimalHandling',
  'profInsight',
  'profMedicine',
  'profPerception',
  'profSurvival',
  'profDeception',
  'profIntimidation',
  'profPerformance',
  'profPersuasion',
  'inspiration',
  'bronzeCoins',
  'silverCoins',
  'goldCoins',
  'platinumCoins',
  'currSpeed',
  'l1slotsTotal',
  'l1slotsUsed',
  'l2slotsTotal',
  'l2slotsUsed',
  'l3slotsTotal',
  'l3slotsUsed',
  'l4slotsTotal',
  'l4slotsUsed',
  'l5slotsTotal',
  'l5slotsUsed',
  'l6slotsTotal',
  'l6slotsUsed',
  'l7slotsTotal',
  'l7slotsUsed',
  'l8slotsTotal',
  'l8slotsUsed',
  'l9slotsTotal',
  'l9slotsUsed',
];

List<Widget> data50 = [];

int level = 2;

String nomePersonaggio = 'Riven Gudsen';

Inventory inventory = new Inventory();

SpellBook spellBook = new SpellBook();

List<String> statistics = [];

/*
.##.....##....###....####.##....##
.###...###...##.##....##..###...##
.####.####..##...##...##..####..##
.##.###.##.##.....##..##..##.##.##
.##.....##.#########..##..##..####
.##.....##.##.....##..##..##...###
.##.....##.##.....##.####.##....##
*/

void main() {
  for (int i = 0; i < 50; i++) {
    data50.add(Text('data${i + 1}'));
  }

  loadCharacter();

  runApp(const MyApp());
}

/*
..#######.........####.##....##.##.....##.########.##....##.########..#######..########..##....##
.##.....##.........##..###...##.##.....##.##.......###...##....##....##.....##.##.....##..##..##.
.##.....##.........##..####..##.##.....##.##.......####..##....##....##.....##.##.....##...####..
.##.....##.........##..##.##.##.##.....##.######...##.##.##....##....##.....##.########.....##...
.##..##.##.........##..##..####..##...##..##.......##..####....##....##.....##.##...##......##...
.##....##..###.....##..##...###...##.##...##.......##...###....##....##.....##.##....##.....##...
..#####.##.###....####.##....##....###....########.##....##....##.....#######..##.....##....##...
*/
Widget quickInventoryGenerator(String titleBox, List<Widget> items) {
  Widget returnBox;
  returnBox = Expanded(
    flex: 1,
    child: Card(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(titleBox),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 7),
              child: ListView(
                children: data50,
              ),
            ),
          )
        ],
      ),
    ),
  );

  return returnBox;
}

/*
....###....########.########.########..####.########..##.....##.########.########....########...#######..##.....##
...##.##......##.......##....##.....##..##..##.....##.##.....##....##....##..........##.....##.##.....##..##...##.
..##...##.....##.......##....##.....##..##..##.....##.##.....##....##....##..........##.....##.##.....##...##.##..
.##.....##....##.......##....########...##..########..##.....##....##....######......########..##.....##....###...
.#########....##.......##....##...##....##..##.....##.##.....##....##....##..........##.....##.##.....##...##.##..
.##.....##....##.......##....##....##...##..##.....##.##.....##....##....##..........##.....##.##.....##..##...##.
.##.....##....##.......##....##.....##.####.########...#######.....##....########....########...#######..##.....##
*/
Widget attributeBoxGenerator(
    String name, int value, List<String> stats, List<String> profs) {
  String statistic = '';
  String modifier = '';

  if (value < 10) {
    statistic = '0';
  }

  modifier = valueToSignedString(modifierFromValue(value));

  statistic += value.toString();

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
                    child: Card(
                      child: TextButton(
                        onPressed: () {
                          //TODO funzioni di premuta bottoni
                        },
                        child: Text(
                          statistic,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
            flex: 6,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(stats[0]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            valueToSignedString(modifierFromValue(value) +
                                profBonusFromLevel(level) *
                                    int.parse(profs[0])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Divider(),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(stats[1]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            profs[1] == ''
                                ? ''
                                : valueToSignedString(modifierFromValue(value) +
                                    profBonusFromLevel(level) *
                                        int.parse(profs[1])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(stats[2]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            profs[2] == ''
                                ? ''
                                : valueToSignedString(modifierFromValue(value) +
                                    profBonusFromLevel(level) *
                                        int.parse(profs[2])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(stats[3]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            profs[3] == ''
                                ? ''
                                : valueToSignedString(modifierFromValue(value) +
                                    profBonusFromLevel(level) *
                                        int.parse(profs[3])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(stats[4]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            profs[4] == ''
                                ? ''
                                : valueToSignedString(modifierFromValue(value) +
                                    profBonusFromLevel(level) *
                                        int.parse(profs[4])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(stats[5]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            profs[5] == ''
                                ? ''
                                : valueToSignedString(modifierFromValue(value) +
                                    profBonusFromLevel(level) *
                                        int.parse(profs[5])),
                          ),
                        ),
                      ),
                    ],
                  ),
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

/*
.########..########..######...####.##....##.##....##.####.##....##..######..
.##.....##.##.......##....##...##..###...##.###...##..##..###...##.##....##.
.##.....##.##.......##.........##..####..##.####..##..##..####..##.##.......
.########..######...##...####..##..##.##.##.##.##.##..##..##.##.##.##...####
.##.....##.##.......##....##...##..##..####.##..####..##..##..####.##....##.
.##.....##.##.......##....##...##..##...###.##...###..##..##...###.##....##.
.########..########..######...####.##....##.##....##.####.##....##..######..
*/

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
    List<Widget> quickMenus = [];

    inventory.inventoryOrder();
    spellBook.spellsOrder();

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

    quickMenus.add(quickInventoryGenerator('Weapon Inventory', []));
    quickMenus.add(quickInventoryGenerator('Quick Inventory', []));
    quickMenus.add(quickInventoryGenerator('Active Spells', []));

/*
.##.....##..#######..##.....##.########
.##.....##.##.....##.###...###.##......
.##.....##.##.....##.####.####.##......
.#########.##.....##.##.###.##.######..
.##.....##.##.....##.##.....##.##......
.##.....##.##.....##.##.....##.##......
.##.....##..#######..##.....##.########
*/

    Widget homePage = Scaffold(
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
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Card(
                    child: Text('random'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      quickMenus[0],
                      quickMenus[1],
                      quickMenus[2],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

/*
.####.##....##.##.....##.########.##....##.########..#######..########..##....##
..##..###...##.##.....##.##.......###...##....##....##.....##.##.....##..##..##.
..##..####..##.##.....##.##.......####..##....##....##.....##.##.....##...####..
..##..##.##.##.##.....##.######...##.##.##....##....##.....##.########.....##...
..##..##..####..##...##..##.......##..####....##....##.....##.##...##......##...
..##..##...###...##.##...##.......##...###....##....##.....##.##....##.....##...
.####.##....##....###....########.##....##....##.....#######..##.....##....##...
*/

    Widget inventoryPage = Scaffold(
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

/*
..######..########..########.##.......##........######.
.##....##.##.....##.##.......##.......##.......##....##
.##.......##.....##.##.......##.......##.......##......
..######..########..######...##.......##........######.
.......##.##........##.......##.......##.............##
.##....##.##........##.......##.......##.......##....##
..######..##........########.########.########..######.
*/

    Widget spellsPage = Scaffold(
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

/*
..######...########.##....##.########.########.....###....##.............###....########..########.
.##....##..##.......###...##.##.......##.....##...##.##...##............##.##...##.....##.##.....##
.##........##.......####..##.##.......##.....##..##...##..##...........##...##..##.....##.##.....##
.##...####.######...##.##.##.######...########..##.....##.##..........##.....##.########..########.
.##....##..##.......##..####.##.......##...##...#########.##..........#########.##........##.......
.##....##..##.......##...###.##.......##....##..##.....##.##..........##.....##.##........##.......
..######...########.##....##.########.##.....##.##.....##.########....##.....##.##........##.......
*/

    final tabPages = <Widget>[
      homePage,
      inventoryPage,
      spellsPage,
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

/*
.##........#######.....###....########.....##.....##.########.########.##.....##..#######..########...######.
.##.......##.....##...##.##...##.....##....###...###.##..........##....##.....##.##.....##.##.....##.##....##
.##.......##.....##..##...##..##.....##....####.####.##..........##....##.....##.##.....##.##.....##.##......
.##.......##.....##.##.....##.##.....##....##.###.##.######......##....#########.##.....##.##.....##..######.
.##.......##.....##.#########.##.....##....##.....##.##..........##....##.....##.##.....##.##.....##.......##
.##.......##.....##.##.....##.##.....##....##.....##.##..........##....##.....##.##.....##.##.....##.##....##
.########..#######..##.....##.########.....##.....##.########....##....##.....##..#######..########...######.
*/

void loadCharacter() {
  final file = File('character01.xml');
  final document = XmlDocument.parse(file.readAsStringSync());
  final List<XmlElement> spellTags = document.findAllElements('spell').toList();
  print(detag(spellTags[0].findAllElements('name').toString(), 'name'));
  for (int i = 0; i < spellTags.length; i++) {}
}

/*
.##.....##.####.##....##..#######..########.....##.....##.########.########.##.....##..#######..########...######.
.###...###..##..###...##.##.....##.##.....##....###...###.##..........##....##.....##.##.....##.##.....##.##....##
.####.####..##..####..##.##.....##.##.....##....####.####.##..........##....##.....##.##.....##.##.....##.##......
.##.###.##..##..##.##.##.##.....##.########.....##.###.##.######......##....#########.##.....##.##.....##..######.
.##.....##..##..##..####.##.....##.##...##......##.....##.##..........##....##.....##.##.....##.##.....##.......##
.##.....##..##..##...###.##.....##.##....##.....##.....##.##..........##....##.....##.##.....##.##.....##.##....##
.##.....##.####.##....##..#######..##.....##....##.....##.########....##....##.....##..#######..########...######.
*/

String detag(String tagged, String tag) {
  return tagged.substring(tag.length + 3, tagged.length - (tag.length + 4));
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

/*
..######..##..........###.....######...######..########..######.
.##....##.##.........##.##...##....##.##....##.##.......##....##
.##.......##........##...##..##.......##.......##.......##......
.##.......##.......##.....##..######...######..######....######.
.##.......##.......#########.......##.......##.##.............##
.##....##.##.......##.....##.##....##.##....##.##.......##....##
..######..########.##.....##..######...######..########..######.
*/

class Spell {
  String name = '';
  int level = 0;
  String range = '';
  String activation = '';
  String duration = '';
  String description = '';
  String effect = '';

  Spell(String name_, int level_, String range_, String activation_,
      String duration_, String description_, String effect_) {
    name = name_;
    level = level_;
    range = range_;
    activation = activation_;
    duration = duration_;
    description = description_;
    effect = effect_;
  }
}

class Item {
  String name = '';
  int number = 0;
  String description = '';

  Item(String name_, int number_, String description_) {
    name = name_;
    number = number_;
    description = description_;
  }
}

class Animal {
  String name = '';
  int number = 0;
  String description = '';

  Animal(String name_, int number_, String description_) {
    name = name_;
    number = number_;
    description = description_;
  }
}

class Consumable {
  String name = '';
  int number = 0;
  String description = '';

  Consumable(String name_, int number_, String description_) {
    name = name_;
    number = number_;
    description = description_;
  }
}

class Weapon {
  String name = '';
  int number = 0;
  String description = '';
  String damage = '';

  Weapon(String name_, int number_, String description_, String damage_) {
    name = name_;
    number = number_;
    description = description_;
    damage = damage_;
  }
}

class Inventory {
  List<Item> items = [];
  List<Consumable> consumables = [];
  List<Weapon> weapons = [];
  List<Animal> animals = [];

  void inventoryOrder() {
    //TODO to reorder the inventory in alphabetical order
  }
}

class SpellBook {
  List<Spell> spells = [];

  void spellsOrder() {
    //TODO to reorder the spells in active order, then level, then alphabetical order
  }
}
