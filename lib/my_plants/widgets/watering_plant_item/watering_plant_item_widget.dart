import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/my_plants/my_plants_controller.dart';
import 'package:provider/provider.dart';

class WateringPlantItemWidget extends StatelessWidget {
  WateringPlantItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyPlantsController _controller =
        Provider.of<MyPlantsController>(context);

    return _controller.myPlants.length == 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/noPlants.svg',
                  height: 150.0,
                ),
                SizedBox(height: 20.0),
                Text('Você não possui plantas', style: AppTextStyles.bodyDark),
              ],
            ),
          )
        : ListView.builder(
            itemCount: _controller.myPlants.length,
            itemBuilder: (context, index) {
              // Sorted plants from ascendent time
              _controller.myPlants.sort(
                (a, b) => DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  a.remember.hour,
                  a.remember.minute,
                ).compareTo(
                  DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    b.remember.hour,
                    b.remember.minute,
                  ),
                ),
              );

              var myPlant = _controller.myPlants[index];

              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                height: 80.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.shape.withOpacity(.5),
                      AppColors.blueLight.withOpacity(.5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Dismissible(
                    key: Key(DateTime.now().millisecond.toString()),
                    background: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      color: AppColors.red,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.delete_outline,
                          color: AppColors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    // onDismissed: (_) {
                    //   _controller.handleShowModal(context, myPlant.plant);
                    // },
                    confirmDismiss: (DismissDirection direction) async {
                      await _controller.handleShowModal(context, myPlant.plant);

                      if (_controller.confirmPlantCancel) {
                        return false;
                      } else {
                        return true;
                      }
                    },
                    secondaryBackground: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      color: Color(0xFFE83F5B),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete_outline,
                          color: AppColors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.network(
                            myPlant.plant.photo,
                            height: 50.0,
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: Text(
                              myPlant.plant.name,
                              style: TextStyle(
                                fontFamily: 'Jost-Medium',
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0,
                                color: Color(0xFF5C6660),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Regar às',
                                style: TextStyle(
                                  fontFamily: 'Jost-Regular',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0,
                                  color: Color(0xFFDCDCE5),
                                ),
                              ),
                              SizedBox(height: 3.0),
                              Text(
                                '${myPlant.remember.hour}:${myPlant.remember.minute}',
                                style: TextStyle(
                                  fontFamily: 'Jost-Medium',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                  color: Color(0xFF5C6660),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
