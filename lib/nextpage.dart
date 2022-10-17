import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome User"),
                SizedBox(height: 50,),
                OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.exit_to_app,size: 18,), label: Text("Logout"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
