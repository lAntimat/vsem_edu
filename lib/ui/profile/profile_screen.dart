import 'package:flutter/material.dart' hide Action;
import 'package:vsem_edu/common/gradient_container.dart';

class ProfileScreen extends StatefulWidget {
  final Widget child;

  const ProfileScreen(this.child);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Because the state of the tabs is only a concern to the HomeScreen Widget,
  // it is stored as local state rather than in the TodoListModel.

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Мой профиль"),
          backgroundColor: Colors.transparent,
        ),
        body: widget.child,
        /*bottomNavigationBar: BottomBarWidget(),
        floatingActionButton: FabWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: NavigationDrawer(),*/
      ),
    );
  }
}
