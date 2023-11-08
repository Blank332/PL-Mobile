// ignore_for_file: unused_field

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:pl_mobile/login/login_form.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  int? _nisn;
  String? _nama;
  String? _selectedKelas = "Pilih Kelas";
  String? _password;
  bool _isPasswordVisible = false;

  List<String> kelasList = [
    "X RPL A",
    "X RPL B",
    "XI RPL A",
    "XI RPL B",
    "XII RPL A",
    "XII RPL B",
    "X MEKA A",
    "X MEKA B",
    "XI MEKA A",
    "XI MEKA B",
    "XII MEKA A",
    "XII MEKA B",
    "X TEI A",
    "X TEI B",
    "XI TEI A",
    "XI TEI B",
    "XII TEI A",
    "XII TEI B",
    "X TOI A",
    "X TOI B",
    "XI TOI A",
    "XI TOI B",
    "XII TOI A",
    "XII TOI B",
    "X TEK A",
    "X TEK B",
    "XI TEK A",
    "XI TEK B",
    "XII TEK A",
    "XII TEK B",
    "X IOP A",
    "X IOP B",
    "XI IOP A",
    "XI IOP B",
    "XII IOP A",
    "XII IOP B",
    "X TPUTUP A",
    "X TPUTUP B",
    "XI TPUTUP A",
    "XI TPUTUP B",
    "XII TPUTUP A",
    "XII TPUTUP B",
    "X SIJA A",
    "X SIJA B",
    "XI SIJA A",
    "XI SIJA B",
    "XII SIJA A",
    "XII SIJA B",
    "X PSPT A",
    "X PSPT B",
    "XI PSPT A",
    "XI PSPT B",
    "XII PSPT A",
    "XII PSPT B"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Akun Baru'),
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Menempatkan konten di tengah vertikal
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Pusatkan horizontal
                children: <Widget>[
                  Text(
                    "Daftar Akun Baru",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'NISN',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'NISN tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nisn = int.tryParse(value!);
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nama = value;
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownSearch<String>(
                    items: kelasList,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedKelas = value;
                        });
                      }
                    },
                    selectedItem: _selectedKelas,
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
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
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kata Sandi tidak boleh kosong';
                      }
                      if (value.length < 8) {
                        return 'Kata Sandi minimal 8 karakter';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
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
                    onPressed: () {},
                    child: Text(
                      'Register',
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
                          text: 'Sudah Punya Akun? ',
                          style: TextStyle(
                            fontFamily: 'Sans',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Masuk disini',
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
                                      builder: (context) => LoginForm(),
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
        ),
      ),
    );
  }
}
