import 'package:flutter/material.dart';
import 'package:plantmanager/choose_plant/widgets/plants_enviroments/plants_enviroments_widget.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/shared/widgets/header_app_bar/header_app_bar_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({Key? key})
      : super(
          key: key,
          preferredSize: Size.fromHeight(300.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderAppBarWidget(),
              Padding(
                padding: EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                  bottom: 24.0,
                ),
                child: Text.rich(
                  TextSpan(
                    text: 'Em qual ambiente\n',
                    style: AppTextStyles.bodyDark,
                    children: [
                      TextSpan(
                        text: 'você quer colocar sua planta?',
                        style: AppTextStyles.bodyDark,
                      )
                    ],
                  ),
                ),
              ),
              PlantsEnviromentsWidget(),
            ],
          ),
        );
}
