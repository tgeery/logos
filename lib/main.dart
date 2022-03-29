import 'package:flutter/material.dart';
import 'dart:math' as math;

class WhereType {
  String name;
  String city;
  String state;
  WhereType(this.name, this.city, this.state);
}

class MascotType {
  String img_path;
  String school;
  String name;
  MascotType(this.img_path, this.school, this.name);
}

List<WhereType> where_list = [
  WhereType("Appalachian State", "Boone", "North Carolina"),
  WhereType("Auburn", "Auburn", "Alabama"),
  WhereType("Baylor", "Waco", "Texas"),
  WhereType("Bowling Green", "Bowling Green", "Ohio"),
  WhereType("Brigham Young", "Provo", "Utah"),
  WhereType("Brown", "Providence", "Rhode Island"),
  WhereType("Butler", "Indianapolis", "Indiana"),
  WhereType("Clemson", "Clemson", "South Carolina"),
  WhereType("Creighton", "Omaha", "Nebraska"),
  WhereType("Emory", "Atlanta", "Georgia"),
  WhereType("Dartmouth", "Hanover", "New Hampshire"),
  WhereType("Duke", "Durham", "North Carolina"),
  WhereType("ECU", "Greenville", "North Carolina"),
  WhereType("Gonzaga", "Spokane", "Washington"),
  WhereType("Grambling State", "Grambling", "Louisiana"),
  WhereType("Harvard", "Cambridge", "Massachusetts"),
  WhereType("Liberty University", "Lynchburg", "Virginia"),
  WhereType("Marshal", "Huntington", "West Virginia"),
  WhereType("Marquette", "Milwaukee", "Wisconsin"),
  WhereType("Mercer", "Macon", "Georgia"),
  WhereType("Morehouse College", "Atlanta", "Georgia"),
  WhereType("Northeastern", "Boston", "Massachusetts"),
  WhereType("Northwestern", "Evanston", "Illinois"),
  WhereType("Old Dominion", "Norfolk", "Virginia"),
  WhereType("Purdue", "West Lafayette", "Indiana"),
  WhereType("Rutgers", "New Brunswick", "New Jersey"),
  WhereType("Stanford", "Stanford", "California"),
  WhereType("St Peter's", "Jersey", "New Jersey"),
  WhereType("Temple", "Philadelphia", "Pennsylvania"),
  WhereType("Toledo", "Toledo", "Ohio"),
  WhereType("Troy", "Troy", "Alabama"),
  WhereType("Tufts", "Medford & Somerville", "Massachusetts"),
  WhereType("Vanderbilt", "Nashville", "Tennessee"),
  WhereType("Villanova", "Philadelphia", "Pennsylvania"),
  WhereType("Wake Forest", "Winston-Salem", "North Carolina"),
  WhereType("Xavier", "Cincinnati", "Ohio")
];

