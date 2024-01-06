import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75, // Adjust the width as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff52c498),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'johndoe@example.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle settings button press
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Complain'),
              onTap: () {
                // Handle complain button press
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help and Support'),
              onTap: () {
                // Handle help and support button press
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                // Handle log out button press
              },
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class NavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Color(0xff52c498),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 35,
//                   backgroundImage: AssetImage('assets/images/avatar.jpg'),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'John Doe',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//                 Text(
//                   'johndoe@example.com',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () {
//               // Handle settings button press
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.report),
//             title: Text('Complain'),
//             onTap: () {
//               // Handle complain button press
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.help),
//             title: Text('Help and Support'),
//             onTap: () {
//               // Handle help and support button press
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: Text('Log Out'),
//             onTap: () {
//               // Handle log out button press
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }