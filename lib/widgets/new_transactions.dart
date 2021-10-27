import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
    final Function addTx;
    NewTransactions(this.addTx);
  @override
  Widget build(BuildContext context) {
    final titleController=TextEditingController();
    final amountController=TextEditingController();
    return
      Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: <Widget>[

              TextField(decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              ElevatedButton(onPressed: (){
                  addTx(titleController.text,
                    double.parse(amountController.text),
                    );
              }, child: Text("Add transaction"),style: ElevatedButton.styleFrom(
                  primary: Colors.purple
              ))
            ],
          ),
        ),
      );
  }
}
