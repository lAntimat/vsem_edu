import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsem_edu/home/todo_list_model.dart';

class StatsView extends StatelessWidget {
  const StatsView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Complete TODOs",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Selector<MainModel, int>(
              selector: (_, model) => 0,
              builder: (context, numCompleted, _) => Text(
                '$numCompleted',
                key: Key('__completed__'),
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
