import 'package:flutter/material.dart';
import 'package:plantmanager/choose_plant/choose_plant_controller.dart';
import 'package:plantmanager/choose_plant/choose_plant_state.dart';
import 'package:plantmanager/core/core.dart';
import 'package:provider/provider.dart';

class PlantsEnviromentsWidget extends StatelessWidget {
  PlantsEnviromentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChoosePlantController _controller =
        Provider.of<ChoosePlantController>(context);

    if (_controller.plantsEnvironments.isEmpty) {
      _controller.getPlantsEnviroments();
    }

    return Container(
        margin: EdgeInsets.only(left: 32.0),
        height: 40.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 40.0,
              width: 76.0,
              margin: EdgeInsets.only(right: 4.0),
              decoration: BoxDecoration(
                color: _controller.buttonSelected == index
                    ? AppColors.greenLight
                    : null,
                gradient: _controller.buttonSelected == index
                    ? null
                    : AppGradients.backgroundEnviroments,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextButton(
                onPressed: () => _controller.handleButtonSelected(
                  index,
                  _controller.plantsEnvironments[index].key,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  overlayColor: _controller.buttonSelected == index
                      ? MaterialStateProperty.all<Color>(AppColors.shape)
                      : MaterialStateProperty.all<Color>(AppColors.greenLight),
                ),
                child: _controller.statePlantsEnvironments ==
                        ChoosePlantState.success
                    ? Text(
                        _controller.plantsEnvironments[index].title,
                        style: _controller.buttonSelected == index
                            ? AppTextStyles.heading
                            : AppTextStyles.heading,
                      )
                    : Container(
                        height: 16.0,
                        width: 16.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          backgroundColor: AppColors.gray.withAlpha(150),
                          valueColor: AlwaysStoppedAnimation(
                            AppColors.gray,
                          ),
                        ),
                      ),
              ),
            );
          },
        ));
  }
}
