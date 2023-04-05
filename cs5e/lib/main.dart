import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'dart:io';

final List<int> xpPerLevel = [
  0,
  300,
  900,
  2700,
  6500,
  14000,
  23000,
  34000,
  48000,
  64000,
  85000,
  100000,
  120000,
  140000,
  165000,
  195000,
  225000,
  265000,
  305000,
  355000
];

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
  'armor',
  'weakness',
];

const List<Color> colors = [
  Color.fromRGBO(184, 115, 51, 1),
  Color.fromRGBO(169, 169, 169, 1),
  Color.fromRGBO(255, 215, 0, 1),
  Color.fromRGBO(229, 228, 226, 1),
];

List<Widget> data50 = [];

const Color levelColor = Color.fromRGBO(150, 150, 150, 1);

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
  debugPrint('\nMAIN CALL\n');
  for (int i = 0; i < 50; i++) {
    data50.add(
      FractionallySizedBox(
        widthFactor: 1,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('data$i'),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: VerticalDivider(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(titleBox),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 5,
              child: ListView(
                children: data50,
              ),
            )
          ],
        ),
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
Widget attributeBoxGenerator(int index, List<String> stats, List<String> profs,
    Function buttonFunc, List<String> loadedStats) {
  String statistic = '';
  String modifier = '';
  int value = int.parse(loadedStats[index + 7]);

  int level = levelFromXP(int.parse(loadedStats[17]));

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
                    child: Text(attributeNames[index]),
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
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: GestureDetector(
                      onTap: () {
                        buttonFunc();
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              statistic,
                            ),
                          ),
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
                  flex: 3,
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
                  flex: 3,
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
                  flex: 3,
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
                  flex: 3,
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
                  flex: 3,
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
                  flex: 3,
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

/*
.########..##.....##.####.##.......########.
.##.....##.##.....##..##..##.......##.....##
.##.....##.##.....##..##..##.......##.....##
.########..##.....##..##..##.......##.....##
.##.....##.##.....##..##..##.......##.....##
.##.....##.##.....##..##..##.......##.....##
.########...#######..####.########.########.
*/

  @override
  Widget build(BuildContext context) {
    debugPrint('\nBUILD CALL\n');

    List<Widget> attributes = [];
    List<Widget> quickMenus = [];

    List<Widget> controlPanelWidgets = [];

    List<String> loadedStats = loadStats();

    Inventory inventory =
        Inventory(loadItems(), loadConsumables(), loadWeapons(), loadAnimals());

    SpellBook spellBook = SpellBook(loadSpells());

    inventory.inventoryOrder();
    spellBook.spellsOrder();

    List<Function> buttonFunctions = [
      pressedFunctionStrength,
      pressedFunctionDexterity,
      pressedFunctionConstitution,
      pressedFunctionIntelligence,
      pressedFunctionWisdom,
      pressedFunctionCharisma
    ];

/*
..######...#######..##....##.########.########...#######..##..........########.....###....##....##.########.##......
.##....##.##.....##.###...##....##....##.....##.##.....##.##..........##.....##...##.##...###...##.##.......##......
.##.......##.....##.####..##....##....##.....##.##.....##.##..........##.....##..##...##..####..##.##.......##......
.##.......##.....##.##.##.##....##....########..##.....##.##..........########..##.....##.##.##.##.######...##......
.##.......##.....##.##..####....##....##...##...##.....##.##..........##........#########.##..####.##.......##......
.##....##.##.....##.##...###....##....##....##..##.....##.##..........##........##.....##.##...###.##.......##......
..######...#######..##....##....##....##.....##..#######..########....##........##.....##.##....##.########.########
*/

    controlPanelWidgets.add(
      GestureDetector(
        onTap: () {
          pressedFunctionHP();
        },
        child: Card(
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text('${loadedStats[14]}/${loadedStats[13]}'),
            ),
          ),
        ),
      ),
    );
    controlPanelWidgets.add(
      FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text('${(int.parse(loadedStats[47]) / 2).toString()}m/s'),
        ),
      ),
    );
    controlPanelWidgets.add(
      FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(valueToSignedString(
              modifierFromValue(int.parse(loadedStats[8])))),
        ),
      ),
    );
    controlPanelWidgets.add(
      FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text((int.parse(loadedStats[66]) +
                        modifierFromValue(int.parse(loadedStats[8])))
                    .toString()),
              ),
            ),
            const Expanded(
              flex: 2,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text('Armor'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    controlPanelWidgets.add(
      GestureDetector(
        onTap: () {
          pressedFunctionXP();
        },
        child: Card(
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: Stack(
              children: [
                Card(
                  color: levelColor,
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor:
                        percentageOfLevel(int.parse(loadedStats[17]) + 1) / 100,
                    child: const Text(' '),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                          'Level ${levelFromXP(int.parse(loadedStats[17]))}'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    controlPanelWidgets.add(
      FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(loadedStats[42]),
        ),
      ),
    );
    controlPanelWidgets.add(
      FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text((10 +
                  modifierFromValue(int.parse(loadedStats[11])) +
                  int.parse(loadedStats[36]) *
                      profBonusFromLevel(
                          levelFromXP(int.parse(loadedStats[17]))))
              .toString()),
        ),
      ),
    );
    controlPanelWidgets.add(
      FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(valueToSignedString(profBonusFromLevel(
                        levelFromXP(int.parse(loadedStats[17]))))
                    .toString()),
              ),
            ),
            const Expanded(
              flex: 2,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text('Prof. Bonus'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    controlPanelWidgets.add(
      GestureDetector(
        onTap: () {
          pressedFunctionRnC();
        },
        child: Card(
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(loadedStats[3]),
                    ),
                  ),
                  const Expanded(flex: 1, child: Divider()),
                  Expanded(
                    flex: 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(loadedStats[4]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    controlPanelWidgets.add(
      GestureDetector(
        onTap: () {
          pressedFunctionFullRest();
        },
        child: const Card(
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Full Rest'),
              ),
            ),
          ),
        ),
      ),
    );
    controlPanelWidgets.add(
      FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(loadedStats[67]),
        ),
      ),
    );
    controlPanelWidgets.add(
      GestureDetector(
        onTap: () {
          pressedFunctionCoins();
        },
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 1,
                            child: Card(
                              color: colors[0],
                              child: const Text(' '),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 1,
                            child: Card(
                              color: colors[2],
                              child: const Text(' '),
                            ),
                          ),
                        ],
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
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 1,
                            child: Card(
                              color: colors[1],
                              child: const Text(' '),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 1,
                            child: Card(
                              color: colors[3],
                              child: const Text(' '),
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
      ),
    );

/*
..######......########..........######..########.########..##.....##..######..########.##.....##.########..########
.##....##.....##.....##........##....##....##....##.....##.##.....##.##....##....##....##.....##.##.....##.##......
.##...........##.....##........##..........##....##.....##.##.....##.##..........##....##.....##.##.....##.##......
.##...........########..........######.....##....########..##.....##.##..........##....##.....##.########..######..
.##...........##.....................##....##....##...##...##.....##.##..........##....##.....##.##...##...##......
.##....##.###.##........###....##....##....##....##....##..##.....##.##....##....##....##.....##.##....##..##......
..######..###.##........###.....######.....##....##.....##..#######...######.....##.....#######..##.....##.########
*/

    Widget controlPanel = Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 30,
                    child: controlPanelWidgets[0],
                  ),
                  const Expanded(
                    flex: 1,
                    child: Divider(),
                  ),
                  Expanded(
                    flex: 40,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 40,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 20,
                                child: controlPanelWidgets[1],
                              ),
                              const Expanded(
                                flex: 1,
                                child: Divider(),
                              ),
                              Expanded(
                                flex: 20,
                                child: controlPanelWidgets[2],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: VerticalDivider(),
                        ),
                        Expanded(
                          flex: 30,
                          child: controlPanelWidgets[3],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: VerticalDivider(),
          ),
          Expanded(
            flex: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 30,
                    child: controlPanelWidgets[4],
                  ),
                  const Expanded(
                    flex: 1,
                    child: Divider(),
                  ),
                  Expanded(
                    flex: 40,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 40,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 20,
                                child: controlPanelWidgets[5],
                              ),
                              const Expanded(
                                flex: 1,
                                child: Divider(),
                              ),
                              Expanded(
                                flex: 20,
                                child: controlPanelWidgets[6],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: VerticalDivider(),
                        ),
                        Expanded(
                          flex: 30,
                          child: controlPanelWidgets[7],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: VerticalDivider(),
          ),
          Expanded(
            flex: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 30,
                    child: controlPanelWidgets[8],
                  ),
                  const Expanded(
                    flex: 1,
                    child: Divider(),
                  ),
                  Expanded(
                    flex: 40,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 40,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 20,
                                child: controlPanelWidgets[9],
                              ),
                              const Expanded(
                                flex: 1,
                                child: Divider(),
                              ),
                              Expanded(
                                flex: 20,
                                child: controlPanelWidgets[10],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: VerticalDivider(),
                        ),
                        Expanded(
                          flex: 30,
                          child: controlPanelWidgets[11],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

/*
..######...#######..##....##.########.########...#######..##..........########.....###....##....##.########.##..........########.##....##.########.
.##....##.##.....##.###...##....##....##.....##.##.....##.##..........##.....##...##.##...###...##.##.......##..........##.......###...##.##.....##
.##.......##.....##.####..##....##....##.....##.##.....##.##..........##.....##..##...##..####..##.##.......##..........##.......####..##.##.....##
.##.......##.....##.##.##.##....##....########..##.....##.##..........########..##.....##.##.##.##.######...##..........######...##.##.##.##.....##
.##.......##.....##.##..####....##....##...##...##.....##.##..........##........#########.##..####.##.......##..........##.......##..####.##.....##
.##....##.##.....##.##...###....##....##....##..##.....##.##..........##........##.....##.##...###.##.......##..........##.......##...###.##.....##
..######...#######..##....##....##....##.....##..#######..########....##........##.....##.##....##.########.########....########.##....##.########.
*/
    attributes.add(
      attributeBoxGenerator(
        0,
        ['Saving Throws', '', '', '', '', 'Athletics'],
        [loadedStats[18], '', '', '', '', loadedStats[24]],
        buttonFunctions[0],
        loadedStats,
      ),
    );
    attributes.add(
      attributeBoxGenerator(
        1,
        ['Saving Throws', '', '', 'Acrobatics', 'Sleight of Hand', 'Stealth'],
        [
          loadedStats[19],
          '',
          '',
          loadedStats[25],
          loadedStats[26],
          loadedStats[27]
        ],
        buttonFunctions[1],
        loadedStats,
      ),
    );
    attributes.add(
      attributeBoxGenerator(
        2,
        ['Saving Throws', '', '', '', '', ''],
        [loadedStats[20], '', '', '', '', ''],
        buttonFunctions[2],
        loadedStats,
      ),
    );
    attributes.add(
      attributeBoxGenerator(
        3,
        [
          'Saving Throws',
          'Arcana',
          'History',
          'Investigation',
          'Nature',
          'Religion'
        ],
        [
          loadedStats[21],
          loadedStats[28],
          loadedStats[29],
          loadedStats[30],
          loadedStats[31],
          loadedStats[32]
        ],
        buttonFunctions[3],
        loadedStats,
      ),
    );
    attributes.add(
      attributeBoxGenerator(
        4,
        [
          'Saving Throws',
          'Animal Handling',
          'Insight',
          'Medicine',
          'Perception',
          'Survival'
        ],
        [
          loadedStats[22],
          loadedStats[33],
          loadedStats[34],
          loadedStats[35],
          loadedStats[36],
          loadedStats[37]
        ],
        buttonFunctions[4],
        loadedStats,
      ),
    );
    attributes.add(
      attributeBoxGenerator(
        5,
        [
          'Saving Throws',
          '',
          'Deception',
          'Intimidation',
          'Performance',
          'Persuasion'
        ],
        [
          loadedStats[23],
          '',
          loadedStats[38],
          loadedStats[39],
          loadedStats[40],
          loadedStats[41]
        ],
        buttonFunctions[5],
        loadedStats,
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
..######..########.########.########.####.##....##..######....######.
.##....##.##..........##.......##.....##..###...##.##....##..##....##
.##.......##..........##.......##.....##..####..##.##........##......
..######..######......##.......##.....##..##.##.##.##...####..######.
.......##.##..........##.......##.....##..##..####.##....##........##
.##....##.##..........##.......##.....##..##...###.##....##..##....##
..######..########....##.......##....####.##....##..######....######.
*/

    Widget settingsPage = Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    color: Colors.green,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      child: const Text('settings'),
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
                    color: Colors.green,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      child: const Text('settings'),
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
      settingsPage,
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
      const BottomNavigationBarItem(
          tooltip: 'Settings',
          icon: Icon(Icons.settings_rounded, color: Colors.grey),
          label: 'Settings',
          activeIcon: Icon(Icons.settings_rounded, color: Colors.grey)),
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

//void loadCharacter() {
List<String> loadStats() {
  final file = File('character01.xml');
  final document = XmlDocument.parse(file.readAsStringSync());
  List<String> tempReturn = [];

  for (int i = 0; i < keys.length; i++) {
    tempReturn.add(
        detag(document.findAllElements(keys[i]).toList().toString(), keys[i]));
  }

  return tempReturn;
}

List<Spell> loadSpells() {
  final file = File('character01.xml');
  final document = XmlDocument.parse(file.readAsStringSync());

  final List<XmlElement> spellTags = document.findAllElements('spell').toList();
  List<Spell> tempReturn = [];

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
    tempReturn.add(spellTemp);
  }

  return tempReturn;
}

List<Item> loadItems() {
  final file = File('character01.xml');
  final document = XmlDocument.parse(file.readAsStringSync());

  final List<XmlElement> itemTags = document.findAllElements('item').toList();
  List<Item> tempReturn = [];

  for (int i = 0; i < itemTags.length; i++) {
    String name = detag(itemTags[i].findAllElements('name').toString(), 'name');
    int number = int.parse(
        detag(itemTags[i].findAllElements('number').toString(), 'number'));
    String description = detag(
        itemTags[i].findAllElements('description').toString(), 'description');
    int priority = int.parse(
        detag(itemTags[i].findAllElements('priority').toString(), 'priority'));

    Item itemTemp = Item(name, number, description, priority);
    tempReturn.add(itemTemp);
  }

  return tempReturn;
}

List<Consumable> loadConsumables() {
  final file = File('character01.xml');
  final document = XmlDocument.parse(file.readAsStringSync());
  final List<XmlElement> consumableTags =
      document.findAllElements('consumable').toList();
  List<Consumable> tempReturn = [];

  for (int i = 0; i < consumableTags.length; i++) {
    String name =
        detag(consumableTags[i].findAllElements('name').toString(), 'name');
    int number = int.parse(detag(
        consumableTags[i].findAllElements('number').toString(), 'number'));
    String description = detag(
        consumableTags[i].findAllElements('description').toString(),
        'description');
    int priority = int.parse(detag(
        consumableTags[i].findAllElements('priority').toString(), 'priority'));

    Consumable consumableTemp = Consumable(name, number, description, priority);
    tempReturn.add(consumableTemp);
  }

  return tempReturn;
}

List<Weapon> loadWeapons() {
  final file = File('character01.xml');
  final document = XmlDocument.parse(file.readAsStringSync());
  final List<XmlElement> weaponTags =
      document.findAllElements('weapon').toList();
  List<Weapon> tempReturn = [];

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
    tempReturn.add(weaponTemp);
  }

  return tempReturn;
}

List<Animal> loadAnimals() {
  final file = File('character01.xml');
  final document = XmlDocument.parse(file.readAsStringSync());
  final List<XmlElement> animalTags =
      document.findAllElements('animal').toList();
  List<Animal> tempReturn = [];

  for (int i = 0; i < animalTags.length; i++) {
    String name =
        detag(animalTags[i].findAllElements('name').toString(), 'name');
    int number = int.parse(
        detag(animalTags[i].findAllElements('number').toString(), 'number'));
    String description = detag(
        animalTags[i].findAllElements('description').toString(), 'description');
    int priority = int.parse(detag(
        animalTags[i].findAllElements('priority').toString(), 'priority'));

    Animal animalTemp = Animal(name, number, description, priority);
    tempReturn.add(animalTemp);
  }

  return tempReturn;
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
  return ((level - 1) / 4).floor() + 2;
}

int levelFromXP(int xp) {
  int len = xpPerLevel.length;
  if (xp > xpPerLevel[len - 1]) return len;
  int i = 0;
  while (i < xpPerLevel.length - 1) {
    if (xp >= xpPerLevel[i] && xp < xpPerLevel[i + 1]) return i + 1;
    i++;
  }
  return 0;
}

int modifierFromValue(int value) {
  int modifier = (((value - value % 2) - 10) / 2).floor();

  return modifier;
}

String valueToSignedString(int value) {
  return value > 0 ? '+${value.toString()}' : value.toString();
}

int stripCompletedLevelsFromXP(int xp) {
  int level = levelFromXP(xp);
  if (level >= xpPerLevel.length) return xpPerLevel[xpPerLevel.length - 1];

  int current = xp - xpPerLevel[level - 1];

  return current;
}

int percentageOfLevel(int xp) {
  int level = levelFromXP(xp);
  if (level >= xpPerLevel.length) return 100;

  int ret = 0;

  int max = xpPerLevel[level] - xpPerLevel[level - 1];

  ret = (stripCompletedLevelsFromXP(xp) * 100 / max).floor();

  return ret;
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

  Inventory(List<Item> items, List<Consumable> consumables,
      List<Weapon> weapons, List<Animal> animals) {
    _items = items;
    _consumables = consumables;
    _weapons = weapons;
    _animals = animals;
  }

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
}

class SpellBook {
  List<Spell> _spells = [];

  SpellBook(List<Spell> spells) {
    _spells = spells;
  }

  void spellsOrder() {
    //TODO to reorder the spells in active order, then level, then alphabetical order
  }

  void addSpell(Spell spell) {
    _spells.add(spell);
    spellsOrder();
  }

  List<Spell> getSpells() {
    return _spells;
  }

  @override
  String toString() {
    String total = '';

    for (int i = 0; i < _spells.length; i++) {
      total += '${_spells[i].toString()}\n';
    }
    return total;
  }
}

/*
.########..##.....##.########.########..#######..##....##....##.....##.########.########.##.....##..#######..########...######.
.##.....##.##.....##....##.......##....##.....##.###...##....###...###.##..........##....##.....##.##.....##.##.....##.##....##
.##.....##.##.....##....##.......##....##.....##.####..##....####.####.##..........##....##.....##.##.....##.##.....##.##......
.########..##.....##....##.......##....##.....##.##.##.##....##.###.##.######......##....#########.##.....##.##.....##..######.
.##.....##.##.....##....##.......##....##.....##.##..####....##.....##.##..........##....##.....##.##.....##.##.....##.......##
.##.....##.##.....##....##.......##....##.....##.##...###....##.....##.##..........##....##.....##.##.....##.##.....##.##....##
.########...#######.....##.......##.....#######..##....##....##.....##.########....##....##.....##..#######..########...######.
*/

void pressedFunctionHP() {
  debugPrint('\nmammtHP\n');
}

void pressedFunctionXP() {
  debugPrint('\nmammtXP\n');
}

void pressedFunctionRnC() {
  debugPrint('\nmammtRnC\n');
}

void pressedFunctionCoins() {
  debugPrint('\nmammtCoins\n');
}

void pressedFunctionFullRest() {
  debugPrint('\nmammtFR\n');
}

void pressedFunctionStrength() {
  debugPrint('\nmammtStrength\n');
}

void pressedFunctionDexterity() {
  debugPrint('\nmammtDexterity\n');
}

void pressedFunctionConstitution() {
  debugPrint('\nmammtConstitution\n');
}

void pressedFunctionIntelligence() {
  debugPrint('\nmammtIntelligence\n');
}

void pressedFunctionWisdom() {
  debugPrint('\nmammtWisdom\n');
}

void pressedFunctionCharisma() {
  debugPrint('\nmammtCharisma\n');
}
