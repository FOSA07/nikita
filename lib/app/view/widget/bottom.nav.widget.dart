import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavItem extends StatelessWidget {
  final bool current;
  final String name;
  final String icon;
  // final IconData icon;

  final Key identifier;
  final Function()? onPressed;
  const BottomNavItem({super.key,
    required this.current, 
    required this.name, 
    // required this.icon,
    required this.icon, 
    required this.identifier, 
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 24,
        width: 24,
        // child: Icon(icon, color: current ? Color.fromARGB(255, 106, 26, 58) : Colors.grey, size: 27, weight: 50,),
        child: SvgPicture.asset(
          icon,
          colorFilter: current ? ColorFilter.mode(Color.fromARGB(255, 106, 26, 58), BlendMode.srcIn) : ColorFilter.mode(Color.fromRGBO(183, 183, 183, 1), BlendMode.srcIn),
          
        ),
      ),
    );
  }
}