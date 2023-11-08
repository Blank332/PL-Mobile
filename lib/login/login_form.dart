import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pl_mobile/login/register_form.dart';
import 'package:pl_mobile/navigation/navigation.dart';

void main() {
  runApp(MaterialApp(
    home: LoginForm(),
    theme: ThemeData(),
  ));
}

class LoginForm extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginForm> {
  final TextEditingController nisnController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final nisnKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false; // Variabel status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masuk Pembangunan Library'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/logo.png', // Replace with the actual path to your image
              width: 40.0,
              height: 40.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: nisnKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Masuk Menggunakan Akun yang Sudah Dibuat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: nisnController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'NISN',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'NISN tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'NISN harus berupa angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: !_isPasswordVisible, // Gunakan variabel status
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; // Ubah status
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (nisnKey.currentState!.validate()) {
                    int? nisn = int.tryParse(nisnController.text);
                    String password = passwordController.text;

                    // Tempatkan logika autentikasi di sini
                    if (nisn == 12345 && password == 'password') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Login gagal. Coba lagi.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  elevation: MaterialStateProperty.all(5),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 94, vertical: 16),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
                ),
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: TextStyle(
                        fontFamily: 'Sans',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Buat akun baru disini',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterForm(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
