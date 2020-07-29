import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demographic Data',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _radioValue1 = -1;

  void _handleRadioValueChange1(int value) {
    _radioValue1 = value;

    switch (_radioValue1) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Center(
            child: Text('Demographic Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Question('1. Gender'),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Male',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Female',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Question('2. Date of Birth'),
                TextFormField(),
                Question('3. Country of Birth'),
                TextFormField(),
                Question('4. In Which country was your father born?'),
                TextFormField(),
                Question('5. In which country was your grandfather born?'),
                TextFormField(),
                Question('6. In which country was your grandmother born?'),
                TextFormField(),
                Question('7. In which country was your mother born?'),
                TextFormField(),
                Question('8. In which country was your grandfather(mother\'s father) born?'),
                TextFormField(),
                Question('9. In which counntry was your grandmother(mother\'s mother) born?'),
                TextFormField(),
                Question('10. What is your profession?'),
                TextFormField(),
                Question('11. What is your highest educational degree?'),
                TextFormField(),
                Text('Eating habits and appetite', style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                Question('12. Please mark the correct statement regarding your hunger level throughout the day*'),
                TextFormField(),
                Text('Sleeping Habits', style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                Question('13. How many hours per day do you sleep?(including mid-day)'),
                TextFormField(),
                Question('14. If you usually sleep in the middle of the day. How many hours do you sleep? If you do not, please move on the to the next question'),
                TextFormField(),
                Question('15. DO you suffer from any sleeping problems/disturbances? If so, please specify. If not move on to the next question.'),
                TextFormField(),
                Question('16. How would you define your sleeping quality?*'),
                TextFormField(),
                Text('Physical Activity', style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                Text('Regarding your workplace', style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                Question('17. Do you spend most(more that half) of the time'),
                TextFormField(),
                Question('18. In the past year, have you been exercising regularly in a physical activity which causes accelerated brathing and perspiration?'),
                TextFormField(),
                Question('19. How often do you exercise?'),
                TextFormField(),
                Question('20. How many hours a day do you spend in front of your TV/Computer? Including the time you spend on the computer at your workplace.'),
                TextFormField(),
                Question('21. Please specify the physical activities that you regularly perform. For each activity specify its type, frequency, duration, and how long have you been performing it.'),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: <Widget>[
                      Question("a. Activity Type"),
                      TextFormField(),
                      Question("b. How often do you exercise in that activity?"),
                      TextFormField(),
                      Question("c. What is the average duration o the activity(in minutes)?"),
                      TextFormField(),
                      Question("d. For how long have you been continuously exercising in that activity?"),
                      TextFormField(),
                      Question("e. Activity type"),
                      TextFormField(),
                      Question("f. How often do you excercise in that activity?"),
                      TextFormField(),
                      Question("g. What is the average duration of the activity(in minutes)?"),
                      TextFormField(),
                      Question("f. For how long have you been continuously execrcising in that activity?"),
                      TextFormField(),
                      Question("i. Activity type"),
                      TextFormField(),
                      Question("j. How often do you exercise in that activity?"),
                      TextFormField(),
                      Question("k. What is the average duration of the activity(in minutes)?"),
                      TextFormField(),
                      Question("l. For how long have been continuously exercising in that activity?"),
                      TextFormField(),
                      Question("m. Other activity - please specify"),
                      TextFormField(),
                      Question("n. How often do you exercise in that activity"),
                      TextFormField(),
                      Question("o. What is the average duration of the activity(in minutes)?"),
                      TextFormField(),
                      Question("p. For how long have been continuously exercising in that activity?"),
                      TextFormField()
                    ],
                  ),
                ),
                Text("Smoking Habits", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                Question("22. Are you smoking?(Cigarettes, pipes, cigars, hookah, etc."),
                TextFormField(),
                Question("23. When did you quit?"),
                TextFormField(),
                Question('24. At what age did you start smoking?'),
                TextFormField(),
                Question('25. Try to estimate how many year-packs you have smoked. A year-pack is a pack-perday for one year. For example, if someone smoke 2 packs a day for a year, then a pack per day for six months, then half a pack per day for another six months, and then he quit - he smoked 2.75 year-packs.'),
                TextFormField(),
                Question('26. How many years in total have you smoked/been snmoking?'),
                TextFormField(),
                Question('27. How many cigerattes per day do you currently smoke?'),
                TextFormField(),
                Text("Defacation Habits", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                Question('28. How often do you usually defecate?'),
                TextFormField(),
                Question('29. Do you defacate at regular house?'),
                TextFormField(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.only(top: 50, bottom: 25),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28, color: Colors.white),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}