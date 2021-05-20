import 'package:flutter/material.dart';
import 'package:plantmanager/shared/widgets/header_app_bar/header_app_bar_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({Key? key})
      : super(
          key: key,
          preferredSize: Size.fromHeight(200.0),
          child: HeaderAppBarWidget(),
        );
}
