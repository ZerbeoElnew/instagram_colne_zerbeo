import 'package:flutter/material.dart';
class AnimatedBottomNavBar extends StatefulWidget {
  final List<IconData> icons;
  final ValueChanged<int> onTap;

  AnimatedBottomNavBar({required this.icons, required this.onTap});

  @override
  _AnimatedBottomNavBarState createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.icons.length, (index) {
      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250),
      )..addListener(() {
        setState(() {});
      });
    });

    _animations = _controllers.map((controller) {
      return CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      );
    }).toList();

    _controllers[0].value = 1.0;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.icons.length, (index) {
          return InkWell(
            onTap: () {
              _handleTap(index);
              widget.onTap(index);
            },
            child: _buildTabItem(index),
          );
        }),
      ),
    );
  }

  Widget _buildTabItem(int index) {
    Color? color = _colorTween(index).evaluate(_animations[index]);
    IconData icon = widget.icons[index];

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        SizedBox(height: 4.0),
        Container(
          height: 2.0,
          width: 20.0,
          color: color,
        ),
      ],
    );
  }

  void _handleTap(int index) {
    if (index == _selectedIndex) {
      _controllers[index].forward(from: 0.0);
    } else {
      _controllers[_selectedIndex].reverse();
      _controllers[index].forward(from: 0.0);
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  ColorTween _colorTween(int index) {
    return ColorTween(
      begin: Colors.grey,
      end: _selectedIndex == index ? Colors.blue : Colors.grey,
    );
  }
}
