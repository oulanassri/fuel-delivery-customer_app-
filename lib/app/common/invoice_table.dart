import 'package:flutter/material.dart';

import '../../models/order.dart';
import '../constants.dart';

class InvoiceTable extends StatelessWidget {
  InvoiceTable({Key? key, required this.ordersModel}) : super(key: key);
  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text(
                    "الخدمة",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "الكميّة",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "المبلغ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
              rows: [
                invoiceDataRow(
                    context: context,
                    serviceName: ordersModel.fuelTypeName ?? "",
                    quantity: ordersModel.finalQuantity ??  ordersModel.orderedQuantity.toString()??"",
                    amount: ordersModel.price ?? "",),

              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow invoiceDataRow({
    required BuildContext context,
    required String serviceName,
    required String quantity,
    required String amount,
  }) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            serviceName ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            quantity ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            amount ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
