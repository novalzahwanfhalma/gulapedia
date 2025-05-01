import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Simulasi data status hari
  final Map<DateTime, bool> completedDates = {
    DateTime.utc(2025, 2, 22): true,
    DateTime.utc(2025, 2, 23): true,
    DateTime.utc(2025, 2, 24): true,
    DateTime.utc(2025, 2, 27): false,
  };

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('d MMMM y', 'id_ID').format(_focusedDay)),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2024, 1, 1),
          lastDay: DateTime.utc(2026, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.month, // Format tetap bulan
          availableCalendarFormats: const {
            CalendarFormat.month: '', // Hilangkan label tombol
          },
          selectedDayPredicate:
              (day) => _isSameDay(_selectedDay ?? DateTime.now(), day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final isCompleted = completedDates.entries.any(
                (entry) => _isSameDay(entry.key, day),
              );
              final isDone = completedDates[day] == true;

              if (isCompleted) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        '${day.day}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      if (isDone)
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                );
              }

              return null; // default tampilan
            },
          ),
        ),
      ),
    );
  }
}
