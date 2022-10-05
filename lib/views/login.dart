import 'package:econtact/utils/Common.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //logo
  final Widget _containerLogo = Stack(
    children: [
      Center(
        child: Image.asset(
          'assets/images/wave.png',
          fit: BoxFit.fill,
          height: 250,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 130,
              height: 130,
              child: Image.asset('assets/images/logo_khoa.png'),
            ),
            const Text(
              /**/
              'EContact',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      )
    ],
  );

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  TextEditingController txtPhoneNumber = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Widget _cardContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Welcome",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text("Nhập số điện thoại"),
              ),
              TextField(
                controller: txtPhoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: const Color.fromARGB(30, 3, 169, 244),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: const Text("Nhập mật khẩu"),
              ),
              TextField(
                controller: txtPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscured,
                focusNode: textFieldFocusNode,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  //Hides label on focus or if filled

                  filled: true,
                  // Needed for adding a fill color
                  fillColor: const Color.fromARGB(30, 3, 169, 244),
                  // Reduces height a bit
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius:
                        BorderRadius.circular(12), // Apply corner radius
                  ),

                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: GestureDetector(
                      onTap: _toggleObscured,
                      child: Icon(
                        _obscured
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "* Tiếp tục nghĩa là bạn đồng ý với các",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Điều khoản sử dụng EContact",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 55,
                  child: Card(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Common.showLoaderDialog(context, "Đang đăng nhập");
                        // Navigator.pop(context); dismiss progress bar
                      },
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 50),
                  width: double.infinity,
                  height: 55,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Quên mật khẩu",
                        style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [_containerLogo, _cardContent(context)],
        ),
      ),
    );
  }
}
