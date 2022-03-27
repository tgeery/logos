import 'package:flutter/material.dart';

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
  WhereType("Villanova", "Phiadelphia", "Pennsylvania"),
  WhereType("Wake Forest", "Winston-Salem", "North Carolina"),
  WhereType("Xavier", "Cincinnati", "Ohio")
];

const List<String> imgs = [
  'Bakersfield_Roadrunners_logo.svg.png',
  'Channel_Islands_Dolphins.png',
  'Chico_State_Wildcats_logo.svg.png',
  'Dominguez_Hills_Toros.png',

  'San_Diego_State_Aztecs_logo.svg.png',
  'Fullerton_Titans.png',
  'Long_Beach_State_49ers.png',
  
];

const List<MascotType> schools = [
  MascotType('BAKERSFIELD - ROADRUNNERS', 'Rowdy'), // the Roadrunner
  MascotType('CHANNEL ISLANDS - DOLPHINS', 'Ekho'), // the Dolphin
  MascotType('CHICO STATE - WILDCATS', 'Wildcats'),
  MascotType('DOMINGUEZ HILLS - TOROS', 'Toros'),

  MascotType('SAN DIEGO STATE - AZTECS', 'Aztec Warrior'),
  MascotType('FULLERTON - TITANS', 'Tuffy the Titan (Elephant)'),
  MascotType('LONG BEACH STATE - 49ERS', 'Elby the Shark'),
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
  const AutocompleteText(this.lst);

  final List<String> lst;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
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

class LocationGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> cities = [], states = [];
    where_list.forEach((college) {
      cities.add(college.city);
      states.add(college.state);
    });
    return Column(
      children: <Widget>[
        Text("Butler"),
        Container(
          width: 300,
          child: AutocompleteText(cities),
        ),
        Container(
          width: 300,
          child: AutocompleteText(states),
        )
      ]
    );
  }
}

class MascotGame extends StatelessWidget {
  const MascotGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          child: Image.asset(
            imgs[1],
            width: 300,
            height: 300,
            fit: BoxFit.fill
          ),
        ),
        Container(
          width: 300,
          child: AutocompleteText(names),
          // child: TextField(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: '',
          //   ),
          // ),
        ),
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

  if(widget.window_id == 1) {
    ctnt = LocationGame();
  } else if(widget.window_id == 2) {
    ctnt = MascotGame();
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
