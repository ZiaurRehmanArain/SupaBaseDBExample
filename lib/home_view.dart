// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supadatabaseapp/view/auth/login_view.dart';

// class HomeView extends StatefulWidget {
//   HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   TextEditingController task = TextEditingController();

//   TextEditingController taskdesc = TextEditingController();
//   List taskData = [];

//   void createTask(context) async {
//     try {
//       var supsbase = Supabase.instance.client;
//       await Supabase.instance.client.from('task_table').insert({
//         'task': task.text, // Replace with your column names and values
//         'task_desc': taskdesc.text
//       });
//       // readTask();
//       Navigator.pop(context);

//       // if (response.error == null) {
//       print('Data inserted successfully');
//       // } else {
//       //   print(response.error!.message);
//       // }
//     } catch (e) {
//       print(e);
//     }
//   }

// // void readTask()async{
// //   try{
// //     var supabase=Supabase.instance.client;
// //   final response = await supabase
// //     .from('task_table')
// //     .select();
// //     print(response);

// //   setState(() {

// //   });

// //   }catch(e){
// //     print(e);

// //   }

// // }

//   void updateTask(int id, taskdata, taskDescdata) async {
//     task.text = taskdata;
//     taskdesc.text = taskDescdata;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: task,
//               decoration: InputDecoration(hintText: 'Task'),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               controller: taskdesc,
//               decoration: InputDecoration(hintText: 'Task Description'),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   await Supabase.instance.client.from('task_table').update({
//                     'id': id,
//                     'task':
//                         task.text, // Replace with your column names and values
//                     'task_desc': taskdesc.text
//                   }) // Replace with column and value
//                       .eq('id', id);
//                       Navigator.pop(context);
//                 },
//                 child: Text('Create')),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void deleteTask(int id) async {
//     await Supabase.instance.client.from('task_table').delete().eq('id', id);
//   }

//   Future<void> signOutUser(context) async {
//     final response = await Supabase.instance.client.auth.signOut();

//     Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginView(),
//         ));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
// // readTask();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _future =
//         Supabase.instance.client.from('task_table').stream(primaryKey: ['id']);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Home '),
//         actions: [
//           GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text(Supabase.instance.client.auth.currentUser!.email
//                         .toString()),
//                     content: Text(Supabase.instance.client.auth.currentUser!.aud
//                         .toString()),
//                   ),
//                 );
//               },
//               child: CircleAvatar(
//                 backgroundColor: Colors.amberAccent,
//                 radius: 12,
//               )),
//           IconButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextField(
//                           controller: task,
//                           decoration: InputDecoration(hintText: 'Task'),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextField(
//                           controller: taskdesc,
//                           decoration:
//                               InputDecoration(hintText: 'Task Description'),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         ElevatedButton(
//                             onPressed: () {
//                               createTask(context);
//                             },
//                             child: Text('Create')),
//                         SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               icon: Icon(Icons.add)),
//           IconButton(
//               onPressed: () {
//                 signOutUser(context);
//               },
//               icon: Icon(Icons.logout))
//         ],
//       ),
//       body: StreamBuilder(
//         stream: _future,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('ERror'),
//             );
//           }
//           final taskdata = snapshot.data!;
//           print(taskdata);
//           return ListView.builder(
//               itemCount: taskdata.length,
//               itemBuilder: (context, index) {
//                 final tast = taskdata[index];
//                 return ListTile(
//                   title: Text(tast['task']),
//                   subtitle: Text(tast['task_desc']),
//                   trailing: SizedBox(
//                     width: 100,
//                     child: Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               updateTask(tast['id'], tast['task'], tast['task_desc']);
//                             },
//                             icon: Icon(
//                               Icons.edit,
//                               color: Colors.green,
//                             )),
//                         IconButton(
//                             onPressed: () {
//                               deleteTask(tast['id']);
//                             },
//                             icon: Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                             )),
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supadatabaseapp/controller/services/get_current_user.dart';
import 'package:supadatabaseapp/controller/services/user_mange_services.dart';
import 'package:supadatabaseapp/model/current_user.dart';
import 'package:supadatabaseapp/view/auth/login_view.dart';
import '../controller/task_provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController taskController = TextEditingController();

  final TextEditingController taskDescController = TextEditingController();
  CurrentUser?  currentUser;

  Future<void> signOutUser(context) async {
    final response = await Supabase.instance.client.auth.signOut();
    UserMangeServices.clearAll();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(),
        ));
  }
  @override
  void initState() {
  getCurrenUSerdata();
    super.initState();
  }

void getCurrenUSerdata()async{
currentUser=await GetCurrentUser().getCurrentUserData();
print(currentUser!.name);


}

  @override
  Widget build(BuildContext context) {
    Provider.of<TaskProvider>(context, listen: false).fetchTasks();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(currentUser!.name ),
                    content: Text(currentUser!.email ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                radius: 12,
              )),
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () => _showTaskDialog(context),
          // ),
          IconButton(
              onPressed: () {
                signOutUser(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          if (taskProvider.tasks.isEmpty) {
            return Center(child: Text('No tasks available.'));
          }
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return ListTile(
                title: Text(task.task),
                subtitle: Text(task.taskDesc),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.green),
                      onPressed: () => _showTaskDialog(
                        context,
                        isEdit: true,
                        taskId: task.id,
                        task: task.task,
                        taskDesc: task.taskDesc,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () =>
                          Provider.of<TaskProvider>(context, listen: false)
                              .deleteTask(task.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showTaskDialog(BuildContext context,
      {bool isEdit = false, int? taskId, String? task, String? taskDesc}) {
    taskController.text = task ?? '';
    taskDescController.text = taskDesc ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEdit ? 'Edit Task' : 'Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskController,
                decoration: InputDecoration(hintText: 'Task'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: taskDescController,
                decoration: InputDecoration(hintText: 'Task Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (isEdit) {
                  Provider.of<TaskProvider>(context, listen: false).updateTask(
                      taskId!, taskController.text, taskDescController.text);
                } else {
                  Provider.of<TaskProvider>(context, listen: false)
                      .addTask(taskController.text, taskDescController.text,currentUser!.id);
                }
                Navigator.pop(context);
              },
              child: Text(isEdit ? 'Update' : 'Add'),
            ),
          ],
        );
      },
    );
  }
}
