import 'dart:ui';

import 'package:flutter/material.dart';
import '../../const/MFConst.dart';

class MFHomeDetailPage extends StatefulWidget {
  @override
  _MFHomeDetailMenuState createState() => _MFHomeDetailMenuState();
}

// with是dart的关键字，意思是混入的意思，就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，避免多重继承导致的问题。
// 为什么是SingleTickerProviderStateMixin呢，因为初始化animationController的时候需要一个TickerProvider类型的参数Vsync参数，所以我们混入了TickerProvider的子类SingleTickerProviderStateMixin

class _MFHomeDetailMenuState extends State<MFHomeDetailPage>
    with SingleTickerProviderStateMixin {
  IconData lastTappedIcon = Icons.notifications;
  int currentButtonTag = -1;
  final int totalRowCount = 3;
  final double marginLeft = 10;

  final _menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("流水布局"),
      ),
      body: Flow(
        delegate: FlowMenuDelegate(margin: EdgeInsets.fromLTRB(10.0, 10, 0, 0)),
//        children: List.generate(4, (index) {
//          IconData icon = _menuItems[index];
//          return flowMenuItem(icon);
//        }),

        children:
            _menuItems.map((IconData icon) => _flowMenuItem(icon)).toList(),
      ),
    );
  }

  Widget _flowMenuItem(IconData icon) {
    return Container(
      color: Colors.red,
      child: _getContent(icon),
    );
  }

  Widget _getContent(IconData icon) {
    int index = _menuItems.indexOf(icon);
    final buttonW = (kwidth - (totalRowCount + 1) * 10) / totalRowCount;
    RawMaterialButton rawButton = RawMaterialButton(
      fillColor: Colors.blue,
      shape: CircleBorder(),
      constraints: BoxConstraints.tight(Size(buttonW, buttonW)),
      onPressed: () {
        currentButtonTag = index;
        _buttonAction();
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 50.0,
      ),
    );

    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child: rawButton
    );
  }

  void _buttonAction() {
    print(currentButtonTag);
  }
}

class FlowMenuDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.all(10);

  FlowMenuDelegate({this.margin});

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }
}
