import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.05, bottom: 5, left: width * 0),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
                  ),
                ),
                SizedBox(
                  child: Image.asset('assets/images/docz1.png', height: 400,),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 0.0, left: 15, right: 15),
                    child: TextFormField(
                      controller: _idController,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (_idController.text.isEmpty) {
                          return "Field cannot be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Admin Id",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                      ),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 15, right: 15, bottom: 20),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (_passwordController.text.isEmpty) {
                          return "Field cannot be empty";
                        } else if (_passwordController.text.length < 8) {
                          return "Password cannot be less that 8 characters";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 15, right: 15, bottom: 20),
                  height: height * 0.1,
                  width: width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      final FormState? form = _formKey.currentState;
                      if (form!.validate()){
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple,
                        backgroundColor: Colors.lightBlue),
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
