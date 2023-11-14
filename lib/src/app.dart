import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'styles/colors.dart';

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.pageColor,
      statusBarColor: Colors.transparent,
    ));



    return const Placeholder();
  }
}
