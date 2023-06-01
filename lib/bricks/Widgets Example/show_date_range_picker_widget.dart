import 'package:flutter/material.dart';

// Call when you want the date time range picker to be shown
final DateTimeRange? newDate = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2017, 1),
                    lastDate: DateTime(2022, 7),
                    helpText: 'Select a date',
                  );