List<MascotType> mascot_list = [
  MascotType('../images/Bakersfield_Roadrunners_logo.svg.png', 'BAKERSFIELD - ROADRUNNERS', 'Rowdy'), // the Roadrunner
  MascotType('../images/Channel_Islands_Dolphins.png', 'CHANNEL ISLANDS - DOLPHINS', 'Ekho'), // the Dolphin
  MascotType('../images/Chico_State_Wildcats_logo.svg.png', 'CHICO STATE - WILDCATS', 'Willie'),
  MascotType('../images/Dominguez_Hills_Toros.png', 'DOMINGUEZ HILLS - TOROS', 'Teddy'),
  MascotType('../images/East_Bay_Pioneers.jpeg', 'EAST BAY CSU - PIONEERS', 'Pete'),
  MascotType('../images/Fresno_State_Bulldogs.png', 'FRESNO STATE - BULLDOGS', 'Timeout'),
  MascotType('../images/Fullerton_Titans.jpeg', 'FULLERTON - TITANS', 'Tuffy'),
  MascotType('../images/Humbolt_Lumberjacks.jpeg', 'HUMBOLDT POLYTECHNIC - LUMBERJACKS', 'Lucky'),
  MascotType('../images/Long_Beach_49ers.jpeg', 'LONG BEACH STATE - 49ERS', 'Elee'), // the Shark
  MascotType('../images/Los_Angeles_Golden_Eagles_logo.svg.png', 'LOS ANGELES STATE - GOLDEN EAGLES', 'Eddie'),
  // MascotType('', 'MARITIME ACADEMY - GOLDEN BEARS', '')
  MascotType('../images/Monterey_Bay_Otters.png', 'MONTEREY BAY - OTTERS', 'Rey'),
  MascotType('../images/Northridge_Matadors.png', 'NORTHRIDGE - MATADORS', 'Matty'),
  MascotType('../images/Pomona_Broncos_logo.svg.png', 'POMONA POLYTECHNIC - BRONCOS', 'Billy'),
  MascotType('../images/Sacramento_Hornets.jpeg', 'SACREMENTO - HORNETS', 'Herky'),
  MascotType('../images/San_Bernardino_Coyotes_logo.svg.png', 'SAN BERNARDINO - COYOTES', 'Cody'),
  MascotType('../images/San_Diego_St_Aztecs.png', 'SAN DIEGO STATE - AZTECS', 'Aztec Warrior'),
  MascotType('../images/San_Francisco_Gators.png', 'SAN FRANCISCO STATE - GATORS', ''),
  MascotType('../images/San_Jose_State_Spartans_logo.svg.png', 'SAN JOSE STATE - SPARTANS', 'Sammy'),
  MascotType('../images/San_Luis_Obispo_Mustangs.png', 'SAN LUIS OBISPO POLYTECHNIC - MUSTANGS', 'Musty'),
  MascotType('../images/San_Marcos_Cougars.jpeg', 'SAN MARCOS - Cougars', 'Crash'),
  MascotType('../images/Sonoma_Seawolves.png', 'SONOMA - Seawolves', 'Lobo'),
  MascotType('../images/Stanislaus_Warriors.png', 'STANISLAUS - WARRIORS', 'Titus')
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', window_id: 0),
    );
  }
}

class AutocompleteText extends StatelessWidget {
  AutocompleteText(this.lst, this.init, this.setController, this.enabled);

  final List<String> lst;
  final String init;
  final bool enabled;
  var setController;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        setController(controller);
        return TextField(
          controller: controller,
          enabled: enabled,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: init,
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if(textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return lst.where((String option) {
          return option.contains(textEditingValue.text.toUpperCase());
        });
      },
      onSelected: (String selection) {
        print('$selection');
      }
    );
  }
}

class LocationGame extends StatefulWidget {
  LocationGame({Key? key, this.idx = 0, this.reset}) : super(key: key);

  int idx;
  var reset;
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  String correctCity = "";
  String correctState = "";
  String guessedCity = "";
  String guessedState = "";

  @override
  State<LocationGame> createState() => LocationGameState();
}

class LocationGameState extends State<LocationGame> {
  void setCityController(cntrl) {
    widget.cityController = cntrl;
  }

  void setStateController(cntrl) {
    widget.stateController = cntrl;
  }

  @override
  Widget build(BuildContext context) {
    List<String> cities = [], states = [];
    where_list.forEach((college) {
      cities.add(college.city);
      states.add(college.state);
    });

    widget.correctCity = where_list[widget.idx].city;
    widget.correctState = where_list[widget.idx].state;

    var footer = Column(
      children: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            setState(() {
              widget.guessedCity = widget.cityController.text;
              widget.guessedState = widget.stateController.text;
              print(widget.guessedCity);
            });
          },
          child: Text('Submit'),
        ),
      ]
    );

    bool ena = true;
    int len = widget.guessedCity.length;
    print('length $len');
    if(widget.guessedCity.length > 0) {
      ena = false;
      var result = "Incorrect";
      var other = "";
      if(widget.guessedCity == widget.correctCity && widget.guessedState == widget.correctState) {
        var result = "Correct";
      } else {
        var c = widget.correctCity;
        var s = widget.correctState;
        other = "Correct answer is $c, $s";
      }
      footer = Column(
        children: <Widget>[
          Text(result),
          Text(other),
          Container(
            height: 30,
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              setState(() {
                widget.reset();
              });
            },
            child: Text('Done'),
          )
        ]
      );
    }

    return Column(
      children: <Widget>[
        Container(
          height: 30,
        ),
        Text(where_list[widget.idx].name),
        Container(
          height: 30,
        ),
        Container(
          width: 300,
          child: AutocompleteText(cities, "City", setCityController, ena),
        ),
        Container(
          height: 30,
        ),
        Container(
          width: 300,
          child: AutocompleteText(states, "State", setStateController, ena),
        ),
        Container(
          height: 30,
        ),
        footer
      ]
    );
  }
}

