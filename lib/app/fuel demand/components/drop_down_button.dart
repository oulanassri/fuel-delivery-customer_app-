// import 'package:delivery_fuel_customer/app/constants.dart';
// import 'package:flutter/material.dart';
//
// import '../fuel_demand_controller.dart';
//
// class DropDownButton extends StatelessWidget {
//   final List<String> itemsList;
//   FuelDemandController fuelDemandController;
//
//   DropDownButton(
//       {Key? key, required this.fuelDemandController, required this.itemsList})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4),
//           border: Border.all(color: Colors.grey)),
//       child: ExpansionTile(
//           title: Text(
//             fuelDemandController.selectedCar.value,
//             style: TextStyle(color: Colors.black),
//           ),
//           children: itemsList
//               .map(
//                 (name) => ListTile(
//                   shape: RoundedRectangleBorder(
//                     side: const BorderSide(color: bgColor, width: 1),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   title: Text(
//                     name,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   onTap: () {
//
//                     fuelDemandController.setSelectedCar(name);
//
//                     // expansionTile.currentState.collapse();
//                   },
//                 ),
//               )
//               .toList()),
//     );
//   }
// }
