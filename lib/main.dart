import 'package:flutter/material.dart';
import 'package:vsem_edu/app.dart';
import 'package:vsem_edu/repository/main_repository.dart';

Future<void> main() async {

  runApp(ProviderApp(
    repository: MainRepository(),
  ));
}