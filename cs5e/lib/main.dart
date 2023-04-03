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

List<String> loadedStats = [];

Inventory inventory = Inventory();

SpellBook spellBook = SpellBook();

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

  debugPrint(inventory.toString());
  debugPrint('\n\n');
  debugPrint(spellBook.toString());

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
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(stats[0]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              valueToSignedString(modifierFromValue(value) +
                                  profBonusFromLevel(level) *
                                      int.parse(profs[0])),
                            ),
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
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(stats[1] == '' ? ' ' : stats[1]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              profs[1] == ''
                                  ? ' '
                                  : valueToSignedString(
                                      modifierFromValue(value) +
                                          profBonusFromLevel(level) *
                                              int.parse(profs[1])),
                            ),
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
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(stats[2] == '' ? ' ' : stats[2]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              profs[2] == ''
                                  ? ' '
                                  : valueToSignedString(
                                      modifierFromValue(value) +
                                          profBonusFromLevel(level) *
                                              int.parse(profs[2])),
                            ),
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
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(stats[3] == '' ? ' ' : stats[3]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              profs[3] == ''
                                  ? ' '
                                  : valueToSignedString(
                                      modifierFromValue(value) +
                                          profBonusFromLevel(level) *
                                              int.parse(profs[3])),
                            ),
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
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(stats[4] == '' ? ' ' : stats[4]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              profs[4] == ''
                                  ? ' '
                                  : valueToSignedString(
                                      modifierFromValue(value) +
                                          profBonusFromLevel(level) *
                                              int.parse(profs[4])),
                            ),
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
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(stats[5] == '' ? ' ' : stats[5]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              profs[5] == ''
                                  ? ' '
                                  : valueToSignedString(
                                      modifierFromValue(value) +
                                          profBonusFromLevel(level) *
                                              int.parse(profs[5])),
                            ),
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
..######...#######..##....##.########.########...#######..##..........########.....###....##....##.########.##......
.##....##.##.....##.###...##....##....##.....##.##.....##.##..........##.....##...##.##...###...##.##.......##......
.##.......##.....##.####..##....##....##.....##.##.....##.##..........##.....##..##...##..####..##.##.......##......
.##.......##.....##.##.##.##....##....########..##.....##.##..........########..##.....##.##.##.##.######...##......
.##.......##.....##.##..####....##....##...##...##.....##.##..........##........#########.##..####.##.......##......
.##....##.##.....##.##...###....##....##....##..##.....##.##..........##........##.....##.##...###.##.......##......
..######...#######..##....##....##....##.....##..#######..########....##........##.....##.##....##.########.########
*/

Widget controlPanelGenerator() {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('WIP'),
  );
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

    Widget controlPanel = controlPanelGenerator();

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
                Expanded(
                  flex: 1,
                  child: Card(
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: controlPanel,
                    ),
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

  for (int i = 0; i < keys.length; i++) {
    loadedStats.add(
        detag(document.findAllElements(keys[i]).toList().toString(), keys[i]));
  }

  debugPrint(loadedStats.toString());

  final List<XmlElement> spellTags = document.findAllElements('spell').toList();

  for (int i = 0; i < spellTags.length; i++) {
    String name =
        detag(spellTags[i].findAllElements('name').toString(), 'name');
    int level = int.parse(
        detag(spellTags[i].findAllElements('level').toString(), 'level'));
    String range =
        detag(spellTags[i].findAllElements('range').toString(), 'range');
    int active = int.parse(
        detag(spellTags[i].findAllElements('active').toString(), 'active'));
    String duration =
        detag(spellTags[i].findAllElements('duration').toString(), 'duration');
    String description = detag(
        spellTags[i].findAllElements('description').toString(), 'description');
    String effect =
        detag(spellTags[i].findAllElements('effect').toString(), 'effect');

    Spell spellTemp =
        Spell(name, level, range, active, duration, description, effect);
    spellBook.addSpell(spellTemp);
  }

  final List<XmlElement> itemTags = document.findAllElements('item').toList();

  for (int i = 0; i < itemTags.length; i++) {
    String name = detag(itemTags[i].findAllElements('name').toString(), 'name');
    int number = int.parse(
        detag(itemTags[i].findAllElements('number').toString(), 'number'));
    String description = detag(
        itemTags[i].findAllElements('description').toString(), 'description');
    int priority = int.parse(
        detag(itemTags[i].findAllElements('priority').toString(), 'priority'));

    Item itemTemp = Item(name, number, description, priority);
    inventory.addItem(itemTemp);
  }

  final List<XmlElement> animalTags =
      document.findAllElements('animal').toList();

  for (int i = 0; i < animalTags.length; i++) {
    String name =
        detag(animalTags[i].findAllElements('name').toString(), 'name');
    int number = int.parse(
        detag(animalTags[i].findAllElements('number').toString(), 'number'));
    String description = detag(
        animalTags[i].findAllElements('description').toString(), 'description');
    int priority = int.parse(
        detag(itemTags[i].findAllElements('priority').toString(), 'priority'));

    Animal animalTemp = Animal(name, number, description, priority);
    inventory.addAnimals(animalTemp);
  }

  final List<XmlElement> consumableTags =
      document.findAllElements('consumable').toList();

  for (int i = 0; i < consumableTags.length; i++) {
    String name =
        detag(consumableTags[i].findAllElements('name').toString(), 'name');
    int number = int.parse(detag(
        consumableTags[i].findAllElements('number').toString(), 'number'));
    String description = detag(
        consumableTags[i].findAllElements('description').toString(),
        'description');
    int priority = int.parse(
        detag(itemTags[i].findAllElements('priority').toString(), 'priority'));

    Consumable consumableTemp = Consumable(name, number, description, priority);
    inventory.addConsumable(consumableTemp);
  }

  final List<XmlElement> weaponTags =
      document.findAllElements('weapon').toList();

  for (int i = 0; i < weaponTags.length; i++) {
    String name =
        detag(weaponTags[i].findAllElements('name').toString(), 'name');
    int number = int.parse(
        detag(weaponTags[i].findAllElements('number').toString(), 'number'));
    String description = detag(
        weaponTags[i].findAllElements('description').toString(), 'description');
    String damage =
        detag(weaponTags[i].findAllElements('damage').toString(), 'damage');
    String bonus =
        detag(weaponTags[i].findAllElements('bonus').toString(), 'bonus');
    int priority = int.parse(detag(
        weaponTags[i].findAllElements('priority').toString(), 'priority'));

    Weapon weaponTemp =
        Weapon(name, number, description, damage, bonus, priority);
    inventory.addWeapon(weaponTemp);
  }
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
  String _name = '';
  int _level = 0;
  String _range = '';
  int _active = 0;
  String _duration = '';
  String _description = '';
  String _effect = '';

  Spell(String name_, int level_, String range_, int active_, String duration_,
      String description_, String effect_) {
    _name = name_;
    _level = level_;
    _range = range_;
    _active = active_;
    _duration = duration_;
    _description = description_;
    _effect = effect_;
  }

  @override
  String toString() {
    return '$_name, $_level, $_range, $_active, $_duration, $_description, $_effect';
  }
}

