import 'package:flutter/material.dart';

import 'package:fl/modules/home/MFHomePage.dart';
import 'package:fl/modules/mine/MFMinePage.dart';
import 'package:fl/modules/setting/MFSettingPage.dart';
import '../../const/MFConst.dart';


class MFMainPage extends StatefulWidget {

  final String title;

  MFMainPage({Key key, this.title}) :
        super(key: key);

  @override
  _MFMainPageState createState() => _MFMainPageState();

}


class _MFMainPageState extends State<MFMainPage> {



  final pages = <Widget>[
    MFHomePage(title: khomePageTitle),
    MFMinePage(title: kminePageTitle),
    MFSettingPage(title: ksetttingPageTitle),
  ];

  final _bottomTabbarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('我的')),
    BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('设置')),
  ];

  int selectIndex = 0;
  var selectPage;

  // ----------------------------------------------

  // 当插入渲染树的时候调用，这个函数在生命周期中只调用一次。这里可以做一些初始化工作，比如初始化State的变量
  @override
  void initState() {
//    selectPage = pages[selectIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold (


      body: IndexedStack(
        index: selectIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: _bottomTabbarItems,
        currentIndex: selectIndex,
        onTap: _onTapAction,
        type: BottomNavigationBarType.fixed,//显示模式
        fixedColor: Colors.redAccent,//选中颜色

      ),


    );
  }


  void _onTapAction(int index) {
    print('_onTapAction');
    setState(() {
      selectIndex = index;
    });
  }

}