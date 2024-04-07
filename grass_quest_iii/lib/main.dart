// Copyright © 2024 Shoeb Khan
// Unauthorized use or distribution is strictly prohibited and may result in legal action.
// Contact mohammedkhancode@gmail.com for licensing options or collaboration inquiries.


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        appBarTheme: const AppBarTheme(color: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Grass Quest'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<String> _titles = [
    'Top 5 stories of the month',
    'Missions',
    'Explore',
    'GrassAI',
    'Profile'
  ];

  final List<Widget> _children = [
    const Featured(),
    const Missions(),
    Explore(),
    ChatScreen(),
    Profile(),
    const Placeholder(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_titles[_currentIndex]),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.burst_fill),
              label: 'Featured',
              backgroundColor: Color.fromARGB(255, 141, 223, 203)),
          BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Missions',
              backgroundColor: Color.fromARGB(255, 130, 160, 216)),
          BottomNavigationBarItem(
              icon: Icon(Icons.run_circle),
              label: 'Explore',
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_work_rounded),
              label: 'Connect',
              backgroundColor: Color.fromARGB(255, 237, 183, 237)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.lightBlueAccent),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String title;

  PlaceholderWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
class PlaceholderWidget2 extends StatefulWidget {
  const PlaceholderWidget2({Key? key}) : super(key: key);

  @override
  _PlaceholderWidgetState createState() => _PlaceholderWidgetState();
}
class _PlaceholderWidgetState extends State<PlaceholderWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: CircularProgressIndicator(), // You can replace this with any widget you want to use as a placeholder
      ),
    );
  }
}

class Featured extends StatelessWidget {
  const Featured();

  static const List<String> videoDurations = [
    '5:30',
    '4:45',
    '8:20',
    '12:15',
    '7:50'
  ];
  static const List<String> videoTitles = [
    'Capturing Moments: Friends\' Sunlit Selfie Adventure 📸',
    'Supportive Spaces: Insights from a Man\'s Support Group 🤝',
    'Growing Together: Teenagers\' Journey in Bible Study 📖',
    'Crafting Connections: Handmade Jewelry with Craftswomen 💍',
    'Feathered Friends: Flock Fun with Pet Birds 🐦'
  ];

