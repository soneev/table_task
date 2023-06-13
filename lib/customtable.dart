import 'package:customwidget/data.dart';
import 'package:customwidget/table_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}



class _CustomTableState extends State<CustomTable> {

  LinkedScrollControllerGroup controllerGroup = LinkedScrollControllerGroup();

  ScrollController? headerScrollController;
  ScrollController? secondheaderScrollController;
  ScrollController? dataScrollController;

  @override
  void initState() {
    super.initState();
    headerScrollController = controllerGroup.addAndGet();
    secondheaderScrollController = controllerGroup.addAndGet();
    dataScrollController = controllerGroup.addAndGet();
  }

  DatePickerController _controller = DatePickerController();

  final DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: SafeArea(
        child: Stack(
          children: [
            tableContent(),
            tableHeader(),
          ],
        ),
      ),
    );
  }

  Widget tableContent() {
    return SingleChildScrollView(
      child: Row(
        children: [
          DataTable(
            border: TableBorder.all(color: Colors.black),
            columns: TableDataHelper.kTableColumnsList.getRange(0, 1).map((e) {
              return DataColumn(
                label: SizedBox(
                  child: Text(e.title ?? ''),
                  width: e.width ?? 0,
                ),
              );
            }).toList(),
            rows: List.generate(8, (index) {
              return DataRow(cells: [
                DataCell(
                  SizedBox(
                    child: Text(totalInfo[index]),
                    width: TableDataHelper.kTableColumnsList.first.width,
                  ),
                )
              ]);
            }),
            headingRowColor: MaterialStateProperty.all(Colors.green),
            dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
          ), // start
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: dataScrollController,
              child: DataTable(
                border: TableBorder.all(color: Colors.black),
                headingRowColor: MaterialStateProperty.all(Colors.blue),
                dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
                columns: TableDataHelper.kTableColumnsList
                    .getRange(1, TableDataHelper.kTableColumnsList.length - 1)
                    .map((e) {
                  return DataColumn(
                    label: SizedBox(
                      child: Text(e.title ?? ''),
                      width: e.width ?? 0,
                    ),
                  );
                }).toList(),
                rows: List.generate(8, (index) {
                  return DataRow(cells: [
                    DataCell(
                      SizedBox(
                        child: Text(totalSun[index]),
                        width: TableDataHelper.kTableColumnsList[1].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: TextField(),
                        width: TableDataHelper.kTableColumnsList[2].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: TextField(),
                        width: TableDataHelper.kTableColumnsList[3].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: TextField(),
                        width: TableDataHelper.kTableColumnsList[4].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: TextField(),
                        width: TableDataHelper.kTableColumnsList[5].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: TextField(),
                        width: TableDataHelper.kTableColumnsList[6].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: TextField(),
                        width: TableDataHelper.kTableColumnsList[7].width,
                      ),
                    ),
                    // DataCell(
                  ]);
                }),
              ),
            ),
          ),
          // end
        ],
      ),
    );
  }

  Widget tableHeader() {
    return Column(
      children: [
        Row(
          children: [
            DataTable(
              border: TableBorder.all(color: Colors.black),
              columns:
                  TableDataHelper.kTableColumnsList.getRange(0, 1).map((e) {
                return DataColumn(
                  label: SizedBox(
                    child: Text(e.title ?? ''),
                    width: e.width ?? 0,
                  ),
                );
              }).toList(),
              rows: const [],
              headingRowColor: MaterialStateProperty.all(Colors.green),
              dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
            ), // start
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: headerScrollController,
                child: DataTable(
                  border: TableBorder.all(color: Colors.black),
                  headingRowColor: MaterialStateProperty.all(Colors.blue),
                  dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
                  columns: TableDataHelper.kTableColumnsList
                      .getRange(1, TableDataHelper.kTableColumnsList.length - 1)
                      .map((e) {
                    return DataColumn(
                      label: SizedBox(
                        child: Text(e.title ?? ''),
                        width: e.width ?? 0,
                      ),
                    );
                  }).toList(),
                  rows: const [],
                ),
              ),
            ),
            // end
          ],
        ),
        Row(
          children: [
            DataTable(
              border: TableBorder.all(color: Colors.black),
              columns:
                  TableDataHelper.kTableColumnsList.getRange(0, 1).map((e) {
                return DataColumn(
                  label: SizedBox(
                    child: Text(""),
                    width: e.width ?? 0,
                  ),
                );
              }).toList(),
              rows: const [],
              headingRowColor: MaterialStateProperty.all(Colors.green),
              dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
            ), // start
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: secondheaderScrollController,
                child: DataTable(
                  border: TableBorder.all(color: Colors.black),
                  headingRowColor: MaterialStateProperty.all(Colors.blue),
                  dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
                  columns: TableDataHelper.headerList
                      .getRange(1, TableDataHelper.headerList.length - 1)
                      .map((e) {
                    return DataColumn(
                      label: Text(getCurrentDate()),

                      // SizedBox(
                      //   child: Text(e.title ?? ''),
                      //   width: e.width ?? 0,
                      // ),
                    );
                  }).toList(),
                  rows: const [],
                ),
              ),
            ),
            // end
          ],
        ),
      ],
    );
  }

  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }
}
