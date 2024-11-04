import 'package:flutter/material.dart';
import 'package:sqfnotes/core/sherdprf.dart';
import 'package:sqfnotes/features/login/LoginScreen.dart';

import '../../../core/database_helper.dart';
import '../../../core/widgest/textFeild_custom.dart';
import 'CardNote.dart';

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
    getusername();
  }
  String userNAme = "";

 Future getusername() async {

    String? name = await SharedPrfHelper.getName();

    setState(() {
      if (name != null) {
        setState(() {
          userNAme = name;
        });
      }
    });
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

  Future addnote() async {
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
        title: Text("Notes $userNAme"),
        actions: [
          IconButton(onPressed: () async{
            await SharedPrfHelper.deletall();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
          }, icon: Icon(Icons.delete))
        ],
      ),
      body: mynotes.isEmpty
          ? Center(
              child: Text("NoThing Yet"),
            )
          : ListView.builder(
              itemCount: mynotes.length,
              itemBuilder: (context, index) {
                print('list view');
                return NoteCard(
                  title: mynotes[index]['title'],
                  content: mynotes[index]['dec'],
                  onDelete: () {},
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
              TextButton(onPressed: addnote, child: const Text("Add")),
              TextButton(onPressed: () {}, child: const Text("Cancel")),
            ],
          );
        });
  }
}