class MascotGame extends StatefulWidget {
  MascotGame({Key? key, this.idx = 0, this.reset}) : super(key: key);

  int idx;
  var reset;
  TextEditingController schoolController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String correctSchool = "";
  String correctName = "";
  String guessedSchool = "";
  String guessedName = "";

  @override
  State<MascotGame> createState() => MascotGameState();
}

class MascotGameState extends State<MascotGame> {
  void setController(cntrl) {
    widget.schoolController = cntrl;
  }

  @override
  Widget build(BuildContext context) {
    widget.correctSchool = mascot_list[widget.idx].school;
    widget.correctName = mascot_list[widget.idx].name;
    List<String> schools = [];
    mascot_list.forEach((college) {
      schools.add(college.school);
    });
    String n = mascot_list[widget.idx].name;
    bool ena = (n.length > 1) ? true : false;
    String lbl = (ena) ? 'Mascot Name' : 'No Mascot Name Known';
    String result = "";
    var footer = Column(
      children: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            setState(() {
              widget.guessedSchool = widget.schoolController.text;
              widget.guessedName = widget.nameController.text;
            });
          },
          child: Text('Submit'),
        ),
      ]
    );
    if(widget.guessedSchool.length > 0) {
      ena = false;
      if(widget.guessedSchool == widget.correctSchool && widget.guessedName == widget.correctName) {
        footer = Column(
          children: <Widget>[
            Text("Correct"),
            Container(
              height: 30,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                widget.reset();
              },
              child: Text('Done'),
            ),
          ]
        );
      } else {
        footer = Column(
          children: <Widget>[
            Text("Incorrect"),
            Container(
              height: 30,
            ),
            Text("Correct answer is:"),
            Text(widget.correctSchool),
            Text(widget.correctName),
            Container(
              height: 30,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                widget.reset();
              },
              child: Text('Done'),
            ),
          ],
        );
      }
    }

    return Column(
      children: <Widget>[
        ClipRRect(
          child: Image.asset(
            mascot_list[widget.idx].img_path,
            width: 300,
            height: 300,
            fit: BoxFit.fill
          ),
        ),
        Container(
          height: 30,
        ),
        Container(
          width: 300,
          child: AutocompleteText(schools, "School", setController, ena),
        ),
        Container(
          height: 30,
        ),
        Container(
          width: 300,
          child: TextField(
            enabled: ena,
            controller: widget.nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: lbl,
            ),
          ),
        ),
        Container(
          height: 30,
        ),
        footer
      ]
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, this.window_id = 0}) : super(key: key);

  final String title;
  int window_id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void resetWindow() {
    setState(() {
      widget.window_id = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget ctnt = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          setState(() {
            widget.window_id = 1;
          });
        },
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                child: Image.asset(
                  '../images/where_icon.png',
                  width: 150,
                  height: 100,
                ),
              ),
              Text("Know the location?"),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            widget.window_id = 2;
          });
        },
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                child: Image.asset(
                  '../images/who_icon.jpg',
                  width: 150,
                  height: 100,
                ),
              ),
              Text("Know the mascot?"),
            ],
          ),
        ),
      ),
    ],
  );

  math.Random random = math.Random();
  if(widget.window_id == 1) {
    int i = random.nextInt(where_list.length);
    ctnt = LocationGame(idx: i, reset: resetWindow);
  } else if(widget.window_id == 2) {
    int i = random.nextInt(mascot_list.length);
    ctnt = MascotGame(idx: i, reset: resetWindow);
  }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ctnt,
      ),
    );
  }
}
