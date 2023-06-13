import 'package:customwidget/table_columns.dart';

class TableDataHelper {
  static List<TableColumns> kTableColumnsList = [
    TableColumns(title: 'Total info for the WEEK', width: 200),
    TableColumns(title: 'Total\n Sun-Sat ', width: 68.5),
    TableColumns(title: 'Sun', width: 68.5),
    TableColumns(title: 'Mon', width: 68.5),
    TableColumns(title: 'Tue', width: 68.5),
    TableColumns(title: 'Wed', width: 68.5),
    TableColumns(title: 'Thu', width: 68.5),
    TableColumns(title: 'Fri', width: 68.5),
    TableColumns(title: 'Sat', width: 68.5),
  ];

  static List<TableColumns> headerList = [
    TableColumns(title: '', width: 200),
    TableColumns(title: '', width: 55),
    TableColumns(title: '[Date]', width: 90.0),
    TableColumns(title: '[Date]', width: 60.0),
    TableColumns(title: '[Date]', width: 80.0),
    TableColumns(title: '[Date]', width: 120.0),
    TableColumns(title: '[Date]', width: 80.0),
    TableColumns(title: '[Date]', width: 70.0),
    TableColumns(title: '[Date]', width: 80.0),
  ];
}
