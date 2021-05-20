import 'package:flutter/material.dart';
import 'package:plantmanager/choose_plant/choose_plant_page.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/my_plants/my_plants.dart';
import 'package:plantmanager/plant_details/plant_details_page.dart';
import 'package:plantmanager/shared/models/plants_model.dart';
import 'package:plantmanager/shared/models/success_model.dart';
import 'package:plantmanager/splash/splash_page.dart';
import 'package:plantmanager/sucess/success_page.dart';
import 'package:plantmanager/welcome/welcome_page.dart';
import 'package:plantmanager/confirm_name/confirm_name_page.dart';

class GenerateRoute extends Route<dynamic> {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _args = settings.arguments;

    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/confirmName':
        return MaterialPageRoute(builder: (_) => ConfirmNamePage());
      case '/success':
        {
          if (_args is SuccessModel) {
            return MaterialPageRoute(
              builder: (_) => SuccessPage(
                emojiPath: _args.emojiPath,
                title: _args.title,
                description: _args.description,
                buttonLabel: _args.buttonLabel,
                routeRedirect: _args.routeRedirect,
              ),
            );
          }

          return _messageError('An argument of type SuccessModel is required');
        }
      case '/choosePlant':
        return MaterialPageRoute(builder: (_) => ChoosePlantPage());
      case '/plantDetails':
        {
          if (_args is PlantsModel) {
            return MaterialPageRoute(
              builder: (_) => PlantDetailsPage(
                plant: _args,
              ),
            );
          }

          return _messageError('An argument of type String is required');
        }
      case '/myPlants':
        return MaterialPageRoute(builder: (_) => MyPlants());
      default:
        return _messageError('Named route not found.');
    }
  }

  static Route<dynamic> _messageError(String messageError) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text(
            messageError,
            style: TextStyle(
              fontFamily: 'Jost-Regular',
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
              color: AppColors.red,
            ),
          ),
        ),
        backgroundColor: AppColors.white,
      );
    });
  }
}
