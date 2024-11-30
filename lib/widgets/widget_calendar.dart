import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:hive_app/core/theme/app_colors.dart';

class WidgetCalendar extends StatelessWidget {
  final Function(DateTime)? onDateChange;
  final Color color;
  final Color dayColor;
  final Color activeColor;
  final Color activeDayColor;

  const WidgetCalendar(
      {super.key,
      this.onDateChange,
      this.color = AppColors.primaryColor,
      this.dayColor = AppColors.whiteColor,
      this.activeColor = AppColors.whiteColor,
      this.activeDayColor = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: onDateChange,
      headerProps: const EasyHeaderProps(
        showMonthPicker: false,
        dateFormatter: DateFormatter.custom('MMMM, y'), // July
      ),
      dayProps: EasyDayProps(
        height: 76.0,
        dayStructure: DayStructure.dayStrDayNum,
        inactiveDayStyle: DayStyle(
          dayStrStyle:  TextStyle(fontSize: 16.0, color: dayColor),
          dayNumStyle:  TextStyle(fontSize: 16.0, color: dayColor),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: color,
          ),
        ),
        activeDayStyle:  DayStyle(
          dayStrStyle:  TextStyle(color: activeDayColor),
          dayNumStyle:  TextStyle(color: activeDayColor),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: activeColor,
          ),
        ),
      ),
    );
  }
}
