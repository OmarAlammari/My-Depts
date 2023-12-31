// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:testing_2/model/model_customer.dart';
import 'package:testing_2/theme.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  List<String> names = [
    "محمد",
    "أحمد",
    "علي",
    "عبد الله",
    "حسن",
    "عمر",
    "فاطمة",
    "عائشة",
    "مريم"
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "بحث الأسماء",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "أدخل اسمًا للبحث",
              ),
              onChanged: (text) {
                setState(() {
                  searchText = text;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  String name = names[index];
                  bool isMatch =
                      name.toLowerCase().contains(searchText.toLowerCase());
                  return ListTile(
                    title: Text(name),
                    enabled: isMatch,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class MyDialog extends StatefulWidget {
//   @override
//   _MyDialogState createState() => _MyDialogState();
// }

// class _MyDialogState extends State<MyDialog> {
//   List<String> names = [
//     "محمد",
//     "أحمد",
//     "علي",
//     "عبد الله",
//     "حسن",
//     "عمر",
//     "فاطمة",
//     "عائشة",
//     "مريم"
//   ];

//   String searchText = "";

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         width: 200,
//         height: 200,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "بحث الأسماء",
//               style: TextStyle(fontSize: 20),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "أدخل اسمًا للبحث",
//               ),
//               onChanged: (text) {
//                 setState(() {
//                   searchText = text;
//                 });
//               },
//             ),
//             ListView.builder(
//               itemCount: names.length,
//               itemBuilder: (context, index) {
//                 String name = names[index];
//                 bool isMatch =
//                     name.toLowerCase().contains(searchText.toLowerCase());
//                 return ListTile(
//                   title: Text(name),
//                   enabled: isMatch,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DialogBox extends StatefulWidget {
//   const DialogBox({super.key});

//   @override
//   State<DialogBox> createState() => _DialogBoxState();
// }

// class _DialogBoxState extends State<DialogBox> {
//   @override
//   List<String> names = ['John', 'Jane', 'David', 'Sarah', 'Michael'];
//   List<String> filteredNames = [];

//   void filterNames(String searchQuery) {
//     setState(() {
//       filteredNames = names
//           .where(
//               (name) => name.toLowerCase().contains(searchQuery.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Dialog Box'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             onChanged: (value) => filterNames(value),
//             decoration: InputDecoration(
//               labelText: 'Search',
//             ),
//           ),
//           SizedBox(height: 10),
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: filteredNames.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(filteredNames[index]),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

class DialogBox_1 extends StatefulWidget {
  List<ModelCustomer> names;
  DialogBox_1({
    Key? key,
    required this.names,
  }) : super(key: key);

  @override
  State<DialogBox_1> createState() => _DialogBox_1State();
}

class _DialogBox_1State extends State<DialogBox_1> {
  bool showResults = false;
  String? selectedTitle;
  // List<ModelCustomer> names = [];

  List<ModelCustomer> searchResults = [];

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        // showResults = false;
        searchResults = widget.names;
      });
    } else {
      // List<ModelCustomer> results = modelList!.where((customer) {
      searchResults = widget.names.where((customer) {
        return customer.nameCustomer
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
      showResults = true;
      setState(() {
        // searchResults = results;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    searchResults = widget.names;
  }

  @override
  Widget build(BuildContext context) {
    // title: const Text("Select Data"),
    // content: Column(
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            // physics: ScrollPhysics(),
            child: Column(
              // physics: const BouncingScrollPhysics(),
              // mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 16),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[400],
                      // color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Search',
                            ),
                            onChanged: (value) => search(value),
                            // onTap: () => Navigator.pushNamed(
                            //     context, Name.iDSearchScreenCustomers),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(
                            // searchResults[index].nameCustomer,
                            widget.names[index].nameCustomer,
                            style: titleStyle,
                            // style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            setState(() {
                              selectedTitle = searchResults[index].nameCustomer;
                            });
                            Navigator.pop(context, selectedTitle);
                          },
                          // style: ,
                        ),
                        const Divider(
                          height: 5,
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

// //alertDialogBox.dart
// class DialogBox_2 {
//   Widget dialog1({required BuildContext context, required List listCustomer}) {
//     return AlertDialog(
//       title: const Text("Select Data"),
//       content: CustomScrollView(
//         slivers: <Widget>[
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: 16, left: 16, right: 16, bottom: 16),
//               child: Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.grey[400],
//                   // color: Colors.white,
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 8),
//                     const Icon(Icons.search, color: Colors.grey),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: TextField(
//                         decoration: const InputDecoration.collapsed(
//                           hintText: 'Search',
//                         ),
//                         onChanged: (value) => search(value),
//                         // onTap: () => Navigator.pushNamed(
//                         //     context, Name.iDSearchScreenCustomers),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )

//           // Column(
//           //   children: [
//           //     Container(
//           //       height: 40,
//           //       decoration: BoxDecoration(
//           //         borderRadius: BorderRadius.circular(8),
//           //         color: Colors.grey[400],
//           //         // color: Colors.white,
//           //       ),
//           //       child: Row(
//           //         children: [
//           //           const SizedBox(width: 8),
//           //           const Icon(Icons.search, color: Colors.grey),
//           //           const SizedBox(width: 8),
//           //           Expanded(
//           //             child: TextField(
//           //               decoration: const InputDecoration.collapsed(
//           //                 hintText: 'Search',
//           //               ),
//           //               onTap: () {
//           //                 // Navigator.pushNamed(
//           //                 //   context, Name.iDSearchScreenCustomers);
//           //               },
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //     Expanded(
//           //       child: ListView.builder(
//           //         itemCount: listCustomer.length,
//           //         itemBuilder: (BuildContext context, int index) {
//           //           return Text(listCustomer[index].toString());
//           //         },
//           //       ),
//           //     ),
//         ],
//       ),
//     );
//   }

//   Widget dialog2({
//     required BuildContext context,
//   }) {
//     ModelCustomer? model;
//     List<ModelCustomer>? modelList = [
//       ModelCustomer(id: 0, name: 'omar alammari alammari', credit: '2000'),
//       ModelCustomer(id: 1, name: 'omar1', credit: '4000'),
//       ModelCustomer(id: 1, name: 'omar1', credit: '4000'),
//       ModelCustomer(id: 1, name: 'omar1', credit: '4000'),
//       ModelCustomer(id: 1, name: 'omar1', credit: '4000'),
//       ModelCustomer(id: 1, name: 'omar1', credit: '4000'),
//       ModelCustomer(id: 1, name: 'omar1', credit: '4000'),
//       ModelCustomer(id: 1, name: 'omar1', credit: '4000'),
//       ModelCustomer(id: 1, name: 'omar1', credit: '4000'),
//     ];
//     return AlertDialog(
//       title: const Text("Select Data"),
//       content: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: ListView.builder(
//           // physics: const NeverScrollableScrollPhysics(),
//           // padding: const EdgeInsets.only(top: 10),
//           padding: EdgeInsets.zero,
//           // physics: const NeverScrollableScrollPhysics(),
//           itemCount: modelList.length,
//           itemBuilder: (context, index) {
//             ModelCustomer model = modelList[index];
//             return Column(
//               children: [
//                 if (index != 0)
//                   const Divider(
//                       // height: 0,
//                       ),
//                 Text(model.name),
//                 // if (index == (modelList.length - 1)) const Divider(),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget dialog({
//     required BuildContext context,
//     required Function() onPressed,
//     required TextEditingController textEditingController1,
//     required TextEditingController textEditingController2,
//     // required FocusNode input1FocusNode,
//     // required FocusNode input2FocusNode
//   }) {
//     return AlertDialog(
//       title: const Text("Enter Data"),
//       content: Container(
//         height: 100,
//         child: Column(
//           children: [
//             TextFormField(
//               controller: textEditingController1,
//               keyboardType: TextInputType.text,
//               // focusNode: input1FocusNode,
//               decoration: const InputDecoration(hintText: "Fruit Name"),
//               autofocus: true,
//               onFieldSubmitted: (value) {
//                 // input1FocusNode.unfocus();
//                 // FocusScope.of(context).requestFocus(input2FocusNode);
//               },
//             ),
//             TextFormField(
//               controller: textEditingController2,
//               keyboardType: TextInputType.number,
//               // focusNode: input2FocusNode,
//               decoration: const InputDecoration(hintText: "Quantity"),
//               onFieldSubmitted: (value) {
//                 // input2FocusNode.unfocus();
//               },
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         MaterialButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           color: Colors.blueGrey,
//           child: const Text(
//             "Cancel",
//           ),
//         ),
//         MaterialButton(
//           onPressed: onPressed,
//           color: Colors.blue,
//           child: const Text("Submit"),
//         )
//       ],
//     );
//   }
// }
