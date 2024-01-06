import 'package:flutter/material.dart';
import 'package:hitchify/home/nav_bar.dart';
import 'package:action_slider/action_slider.dart';
import 'package:hitchify/home/animated_downbar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isDriverMode = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMode() {
    if (_isDriverMode) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      _isDriverMode = !_isDriverMode;
    });
  }

  Color _toggleColor() {
    return _isDriverMode ? Color(0xff52c498) : Color(0x7744C393);
  }

  void _openModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modal'),
          content: Text('This is a modal.'),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          drawer: NavBar(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Builder(
                builder: (context) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Map.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActionSlider.standard(
                          sliderBehavior: SliderBehavior.stretch,
                          height: 45,
                          width: 200.0,
                          backgroundColor: Colors.white,
                          toggleColor: _toggleColor(),
                          action: (controller) {
                            _toggleMode();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              _isDriverMode ? 'Driver Mode' : 'Passenger Mode',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Handle notification button press
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xbb8dd7bc),
                        ),
                        child: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0x990bce83),
                            width: 4,
                          ),
                        ),
                      ),
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0x7744c393),
                            width: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.fromLTRB(8,50,8,0),
                child: Positioned(
                  // top: 100,
                  bottom:10,// Adjust the value to position the white bo
                  left: 80,
                  right: 80,
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffb2dbcc), // Set the background color
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xff52c498), // Set the border color
                        width: 2, // Set the border width
                      ),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _openModal,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffe2f5ed), // Set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Set the border radius
                            ),
                            // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 33),
                             padding: EdgeInsets.fromLTRB(4, 5, 85, 5)
                          ),
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey, // Set the icon color
                          ),
                          label: Text(
                            'Pick Up Location',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontSize: 16// Set the text color
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _openModal,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffe2f5ed), // Set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Set the border radius
                            ),
                            // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              padding: EdgeInsets.fromLTRB(4, 5, 39, 5)
                          ),
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey, // Set the icon color
                          ),
                          label: Text(
                            'Where Would You Go?',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Poppins',
                                fontSize: 16// Set the text color
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: _openModal,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffe2f5ed), // Set the background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Set the border radius
                                ),
                                padding: EdgeInsets.fromLTRB(4, 5, 5, 5),
                              ),
                              icon: Icon(
                                Icons.calendar_month,
                                color: Colors.grey, // Set the icon color
                              ),
                              label: Text(
                                'Pick Up Date',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 16, // Set the text color
                                ),
                                textAlign: TextAlign.left, // Align the text to the left
                              ),
                            ),
                            SizedBox(width: 10), // Add some spacing between the buttons
                            ElevatedButton.icon(
                              onPressed: _openModal,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffe2f5ed), // Set the background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Set the border radius
                                ),
                                padding: EdgeInsets.fromLTRB(4, 5, 12, 5),
                              ),
                              icon: Icon(
                                Icons.person,
                                color: Colors.grey, // Set the icon color
                              ),
                              label: Text(
                                'Persons',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 16, // Set the text color
                                ),
                                textAlign: TextAlign.left, // Align the text to the left
                              ),
                            ),
                          ],
                        ),
                        Row(

                          children: [
                            ElevatedButton.icon(
                              onPressed: _openModal,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffe2f5ed), // Set the background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Set the border radius
                                ),
                                padding: EdgeInsets.fromLTRB(4, 5, 5, 5),
                              ),
                              icon: Icon(
                                Icons.calendar_month,
                                color: Colors.grey, // Set the icon color
                              ),
                              label: Text(
                                'Travel Days',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 16, // Set the text color
                                ),
                                textAlign: TextAlign.left, // Align the text to the left
                              ),
                            ),
                            SizedBox(width: 55), // Add some spacing between the buttons
                            ElevatedButton(
                              onPressed: _openModal,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff008955), // Set the background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Set the border radius
                                ),
                                padding: EdgeInsets.fromLTRB(11, 6, 11, 6),
                              ),
                              child: Text(
                                'Create',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 16, // Set the text color
                                ),
                                textAlign: TextAlign.left, // Align the text to the left
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
          ),
      bottomNavigationBar: AnimatedDownBar(),
    ))
    );
  }
}

