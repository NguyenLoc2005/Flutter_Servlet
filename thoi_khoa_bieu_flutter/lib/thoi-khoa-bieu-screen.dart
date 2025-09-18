import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thoi_khoa_bieu_flutter/drawer.dart';

class ThoiKhoaBieuScreen extends StatefulWidget {
  const ThoiKhoaBieuScreen({super.key});

  @override
  State<ThoiKhoaBieuScreen> createState() => _ThoiKhoaBieuScreenState();
}

class _ThoiKhoaBieuScreenState extends State<ThoiKhoaBieuScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thời khóa biểu")),
      drawer: const AppDrawer(),

      // Body hiển thị lịch theo tuần
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TableCalendar(
          firstDay: DateTime.utc(2025, 1, 1),
          lastDay: DateTime.utc(2025, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              // TODO: hiển thị môn học trong ngày
            });
          },
          calendarFormat: CalendarFormat.week, // Chỉ hiển thị tuần
          availableCalendarFormats: const {CalendarFormat.week: 'Tuần'},
        ),
      ),

      // Nút "Thêm mới" nổi ở dưới bên phải
      floatingActionButton: FloatingActionButton(
        onPressed: addItems,
        child: const Icon(Icons.add),
        tooltip: "Thêm mới",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  addItems() {
    // TODO: thêm logic thêm môn học
    print("Nhấn nút thêm mới");
  }
}
