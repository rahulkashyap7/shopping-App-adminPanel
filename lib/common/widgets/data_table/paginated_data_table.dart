import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/common/widgets/loaders/animation_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

/// Custom PaginatedDataTable widget with additional features
class RPaginatedDataTable extends StatelessWidget {
  const RPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = 760,
    this.onPageChanged,
    this.sortColumnIndex,
    this.dataRowHeight = RSizes.xl * 2,
    this.minWidth = 1000, this.sortAscending = true,
  });

  /// Whether to sort the DataTable in ascending or descending order.
  final bool sortAscending;


  /// Index of the column to sort by.
  final int? sortColumnIndex;

  /// Number of rows to display per page.
  final int rowsPerPage;

  /// Data source for the DataTable.
  final DataTableSource source;

  /// List of Column for the DataTable.
  final List<DataColumn> columns;

  /// Callback function to handle page changes.
  final Function(int)? onPageChanged;

  /// Height of each data row in the DataTable
  final double dataRowHeight;

  /// Height of the entire DataTable.
  final double tableHeight;

  /// Minimum width of the entire DataTable.
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // set the dynamic height of the PaginatedDataTable
      height: tableHeight,
      child: Theme(
        // Use to set the Backend color
        data: Theme.of(context).copyWith(cardTheme: CardThemeData(color: Colors.white, elevation: 0)),
        child: PaginatedDataTable2(
          source: source,
          columns: columns,
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          rowsPerPage: rowsPerPage,
          showFirstLastButtons: true,
            showCheckboxColumn: true,
          sortAscending: sortAscending,
          onPageChanged: onPageChanged,
          dataRowHeight: dataRowHeight,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (noOfRows){},
          sortColumnIndex: sortColumnIndex,

          /// Header Design
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith((states) =>
          RColors.primaryBackground),
          empty: RAnimationLoaderWidget(animation: RImages.packageAnimation,
              text: 'Nothing Found', height: 200, width: 200),
          headingRowDecoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(RSizes.borderRadiusMd),
              topRight: Radius.circular(RSizes.borderRadiusMd),
            ),
          ),
          sortArrowBuilder: (bool ascending, bool sorted){
            if (sorted) {
              return Icon(ascending ? Iconsax.arrow_up3 : Iconsax.arrow_down,
                  size: RSizes.iconSm);
            } else{
              return const Icon(Iconsax.arrow_3, size: RSizes.iconSm);
            }
          },
        ),
      ),
    );
  }
}
