import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Fitness'),
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

  // List of string containing the youtube video ids and thumbnail images
  List<String> vid= ["list of youtube video ids"];
  List<String> img=["list of youtube video thumbnail images"];
  TextEditingController textEditingControllerId = new TextEditingController();
 
  void playYoutubeVideo(String viid) {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoById(
      apiKey: "your api key",
      videoId: viid,
      backgroundColor: Colors.white,
      autoPlay: true,
      fullScreen: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
            child: ListView.builder(
                itemCount: vid.length,//ytResult.length,
                itemBuilder: (_, int index) => listItem(index)
            ),
    ),);
  }

  Widget listItem(index){
    return new Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          new FlatButton(
            //splashColor: Colors.blueGrey,
            onPressed: (){playYoutubeVideo(vid[index]);},
            child:Image.asset(img[index],height: 200,fit: BoxFit.fill,width: double.infinity),
          ),

        ],
      ),
    );
  }
}