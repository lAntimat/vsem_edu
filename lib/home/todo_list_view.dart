import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/home/home_models.dart';

import 'main_model.dart';

class TodoListView extends StatelessWidget {
  final void Function(BuildContext context, CuisineListItem todo) onRemove;

  TodoListView({Key key, @required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<MainModel, List<CuisineListItem>>(
      selector: (_, model) => model.cuisines,
      builder: (context, todos, _) {
        return Container();
      }
    );
  }
}
