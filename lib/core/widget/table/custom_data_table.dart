import 'package:flutter/material.dart';


class CustomDataTable extends StatelessWidget {
final List<dynamic> dataList;
final List<DataColumn> columns;
final List<DataRow> rows;
final TextStyle? headingTextStyle;
final TextStyle? dataTextStyle;
final double? dividerThickness;
const CustomDataTable({Key? key,required this.dataList,required this.columns,required this.rows,this.headingTextStyle,this.dataTextStyle,this.dividerThickness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DataTable(
      headingTextStyle:headingTextStyle,
      dataTextStyle:dataTextStyle,
      showCheckboxColumn: false,
      columnSpacing: 10,
      headingRowHeight: 50,
     // minWidth: MediaQuery.of(context).size.width,
      horizontalMargin: 12,
      dividerThickness:dividerThickness ,
      showBottomBorder: true,
      columns: columns,
      rows:rows,

    );
  }
}
