import 'package:flutter/material.dart';
import 'package:time_line/themes/colorThemes.dart';


class BottomNBar extends StatefulWidget {
  BottomNBar({Key key, this.selectedIndex, this.onTabChanged})
      : super(key: key);
  final int selectedIndex;
  final onTabChanged;

  @override
  _BottomNBar createState() => new _BottomNBar();
}

class _BottomNBar extends State<BottomNBar> {
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(214,211,205, 1),
      selectedItemColor: ColorThemes.BTSelectColor,
      unselectedItemColor:  ColorThemes.fColor,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: widget.selectedIndex,
      onTap: (value) => {
        widget.onTabChanged(value)
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(title: Text('Home', style:TextStyle(color: ColorThemes.fColor)), icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            title: Text('My', style:TextStyle(color: ColorThemes.fColor)), icon: Icon(Icons.perm_identity)),
      ],
    );
  }
}
