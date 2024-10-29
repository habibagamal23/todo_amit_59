import 'package:flutter/material.dart';

import '../../../core/database_helper.dart';
import '../../../core/widgest/textFeild_custom.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNotes();
  }

  TextEditingController titlcontroller = TextEditingController();
  TextEditingController contentcontoller = TextEditingController();
  DatabaseHelper db = DatabaseHelper();
  List<Map<String, dynamic>> mynotes = [];

  Future<void> fetchNotes() async {
      print("Fetching data");
      final data = await db.getAllNotes();
      print("Fetched data: $data");
      setState(() {
        mynotes = data;
      });
      print("Data fetched successfully");

  }


 Future addnote () async{
    print("insert now new note $titlcontroller.text");
    await db.insertNotes({
      'title': titlcontroller.text,
      'dec': contentcontoller.text,
    });
    await fetchNotes();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: mynotes.isEmpty
          ? Center(
              child: Text("NoThing Yet"),
            )
          : ListView.builder(
              itemCount: mynotes.length,
              itemBuilder: (context, index) {
                print('list view');
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: ListTile(
                      subtitle: Text(mynotes[index]['dec'] ?? ''),
                      title: Text(mynotes[index]['title'] ?? ''),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: showdialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void showdialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("ADD notes"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextfeildCustom(lable: "title", controller: titlcontroller),
                const SizedBox(
                  height: 10,
                ),
                TextfeildCustom(lable: "content", controller: contentcontoller)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: addnote,
                  child: const Text("Add")),
              TextButton(onPressed: () {}, child: const Text("Cancel")),
            ],
          );
        });
  }
}
