import 'package:adove/app/module/job/controllers/job.dart';
import 'package:flutter/material.dart';

class SearchJobWidget extends StatelessWidget {
  var controller = TextEditingController();

  SearchJobWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _formField();
  }

  Widget _formField() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'O que você procura?'
      ),
      style: const TextStyle(
      color: Colors.blue,
      fontSize: 15.0,
    ),
      onSubmitted: (String value) {
        JobController.to.inputSearchJob.value = value;
      },
    );
  }
}
