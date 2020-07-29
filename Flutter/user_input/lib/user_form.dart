import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class MealAdderWindow extends StatefulWidget{
  @override
  _MealAdderWindowState createState() => _MealAdderWindowState();
}

class _MealAdderWindowState extends State<MealAdderWindow> {
  final _titleController = TextEditingController();

  TimeOfDay chosenTime;

  DateTime chosenDate;

  DateTime finalDate;

  File storedImage;

  void _submitData() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || finalDate == null || chosenDate == null || chosenTime == null) {
      return;
    }

    Navigator.of(context).pop();
  }

  void presentDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((pickedDate) {
      chosenDate = pickedDate;
      presentTimePicker(context);
    });
  }

  void presentTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    ).then((chosen) {
      chosenTime = chosen;
      setState(() {
        finalDate = DateTime(chosenDate.year, chosenDate.month, chosenDate.day,
          chosenTime.hour, chosenTime.minute);
      });
    });
  }

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      storedImage = imageFile;
    });
    final Directory extDir = await syspaths.getExternalStorageDirectory();
    final String dirPath = '${extDir.path}/Pictures';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${DateTime.now()}.jpg';
    final savedImage = await imageFile.copy(filePath);
  }

  @override
  Widget build(BuildContext context) => KeyboardAvoider(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(200, 50),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.43,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/fab-delete.png'),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Enter the Meal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Meal'),
                          controller: _titleController,
                          onSubmitted: (val) {_submitData();},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.09,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 15, bottom: 10, right: 10, left: 25),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 170,
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: storedImage != null
                              ? Image.file(
                                  storedImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                              : Text(
                                  'No Image Chosen',
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                            child: FlatButton.icon(
                            icon: Icon(Icons.camera),
                            label: Text('Take Picture'),
                            textColor: Colors.red,
                            onPressed: _takePicture,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text(finalDate == null
                              ? '${DateFormat.yMMMEd().add_Hm().format(DateTime.now())}'
                              : '${DateFormat.yMMMEd().add_Hm().format(finalDate)}',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        FlatButton(
                          child: Text(
                            'Choose Time',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            presentDatePicker(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.03,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 15),
                  width: MediaQuery.of(context).size.width,
                  alignment: AlignmentDirectional.bottomEnd,
                  child: RaisedButton(
                    color: Colors.red,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _submitData,
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}
