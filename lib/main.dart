import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trail/nextpage.dart';

import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

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
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.password),
                    )),
                SizedBox(
                  height: 45,
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    login(
                      emailController.text,
                      passController.text,
                      context
                    );
                  },
                  icon: Icon(
                    Icons.login,
                    size: 18,
                  ),
                  label: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///FUNCTION TO CALL API LOGIN
  Future<void> login(String email,String pass,context) async {
    if (pass.isNotEmpty && email.isNotEmpty) {
      var respond = await http.post(
          Uri.parse("http://172.105.251.144:8000/api/login"),
          body: ({
            "email": email,
            'password': pass
          }));
      if (respond.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => NextPage()),
          ),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invaild Credential")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black Feild allowed")));
    }
  }
}
