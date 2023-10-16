import 'package:flutter/material.dart';
import 'package:phoenix_calendar/phoenix_calendar.dart';
import 'package:phoenix_line/phoenix_line.dart';
import 'package:phoenix_navbar/phoenix_navbar.dart';
import 'package:phoenix_toast/phoenix_toast.dart';

///标签选择view
class CalendarViewExample extends StatefulWidget {
  final String _title;

  CalendarViewExample(this._title);

  @override
  State<StatefulWidget> createState() => TagViewExamplePageState();
}

class TagViewExamplePageState extends State<CalendarViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PhoenixAppBar(
          title: widget._title,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              const Text('单选-无控制-周视图'),
              _calendarViewWeekNocontroll(context),
              const Line(
                height: 40.0,
              ),
              const Text('单选-无控制-周视图-自定义 WeekName'),
              _calendarViewWeekNocontrollCustomWeekName(context),
              const Line(
                height: 40.0,
              ),
              const Text('单选-周视图'),
              _calendarViewWeek(context),
              const Line(
                height: 40.0,
              ),
              const Text('范围选-周视图'),
              _calendarViewWeekRange(context),
              const Line(
                height: 40.0,
              ),
              const Text('单选-月视图'),
              _calendarViewMonth(context),
              const Line(
                height: 40.0,
              ),
              const Text('范围选-月视图'),
              _calendarViewMonthRange(context),
            ],
          ),
        ));
  }

  Widget _calendarViewWeekNocontroll(context) {
    return CalendarView.single(
      displayMode: DisplayMode.week,
      showControllerBar: false,
      dateChange: (date) {
        PhoenixToast.show('选中的时间： $date', context);
      },
    );
  }

  Widget _calendarViewWeekNocontrollCustomWeekName(context) {
    return CalendarView.single(
      displayMode: DisplayMode.week,
      showControllerBar: false,
      weekNames: ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
      dateChange: (date) {
        PhoenixToast.show('选中的时间： $date', context);
      },
    );
  }

  Widget _calendarViewWeek(context) {
    return CalendarView.single(
      displayMode: DisplayMode.week,
      initDisplayDate: DateTime.parse('2020-06-01'),
      minDate: DateTime(2020),
      maxDate: DateTime(2021),
      dateChange: (date) {
        PhoenixToast.show('选中的时间： $date', context);
      },
    );
  }

  Widget _calendarViewWeekRange(context) {
    return CalendarView.range(
      displayMode: DisplayMode.week,
      rangeDateChange: (rangeDate) {
        PhoenixToast.show(
            '开始时间： ${rangeDate.start} , 结束时间：${rangeDate.end}', context);
      },
    );
  }

  Widget _calendarViewMonth(context) {
    return CalendarView.single(
      initDisplayDate: DateTime.parse('2020-06-01'),
      minDate: DateTime(2020),
      maxDate: DateTime(2021),
      dateChange: (date) {
        PhoenixToast.show('选中的时间： $date', context);
      },
    );
  }

  Widget _calendarViewMonthRange(context) {
    return CalendarView.range(
      minDate: DateTime(2020),
      maxDate: DateTime(2023),
      rangeDateChange: (rangeDate) {
        PhoenixToast.show(
            '开始时间： ${rangeDate.start} , 结束时间：${rangeDate.end}', context);
      },
    );
  }
}
