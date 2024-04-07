import 'package:grass_quest/Strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grass_quest/features/core/core_controller';
import 'package:grass_quest/ColorsC.dart';
import 'core_controller';

class CoreTab extends GetView<CoreController> {
  const CoreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => WillPopScope(
        onWillPop: () {
          return controller.onWillPop();
        },
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    var itemSize = 22.0;
    var topPadding = 14.0;
    var bottomPadding = 2.0;
    return Scaffold(
      body: IndexedStack(
        index: controller.pageIndex.value,
        children: List<Widget>.generate(
          controller.pageList.length,
              (int index) {
            return Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return controller.onGenerateRoute(
                    settings, controller.pageList[index]);
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(shape: BoxShape.rectangle, boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 12,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(17),
            topLeft: Radius.circular(17),
          ),
          child: BottomNavigationBar(
            onTap: (value) {
              controller.switchTab(value);
            },
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(fontSize: 11),
            unselectedLabelStyle: TextStyle(fontSize: 11),
            selectedItemColor: Colors.lightGreenAccent,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentTabIndex.value,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                      bottom: 10, top: 10),
                  child:Icon(Icons.home)
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                      bottom: 10, top: 10),
                  child:Icon(Icons.account_balance)
                ),
                label: '',
              ),

            ],
          ),
        ),
      ),
    );
  }



}

