import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GDSC 모바일 스터디'),
          shape: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5
            )
          ),
        ),
        body: MyCalendar(),
      ),
    );
  }
}

class MyCalendar extends StatefulWidget {
  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 0.0),
          alignment: Alignment.centerLeft,
          child: Text(
              "과제",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160, height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black12, width: 1),
                boxShadow: [
                 BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // 그림자의 색상
                    spreadRadius: 1, // 그림자의 크기
                    blurRadius: 7, // 그림자의 흐림 정도
                    offset: Offset(0, 3), // 그림자의 위치
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "오늘의 과제",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        'book1.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ],
                ),
              ),

            ),
            SizedBox(
              width: 40,
            ),
            Container(
              width: 160, height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black12, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // 그림자의 색상
                    spreadRadius: 1, // 그림자의 크기
                    blurRadius: 7, // 그림자의 흐림 정도
                    offset: Offset(0, 3), // 그림자의 위치
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "수행한 과제",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        'book2.png',
                        width: 70,
                        height: 70,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 0.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "나의 수행도",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 450, height: 365,
          padding: EdgeInsets.all(10.0), // 테두리와 달력 사이의 간격
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // 테두리 색상 및 스타일 설정
            borderRadius: BorderRadius.circular(10.0), // 테두리 모서리 둥글게 만들기
          ),
          child: TableCalendar(

            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "나의 다짐",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "과제를 다 죽이겠다. 그르르르",
            style: TextStyle(
                fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}