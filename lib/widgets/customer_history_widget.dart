import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerHistory extends StatefulWidget {
  const CustomerHistory({Key? key,}) : super(key: key);

  @override
  _CustomerHistoryState createState() => _CustomerHistoryState();
}

class _CustomerHistoryState extends State<CustomerHistory> {

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return const Text('History Page');
  }
}
