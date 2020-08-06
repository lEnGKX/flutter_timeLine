import 'package:flutter/material.dart';

import 'package:time_line/pages/homePage/index.dart';
import 'package:time_line/pages/my/index.dart';

import 'package:time_line/components/bottomNBar/index.dart';

// 这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class BasicLayout extends StatefulWidget {
  @override
  _BasicLayout createState() => new _BasicLayout();
}

class _BasicLayout extends State<BasicLayout> {
  // bottomNavigationBar 当前的 val 值
  int _selectedIndex = 0;

  // pages
  List<Widget> pages = [HomePage(), My()];

  // bottomNavigationBar 切换
  void onTabChanged(value) {
    setState(() {
      print('valllll -- $value');
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new BottomNBar(
          selectedIndex: _selectedIndex,
          onTabChanged: (value) => onTabChanged(value)),
      body: pages[_selectedIndex],
    );
  }
}