  static const List<String> videoDescriptions = [
    "Join us as we embark on a journey filled with laughter and smiles! In this heartwarming vlog, a group of friends gathers by a sunlit window to snap the perfect group selfie. Watch as we share anecdotes, pose for the camera, and create lasting memories together. Whether it's the joyous expressions or the radiant sunlight, this video is sure to brighten your day and remind you of the beauty of friendship.",
    "Gain valuable perspectives and heartfelt stories in this empowering video! Listen as a compassionate man shares his experiences and insights during a support group session. From overcoming challenges to finding strength in vulnerability, his words resonate with authenticity and empathy. Whether you're navigating personal struggles or simply seeking inspiration, this video offers a reminder of the power of community and the importance of lending a listening ear.",
    "Explore the power of faith and friendship in this enlightening video! Follow a group of teenagers as they delve into the depths of scripture during their Bible study session. From thought-provoking discussions to moments of reflection, witness the spiritual growth and camaraderie among these young individuals. Whether you're seeking spiritual insight or simply curious about the dynamics of youth Bible study, this video offers a glimpse into the transformative journey of faith and fellowship.",
    "Dive into the world of creativity and craftsmanship with this inspiring video! Join a group of talented craftswomen as they come together to make stunning handmade jewelry. From intricate designs to skillful techniques, witness the passion and dedication poured into each piece. Whether you're a jewelry enthusiast or simply appreciate the art of handmade goods, this video offers a glimpse into the intricate process of jewelry making and the bond shared among artisans.",
    "Embark on a delightful adventure with our feathered companions in this charming video! Watch as a flock of pet birds eagerly flock to a hand filled with bird feed, showcasing their playful antics and colorful plumage. From chirps of excitement to graceful flights, experience the joy and wonder of avian companionship. Whether you're a bird enthusiast or simply seeking a moment of pure bliss, this video is bound to lift your spirits and fill your heart with warmth."
  ];

  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 141, 223, 203),
      child: ListView.builder(
        itemCount: 5, // Replace with the actual number of featured videos
        itemBuilder: (BuildContext context, int index) {
          // Replace these placeholder values with actual video data
          String videoTitle = videoTitles[index];
          String videoDescription = videoDescriptions[index];
          String thumbnailPath =
              'assets/thumbnails/video${index + 1}.jpg'; // Path to video thumbnail
          String videoDuration = videoDurations[
          index]; // Replace with the actual duration of the video

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9, // Aspect ratio for video thumbnails
                  child: Stack(
                    children: [
                      Image.asset(
                        thumbnailPath,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 8.0,
                        right: 8.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 2.0),
                          color: Colors.black54,
                          child: Text(
                            videoDuration,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        videoDescription,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
class Missions extends StatelessWidget {
  const Missions({super.key});


  static const List<Map<String, dynamic>> missions = [
    {'title': 'Gaming Galore', 'subtitle': 'Level Up Your Friendship!', 'description': 'Complete tasks like playing a game with a friend, visiting the park for three consecutive days, and engaging in conversations with people you encounter.', 'points': 100, 'time': 1},
    {'title': 'Park Paradise', 'subtitle': 'Unleash Your Inner Social Butterfly!', 'description': 'Watch a movie with a friend or family member. Choose a film you both enjoy and make it a memorable movie night experience.', 'points': 150, 'time': 2},
    {'title': 'Movie Magic', 'subtitle': 'Share the Silver Screen Experience!', 'description': 'Go on a date with someone special. Plan a romantic outing or dinner to spend quality time together.', 'points': 200, 'time': 3},
    {'title': 'Date Night Delight', 'subtitle': 'Sparks Fly Under the Stars!', 'description': 'Conquer your fear of public speaking by giving a speech or attending a Toastmasters session. Improve your communication skills and boost your confidence in front of an audience.', 'points': 250, 'time': 4},
    {'title': 'Speech Sensation', 'subtitle': 'Conquer Your Fear and Command the Stage!', 'description': 'Attend suggested events or a series of events based on your availability. Explore various activities and discover new interests while having the option to add your availability.', 'points': 300, 'time': 5},
    {'title': 'Event Extravaganza', 'subtitle': 'Your Ultimate Social Calendar Unlocked!', 'description': 'Enroll in classes or attend events that contribute to your career development. Gain new skills, expand your knowledge, and stay updated with industry trends to advance in your profession.', 'points': 10, 'time': 6},
    {'title': 'Career Climb', 'subtitle': 'Propel Your Professional Journey to Success!', 'description': 'Join a local community group and actively participate in discussions. Listen to the problems of others, share your insights, and engage in conversations about current events to foster connections within your community.', 'points': 100, 'time': 7},
    {'title': 'Community Connection', 'subtitle': 'Changing Lives One Conversation at a Time!', 'description': 'Lincolnwood community center is hosting an open house event this sunday at at 1am. Win 150 points by visiting the event, talk to people and connect with 2 people you can relate.', 'points': 150, 'time': 8},
  ];



  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 130, 160, 216),
      child: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (BuildContext context, int index) {
          final mission = missions[index];
          final String title = mission['title'];
          final String subtitle = mission['subtitle'];
          final String description = mission['description'];
          final int points = mission['points'];
          final int time = mission['time'];

          return Card(
            margin: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showMissionDialog(context, title, subtitle, description, points, time);
              },
              child: ListTile(
                trailing: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.access_time, color: Colors.blue), // Icon for time
                        SizedBox(width: 4),
                        Text('$time h'), // Display time
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.token_rounded, color: Colors.orange),
                        SizedBox(width: 4),
                        Text('$points'),
                      ],
                    ),
                  ],
                ),
                title: Text(title),
                subtitle: Text(subtitle),
              ),
            ),
          );
        },
      ),
    );
  }


  void _showMissionDialog(BuildContext context, String title, String subtitle,String description, int points, int time) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(subtitle),
                SizedBox(height: 10.0),
                Text(description),
                SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, color: Colors.blue),
                    SizedBox(width: 4.0),
                    Text('$time h'),
                    SizedBox(width: 20.0),
                    Icon(Icons.token_rounded, color: Colors.orange),
                    SizedBox(width: 4.0),
                    Text('$points'),
                  ],
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to start the mission here
                    Navigator.pop(context);
                  },
                  child: Text('Start Mission'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class Explore extends StatelessWidget {

  Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
                'assets/images/map.jpg',
                fit: BoxFit.contain
            ),
          ),
          const Center(
            child: Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Conversation extends StatelessWidget {
  const Conversation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Conversation',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50, // Adjust size as needed
                backgroundImage: AssetImage('assets/images/shoeb.jpg'), // Replace with user's image
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Shoeb Khan', // Replace with user's name
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              shrinkWrap: true, // Allow the GridView to scroll
              physics: NeverScrollableScrollPhysics(), // Disable GridView's scroll
              children: [
                _buildGridItem(context, 'Interests', Icons.favorite),
                _buildGridItem(context, 'Settings', Icons.settings),
                _buildGridItem(context, 'Preferences', Icons.star),
                _buildGridItem(context, 'Contact Us', Icons.contact_mail),
                _buildGridItem(context, 'How to Use', Icons.help),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // Implement action for each grid item here
          // For example, navigate to a new screen or show a dialog
          // You can replace this with your desired action
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(title),
                content: Text('You tapped on $title'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  List<ChatMessage> _messages = [];

  bool _isFirstMessage = true;

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    if (_isFirstMessage) {
      _sendBotMessage("Welcome to GreenQuest, I am an AI powered companion in your journey to improve quality of life. Tell me what your schedule is today and I can suggest you some fun activities ");
      _isFirstMessage = false;
    } else {
      _sendBotMessage("Sorry, I am only a prototype.");
    }
  }

  void _sendBotMessage(String text) {
    ChatMessage botMessage = ChatMessage(
      text: text,
      isUserMessage: false,
    );
    setState(() {
      _messages.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
        isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: CircleAvatar(
              child: Text(isUserMessage ? "User" : "Bot"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isUserMessage ? "You" : "Bot",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}