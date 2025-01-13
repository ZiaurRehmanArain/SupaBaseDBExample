import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supadatabaseapp/controller/services/test_stream.dart';
import 'package:supadatabaseapp/controller/task_provider.dart';

class TestStrem extends StatelessWidget {
   TestStrem({super.key});
DBTestStream dbTestStream=DBTestStream();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task'),),
      body: StreamBuilder(
        stream: dbTestStream.stream,
       builder: (context, snapshot) {
         if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
         }
         final taskdata=snapshot.data!;
         return ListView.builder(
          itemCount: taskdata.length,
          itemBuilder: (context, index) => ListTile(title: Text(taskdata[index].task.toString()),),
         );
       },),
       floatingActionButton: FloatingActionButton(onPressed: () {
          // Provider.of<TaskProvider>(context, listen: false)
          //             .addTask('taskController.text', 'taskDescController.text');
       },child: Icon(Icons.add),),
    );
  }
}