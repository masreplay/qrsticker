import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class CreateQrScreen extends StatefulWidget {
  const CreateQrScreen({Key key}) : super(key: key);

  @override
  _CreateQrScreenState createState() => _CreateQrScreenState();
}

class _CreateQrScreenState extends State<CreateQrScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    validator: (value) => value.isNotEmptyValidation(),
                    decoration: InputDecoration(
                      labelText: "name",
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) => value.isNotEmptyValidation(),
                    decoration: InputDecoration(
                      labelText: "price",
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextButton(
                      onPressed: () async {
                        setState(() => _loading == true);
                        if (_formKey.currentState.validate()) {
                          Navigator.pushReplacementNamed(context, Routes.home);
                        }

                      },
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("submit"),
                          Visibility(
                              visible: _loading,
                              child: CircularProgressIndicator(strokeWidth: 2))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension validation on String {
  String isNotEmptyValidation() {
    if (this == null || this.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}