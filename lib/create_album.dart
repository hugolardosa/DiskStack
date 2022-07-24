import 'package:flutter/material.dart';
// import 'package:disk_stash/picture_grid.dart';
// import 'package:disk_stash/pop_up_widget.dart';

// Define a custom Form widget.
class MusicForm extends StatefulWidget {
  MusicForm({Key? key}) : super(key: key);
  static const routeName = '/addMusic';
  @override
  MusicFormState createState() {
    return MusicFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MusicFormState extends State<MusicForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MusicFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Add Album to collection"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Add TextFormFields and ElevatedButton here.

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'ISBN',
                ),
                validator: (value) {
                  if (value!.isEmpty || value == ' ' || value == '') {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value!.isEmpty || value == ' ' || value == '') {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Record Label',
                ),
                validator: (value) {
                  if (value!.isEmpty || value == ' ' || value == '') {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Artist',
                ),
                validator: (value) {
                  if (value!.isEmpty || value == ' ' || value == '') {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

                    Navigator.pop(context);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid')),
                    );
                  }

                  

                },
                child: const Text('Submit'),
              ),

              ElevatedButton(
                onPressed: () {
                 
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cancel')),
                    );
                    
                    Navigator.pop(context);

                  

                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ));
  }
}
