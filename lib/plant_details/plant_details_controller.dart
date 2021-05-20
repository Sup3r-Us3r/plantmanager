import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/main.dart';

class PlantDetailsController extends ChangeNotifier {
  TimeOfDay selectTimeData = TimeOfDay.fromDateTime(DateTime.now());

  Future<Null> selectTime(BuildContext context) async {
    var picked = await showTimePicker(
        context: context,
        initialTime: selectTimeData,
        helpText: 'Selecione um horário',
        confirmText: 'SALVAR',
        cancelText: 'CANCELAR',
        initialEntryMode: TimePickerEntryMode.input,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              accentColor: AppColors.green,
              colorScheme: ColorScheme.light(
                primary: AppColors.green,
              ),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: AppColors.white,
                helpTextStyle: AppTextStyles.bodyDark,
                dayPeriodColor: AppColors.white,
                dayPeriodTextColor: AppColors.green,
                dayPeriodTextStyle: AppTextStyles.bodyDark,
                dialBackgroundColor: AppColors.greenLight,
                entryModeIconColor: AppColors.gray,
                hourMinuteTextColor:
                    AppColors.green, // Número dentro do quadrado
                hourMinuteColor:
                    AppColors.greenLight, // Quadrado dentro dos números
                dialHandColor: AppColors.white,
                dialTextColor: AppColors.green,
              ),
            ),
            child: child!,
          );
        });

    if (picked != null) {
      selectTimeData = picked;

      notifyListeners();
    }
  }

  void scheduleNotification(TimeOfDay alert) async {
    var scheduleNotificationDataTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      alert.hour,
      alert.minute,
    );

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'plant_notif',
      'plant_notif',
      'Channel for plant notfication',
      icon: 'ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      sound: RawResourceAndroidNotificationSound(''),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      sound: '',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Chegou a hora',
      'Não esqueça de regar sua plantinha',
      scheduleNotificationDataTime,
      platformChannelSpecifics,
    );
  }
}
