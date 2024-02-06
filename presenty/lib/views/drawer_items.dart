import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed});
  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(height: 40,
      child: Row(
        children: [
          Icon(icon,size: 20,color: Colors.black,),
          const SizedBox(width: 20,),
          Text(name,style: const TextStyle(fontSize: 18,color: Color.fromARGB(255, 23, 23, 23)),)
        ],
      ),
      ),
    );
  }
}

