// import 'package:dexter/models/products_model.dart';
// import 'package:dexter/theme/theme.dart';
// import 'package:flutter/material.dart';

// class ComboBox extends StatefulWidget {
//   const ComboBox({super.key});

//   @override
//   State<ComboBox> createState() => _ComboBoxState();
// }

// class _ComboBoxState extends State<ComboBox> {
//   final List<String> _categories =
//       ProductCategory.productCategories.map((e) => e.name).toSet().toList();

//   List<DropdownMenuItem<String>> _dropDownMenuItems = [];
//   String _currentCategory = "";

//   @override
//   void initState() {
//     _dropDownMenuItems = getDropDownMenuItems();
//     _currentCategory = _dropDownMenuItems[0].value!;
//     super.initState();
//   }

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     List<DropdownMenuItem<String>> items = [];
//     for (String name in _categories) {
//       items.add(DropdownMenuItem(value: name, child: Text(name)));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//           border: Border.all(color: AppTheme.secondary),
//           borderRadius: BorderRadius.circular(10)),
//       child: DropdownButton(
//         value: _currentCategory,
//         items: _dropDownMenuItems,
//         onChanged: changedDropDownItem,
//         icon: const Icon(Icons.arrow_circle_down_sharp),
//         isExpanded: true,
//         underline: Container(),
//       ),
//     );
//   }

//   void changedDropDownItem(String? selected) {
//     setState(() {
//       _currentCategory = selected!;
//     });
//   }
// }