class Item {
  String _name = '';
  int _number = 0;
  String _description = '';
  int _priority = 0;

  Item(String name_, int number_, String description_, int priority_) {
    _name = name_;
    _number = number_;
    _description = description_;
    _priority = priority_;
  }

  @override
  String toString() {
    return '$_name, $_number, $_description, $_priority';
  }
}

class Animal {
  String _name = '';
  int _number = 0;
  String _description = '';
  int _priority = 0;

  Animal(String name_, int number_, String description_, int priority_) {
    _name = name_;
    _number = number_;
    _description = description_;
    _priority = priority_;
  }

  @override
  String toString() {
    return '$_name, $_number, $_description, $_priority';
  }
}

class Consumable {
  String _name = '';
  int _number = 0;
  String _description = '';
  int _priority = 0;

  Consumable(String name_, int number_, String description_, int priority_) {
    _name = name_;
    _number = number_;
    _description = description_;
    _priority = priority_;
  }

  @override
  String toString() {
    return '$_name, $_number, $_description, $_priority';
  }
}

class Weapon {
  String _name = '';
  int _number = 0;
  String _description = '';
  String _damage = '';
  String _bonus = '';
  int _priority = 0;

  Weapon(String name_, int number_, String description_, String damage_,
      String bonus_, int priority_) {
    _name = name_;
    _number = number_;
    _description = description_;
    _damage = damage_;
    _bonus = bonus_;
    _priority = priority_;
  }

  @override
  String toString() {
    return '$_name, $_number, $_description, $_damage, $_bonus, $_priority';
  }
}

class Inventory {
  List<Item> _items = [];
  List<Consumable> _consumables = [];
  List<Weapon> _weapons = [];
  List<Animal> _animals = [];

  void inventoryOrder() {
    _inventoryOrderItems();
    _inventoryOrderConsumables();
    _inventoryOrderWeapons();
    _inventoryOrderAnimals();
  }

  void _inventoryOrderItems() {
    //TODO
  }
  void _inventoryOrderConsumables() {
    //TODO
  }
  void _inventoryOrderWeapons() {
    //TODO
  }
  void _inventoryOrderAnimals() {
    //TODO
  }

  void addItem(Item item) {
    _items.add(item);
    _inventoryOrderItems();
  }

  void addConsumable(Consumable consumable) {
    _consumables.add(consumable);
    _inventoryOrderConsumables();
  }

  void addWeapon(Weapon weapon) {
    _weapons.add(weapon);
    _inventoryOrderWeapons();
  }

  void addAnimals(Animal animal) {
    _animals.add(animal);
    _inventoryOrderAnimals();
  }

  @override
  String toString() {
    String total = '';

    for (int i = 0; i < _items.length; i++) {
      total += '${_items[i].toString()}\n';
    }

    total += '\n';

    for (int i = 0; i < _consumables.length; i++) {
      total += '${_consumables[i].toString()}\n';
    }

    total += '\n';

    for (int i = 0; i < _weapons.length; i++) {
      total += '${_weapons[i].toString()}\n';
    }

    total += '\n';

    for (int i = 0; i < _animals.length; i++) {
      total += '${_animals[i].toString()}\n';
    }

    return total;
  }

  List<Item> getItems() {
    return _items;
  }

  List<Consumable> getConsumables() {
    return _consumables;
  }

  List<Weapon> getWeapons() {
    return _weapons;
  }

  List<Animal> getAnimals() {
    return _animals;
  }
}

class SpellBook {
  List<Spell> _spells = [];

  void spellsOrder() {
    //TODO to reorder the spells in active order, then level, then alphabetical order
  }

  @override
  String toString() {
    String total = '';

    for (int i = 0; i < _spells.length; i++) {
      total += '${_spells[i].toString()}\n';
    }
    return total;
  }

  void addSpell(Spell spell) {
    _spells.add(spell);
  }

  List<Spell> getSpells() {
    return _spells;
  }
}
