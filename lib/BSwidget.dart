import 'package:flutter/material.dart';
import './classitem.dart';
import './Choice_screen.dart';



class BottomSheetWidget extends StatefulWidget {
  final Function (String id,String title, String subtitle) AddChoice; 
  const BottomSheetWidget(this.AddChoice,{ Key? key }) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  num? counterid;
  var _titleController = TextEditingController();
  var _subtitleController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Padding(
          padding: 
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Word in English',
                    hintText: 'Write the word here in English',
                  ),
                  keyboardType: TextInputType.text,

                  
                ),
                TextField(
                  controller: _subtitleController,
                  decoration: InputDecoration(
                    labelText: 'Word in Arabic',
                    hintText: 'Write the word here in Arabic',
                  ),
                  keyboardType: TextInputType.text,
                
                  
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                  widget.AddChoice(
                    counterid =_itemsChoice[index.length + 1].id, 
                    _titleController.text,
                    _subtitleController.text,
                  );
                  _titleController.clear();
                  _subtitleController.clear();
                }, child: Text('AddChoice'))
              ],
            ),

          ),
        ),
      ),
    );
  }
}