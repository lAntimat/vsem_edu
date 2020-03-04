import 'package:flutter/material.dart' hide Action;
import 'package:vsem_edu/common/app_bar.dart';
import 'package:vsem_edu/common/bottom_bar.dart';
import 'package:vsem_edu/common/navigation_drawer.dart';
import 'package:vsem_edu/common/widgets/fab.dart';

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
    return Scaffold(
      appBar: AppBarWidget().build(context),
      body: widget.child,
      bottomNavigationBar: BottomBarWidget(),
      floatingActionButton: FabWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: NavigationDrawer(),
    );
  }
}
