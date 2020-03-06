import 'package:flutter/material.dart' hide Action;
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_bar.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/bottom_bar.dart';
import 'package:vsem_edu/common/gradient_container.dart';
import 'package:vsem_edu/common/navigation_drawer.dart';
import 'package:vsem_edu/common/routes.dart';
import 'package:vsem_edu/common/widgets/fab.dart';

import 'main_model.dart';


class BaseScreen extends StatefulWidget {

  final Widget child;

  const BaseScreen(this.child);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
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
      body: ChangeNotifierProvider<MainModel>(
        create: (context) => GetIt.instance<MainModel>(),
        child: Consumer<MainModel>(
          builder: (context, model, _) {
            if (model.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  key: Key('loading'),
                ),
              );
            }
            return widget.child;
          },
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
      floatingActionButton: FabWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: NavigationDrawer(),
    );
  }
}
