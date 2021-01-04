import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}

class Favorite_Selection_Screen extends StatefulWidget {
  Favorite_Selection_Screen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Favorite_Selection_ScreenState createState() =>
      _Favorite_Selection_ScreenState();
}

class _Favorite_Selection_ScreenState extends State<Favorite_Selection_Screen> {
  static List<Animal> _animals = [
    Animal(id: 1, name: "Ngoai Ngu"),
    Animal(id: 2, name: "Toan Hoc"),
    Animal(id: 3, name: "Sinh Hoc"),
    Animal(id: 4, name: "Hoa Hoc"),
    Animal(id: 5, name: "Su Hoc"),
    Animal(id: 6, name: "Dia Ly"),
    Animal(id: 7, name: "Ngon Tinh"),
    Animal(id: 8, name: "Trinh Tham"),
    Animal(id: 9, name: "Thien Van Hoc"),
    Animal(id: 10, name: "Triet Hoc"),
    Animal(id: 11, name: "Nho Giao"),
    Animal(id: 12, name: "Am Nhac"),
    Animal(id: 13, name: "Thieu Nhi"),
    Animal(id: 14, name: "Truyen Tranh"),
    Animal(id: 15, name: "Khoa Hoc"),
    Animal(id: 16, name: "Kinh Te"),
    Animal(id: 17, name: "Qqqqq"),
    Animal(id: 18, name: "Wwwww"),
    Animal(id: 19, name: "Eeeee"),
    Animal(id: 20, name: "Rrrrrr"),
    Animal(id: 21, name: "Ttttttt"),
    Animal(id: 22, name: "Yyyyyyy"),
    Animal(id: 23, name: "Uuuuuu"),
    Animal(id: 24, name: "Iiiiiii"),
    Animal(id: 25, name: "Abcdef"),
    Animal(id: 26, name: "Pooooooo"),
    Animal(id: 27, name: "Dertyui"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  List<Animal> _selectedAnimals = [];
  List<Animal> _selectedAnimals2 = [];
  List<Animal> _selectedAnimals3 = [];
  List<Animal> _selectedAnimals4 = [];
  List<Animal> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _animals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                textColor: Colors.deepPurple[900],
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.deepPurple[900],
                    width: 0.8,
                  ),
                ),
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                textColor: Colors.deepPurple[900],
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.deepPurple[900],
                    width: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Favorite Book Category'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              // SizedBox(height: 40),
              // //################################################################################################
              // // Rounded blue MultiSelectDialogField
              // //################################################################################################
              // MultiSelectDialogField(
              //   items: _items,
              //   title: Text("Animals"),
              //   selectedColor: Colors.blue,
              //   decoration: BoxDecoration(
              //     color: Colors.blue.withOpacity(0.1),
              //     borderRadius: BorderRadius.all(Radius.circular(40)),
              //     border: Border.all(
              //       color: Colors.blue,
              //       width: 2,
              //     ),
              //   ),
              //   buttonIcon: Icon(
              //     Icons.pets,
              //     color: Colors.blue,
              //   ),
              //   buttonText: Text(
              //     "Favorite Animals",
              //     style: TextStyle(
              //       color: Colors.blue[800],
              //       fontSize: 16,
              //     ),
              //   ),
              //   onConfirm: (results) {
              //     _selectedAnimals = results;
              //   },
              // ),
              // SizedBox(height: 50),
              //################################################################################################
              // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
              // decoration applied. This allows the ChipDisplay to render inside the same Container.
              //################################################################################################
              // Container(
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).primaryColor.withOpacity(.4),
              //     border: Border.all(
              //       color: Theme.of(context).primaryColor,
              //       width: 2,
              //     ),
              //   ),
              //   child: Column(
              //     children: <Widget>[
              //       MultiSelectBottomSheetField(
              //         initialChildSize: 0.4,
              //         listType: MultiSelectListType.CHIP,
              //         searchable: true,
              //         buttonText: Text("Favorite Animals"),
              //         title: Text("Animals"),
              //         items: _items,
              //         onConfirm: (values) {
              //           _selectedAnimals2 = values;
              //         },
              //         chipDisplay: MultiSelectChipDisplay(
              //           onTap: (value) {
              //             setState(() {
              //               _selectedAnimals2.remove(value);
              //             });
              //           },
              //         ),
              //       ),
              //       _selectedAnimals2 == null || _selectedAnimals2.isEmpty
              //           ? Container(
              //               padding: EdgeInsets.all(10),
              //               alignment: Alignment.centerLeft,
              //               child: Text(
              //                 "None selected",
              //                 style: TextStyle(color: Colors.black54),
              //               ))
              //           : Container(),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 40),
              //################################################################################################
              // MultiSelectBottomSheetField with validators
              //################################################################################################
              MultiSelectBottomSheetField<Animal>(
                key: _multiSelectKey,
                initialChildSize: 0.7,
                maxChildSize: 0.95,
                title: Text("Book Categories"),
                buttonText: Text(
                  "Press To Choose",
                  style: TextStyle(fontSize: 16),
                ),
                items: _items,
                searchable: true,
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return "Required";
                  }
                  List<String> names = values.map((e) => e.name).toList();
                  if (names.contains("Frog")) {
                    return "Frogs are weird!";
                  }
                  return null;
                },
                onConfirm: (values) {
                  setState(() {
                    _selectedAnimals3 = values;
                  });
                  _multiSelectKey.currentState.validate();
                },
                chipDisplay: MultiSelectChipDisplay(
                  onTap: (item) {
                    setState(() {
                      _selectedAnimals3.remove(item);
                    });
                    _multiSelectKey.currentState.validate();
                  },
                  icon: Icon(
                    Icons.clear_rounded,
                    size: 5,
                    color: Colors.red,
                  ),
                  chipColor: Colors.white,
                  textStyle: TextStyle(
                    color: Colors.deepPurple[900],
                    fontSize: 14,
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.deepPurple[900],
                      width: 0.8,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              //################################################################################################
              // MultiSelectChipField
              //################################################################################################
              // MultiSelectChipField(
              //   items: _items,
              //   title: Text("Animals"),
              //   headerColor: Colors.blue.withOpacity(0.5),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.blue[700], width: 1.8),
              //   ),
              //   selectedChipColor: Colors.blue.withOpacity(0.5),
              //   selectedTextStyle: TextStyle(color: Colors.blue[800]),
              //   onTap: (values) {
              //     _selectedAnimals4 = values;
              //   },
              // ),
              // SizedBox(height: 40),
              //################################################################################################
              // MultiSelectDialogField with initial values
              //################################################################################################
              // MultiSelectDialogField(
              //   items: _items,
              //   initialValue:
              //       _selectedAnimals5, // setting the value of this in initState() to pre-select values.
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
