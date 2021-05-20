import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantmanager/choose_plant/choose_plant_controller.dart';
import 'package:plantmanager/choose_plant/choose_plant_state.dart';
import 'package:plantmanager/choose_plant/widgets/app_bar/app_bar_widget.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

class ChoosePlantPage extends StatelessWidget {
  ChoosePlantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChoosePlantController _controller =
        Provider.of<ChoosePlantController>(context);

    if (_controller.plants.isEmpty) {
      _controller.getPlants();
    }

    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
          top: 0.0,
          left: 10.0,
          right: 10.0,
          bottom: 20.0,
        ),
        child: (_controller.statePlants == ChoosePlantState.success)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: _controller.plantsFiltered.length,
                itemBuilder: (context, index) {
                  var _plants = _controller.plantsFiltered[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/plantDetails',
                        arguments: _plants,
                      );
                    },
                    child: Container(
                      height: 154.0,
                      width: 148.0,
                      decoration: BoxDecoration(
                        gradient: AppGradients.backgroundEnviroments,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: SvgPicture.network(
                              _plants.photo,
                              height: 90.0,
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            flex: 2,
                            child: Text(
                              _plants.name,
                              style: AppTextStyles.heading,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.gray.withAlpha(150),
                  valueColor: AlwaysStoppedAnimation(
                    AppColors.gray,
                  ),
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
