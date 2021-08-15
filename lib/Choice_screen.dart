import 'package:flutter/material.dart';
import './classitem.dart';
import './BSwidget.dart';
class ItemTranslated extends StatefulWidget {
  const ItemTranslated({ Key? key }) : super(key: key);

  @override
  _ItemTranslatedState createState() => _ItemTranslatedState();
}

class _ItemTranslatedState extends State<ItemTranslated> {
  List <Choice> itemsChoice = [
      Choice('1', 'Struggle', 'الكفاح أوالنظال'),
      Choice('2', 'Stuck', 'عالق أو لاصق'),
      Choice('3', 'Control Freak', 'مسيطر'),

    ];
    void AddChoice(String id, String title, String subtitle){
      setState(() {
        itemsChoice.add(Choice(id, title, subtitle));
      });
       
    }
    // ignore: non_constant_identifier_names
    void RemoveChoice (String id)=>
      
      itemsChoice.removeWhere((element) => element.id==id);
    
    void OpenSheet(){
      showModalBottomSheet(
        context: context, 
        builder: (context){
          //return Text('BottomSheet');
          return BottomSheetWidget(AddChoice);
        },
      );

    }
  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Translate From English To Arabic'),
      ),
      body: ListView.builder(
        itemCount: itemsChoice.length,
        itemBuilder: (context,index){
          return ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(itemsChoice[index].id),
                ),
              ),
              maxRadius: 20,
              backgroundColor: Colors.redAccent,
            ),
            title: Text(itemsChoice[index].title),
            subtitle: Text(itemsChoice[index].subtitle),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  RemoveChoice(itemsChoice[index].id);
                  print(itemsChoice.length);
                });
                
              },
              icon: Icon(
                Icons.delete,
                color: Colors.purple,
              )
            ),
            
         );
        }, 
      ),

    floatingActionButton: FloatingActionButton(
      onPressed: OpenSheet,
      child: Icon(Icons.add),
    ),
    );
  }
}