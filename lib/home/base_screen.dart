import 'package:flutter/material.dart' hide Action;
import 'package:provider/provider.dart';
import 'package:vsem_edu/common/app_colors.dart';
import 'package:vsem_edu/common/navigation_drawer.dart';
import 'package:vsem_edu/common/routes.dart';

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
  final _tab = ValueNotifier(_HomeScreenTab.main);

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Ваш адрес", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
            Row(
              children: <Widget>[
                Text("г. Москва, Восточный район, ул. Ленина", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                Icon(Icons.arrow_drop_down)
              ],
            )
          ],
        ),
        actions: <Widget>[
          /*ValueListenableBuilder<_HomeScreenTab>(
            valueListenable: _tab,
            builder: (_, tab, __) => FilterButton(
              isActive: tab == _HomeScreenTab.todos,
            ),
          ),*/
        ],
      ),
      body: Selector<MainModel, bool>(
        selector: (context, model) => model.isLoading,
        builder: (context, isLoading, _) {
          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(
                key: Key('loading'),
              ),
            );
          }

          return widget.child;
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<_HomeScreenTab>(
        valueListenable: _tab,
        builder: (context, tab, _) {
          return BottomAppBar(
            key: Key('__tabs__'),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.supervised_user_circle),
                  color: Colors.white,
                  onPressed: () {
                    _tab.value = _HomeScreenTab.values[0];
                  },
                ),
                IconButton(
                  icon: Icon(Icons.volume_mute),
                  color: Colors.white,
                  onPressed: () {
                   Navigator.pushNamed(context, AppRoutes.merchantDetail);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: const Icon(
            Icons.shopping_basket,
            color: AppColors.white,
          ),
          backgroundColor: AppColors.blackBg,
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: NavigationDrawer(),
    );
  }

/*void _showUndoSnackbar(BuildContext context, Todo todo) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        key: ArchSampleKeys.snackbar,
        duration: const Duration(seconds: 2),
        content: Text(
          ArchSampleLocalizations.of(context).todoDeleted(todo.task),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        action: SnackBarAction(
          key: ArchSampleKeys.snackbarAction(todo.id),
          label: ArchSampleLocalizations.of(context).undo,
          onPressed: () =>
              Provider.of<TodoListModel>(context, listen: false).addTodo(todo),
        ),
      ),
    );
  }*/
}

enum _HomeScreenTab { main, stats }
