import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AnimatedDownBar extends StatefulWidget {
  @override
  _AnimatedDownBarState createState() => _AnimatedDownBarState();
}

class _AnimatedDownBarState extends State<AnimatedDownBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _selectedIndex = 0;

  final List<BarItem> barItems = [
    BarItem(
      icon: Icons.home,
      text: 'Home',
    ),
    BarItem(
      icon: Icons.people,
      text: 'Friends',
    ),
    BarItem(
      icon: Icons.chat,
      text: 'Chat',
    ),
    BarItem(
      icon: Icons.person,
      text: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, _animation.value * 20),
          child: Container(
            color: Colors.white,
            child: CurvedNavigationBar(
              backgroundColor: Colors.white,
              color: Color(0xff52c498),
              buttonBackgroundColor: Colors.white,
              height: 60,
              items: barItems.asMap().entries.map((MapEntry<int, BarItem> entry) {
                int index = entry.key;
                BarItem item = entry.value;
                return BarItemWidget(
                  item: item,
                  isSelected: index == _selectedIndex,
                  animation: _animation,
                );
              }).toList(),
              onTap: (index) {
                _onBarItemTapped(index);
              },
            ),
          ),
        );
      },
    );
  }
}

class BarItem {
  final IconData icon;
  final String text;

  BarItem({required this.icon, required this.text});
}

class BarItemWidget extends StatelessWidget {
  final BarItem item;
  final bool isSelected;
  final Animation<double> animation;
  final double itemSize = 27.0;

  BarItemWidget({
    required this.item,
    required this.isSelected,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    double opacity = isSelected ? 1.0 : 0.5;
    Color color = isSelected ? Color(0xff52c498) : Colors.black;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Icon(
          item.icon,
          size: itemSize,
          color: color.withOpacity(opacity),
        ),
        SizedBox(height: 3),
        Text(
          item.text,
          style: TextStyle(
            fontSize: 12,
            color: color.withOpacity(opacity),
          ),
        ),
      ],
    );
  }
}

