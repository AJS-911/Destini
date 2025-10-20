import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain st = StoryBrain();
  int _storyNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    st.getStory(),
                    style: TextStyle(
                      fontSize: 5.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    st.nextStory(1);
                    setState(() {
                      _storyNumber = st.getstoryNumber();
                    });
                  },
                  child: Text(
                    st.getChoice1(),
                    // 'Choice 1',
                    style: TextStyle(
                      fontSize: 5.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: st.buttonShouldBeVisible(),
                child: Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      st.nextStory(2);
                      setState(() {
                        _storyNumber = st.getstoryNumber();
                      });
                    },
                    child: Text(
                      st.getChoice2(),
                      // 'Choice 2',
                      style: TextStyle(
                        fontSize: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
