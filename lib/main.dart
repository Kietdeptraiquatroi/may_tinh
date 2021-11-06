import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Máy Tính Điện Thoại',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String so1 = "", so2 = "", KetQua = "", text = "";
  String PhepTinh = "";
  String lable1 = "", lable2 = "0";
  int test = 0;

  void btnClicked(String btnText) {
    if (btnText == "AC") {
      test = 0;
      text = "";
      KetQua = "";
      so1 = "";
      so2 = "";
      PhepTinh = "";
      lable1 = "";
      lable2 = "0";
    } else if (btnText == "C") {
      if (so2 == "") {
        if (PhepTinh == "") {
          lable1 = lable1.substring(0, lable1.length - 1);
          KetQua = KetQua.substring(0, KetQua.length - 1);
        } else {
          if (lable1 != (PhepTinh + so1)) {
            lable1 = lable1.substring(0, lable1.length - 1);
            KetQua = KetQua.substring(0, KetQua.length - 1);
          } else {
            lable1 = lable1.substring(0, lable1.length - 1);
            PhepTinh = "";
          }
        }
      } else {
        lable1 = lable1.substring(0, lable1.length - 1);
        KetQua = KetQua.substring(0, KetQua.length - 1);
      }
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "%" ||
        btnText == "/") {
      so1 = KetQua;
      KetQua = "";
      PhepTinh = btnText;
    } else if (btnText == "=") {
      so2 = text;
      if (PhepTinh == "+") {
        KetQua = (int.parse(so1) + int.parse(so2)).toString();
      }
      if (PhepTinh == "-") {
        KetQua = (int.parse(so1) - int.parse(so2)).toString();
      }
      if (PhepTinh == "x") {
        KetQua = (int.parse(so1) * int.parse(so2)).toString();
      }
      if (PhepTinh == "/") {
        KetQua = (int.parse(so1) / int.parse(so2)).toString();
      }
      if (PhepTinh == "%") {
        KetQua = (int.parse(so1) % int.parse(so2)).toString();
      }
      test = 1;
      lable2 = KetQua;
    } else {
      if (test == 0) {
        KetQua = KetQua + btnText;
      } else {
        test = 0;
        KetQua = btnText;
        so1 = "";
        so2 = "";
        text = "";
        lable1 = "";
      }
    }

    setState(() {
      text = KetQua;
      if (btnText == "AC" || btnText == "C" || btnText == "=") {
      } else {
        lable1 = lable1 + btnText;
      }
    });
  }

  Widget _buildButton(String value, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: FloatingActionButton(
          onPressed: () => btnClicked(value),
          backgroundColor: color,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Máy Tính")),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10),
                          child: Text(lable1,
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          lable2,
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              color: Colors.black,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildButton("AC", Colors.grey.shade400),
                      _buildButton("C", Colors.grey.shade400),
                      _buildButton("%", Colors.grey.shade400),
                      _buildButton("/", Colors.yellow),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton("7", Colors.grey.shade700),
                      _buildButton("8", Colors.grey.shade700),
                      _buildButton("9", Colors.grey.shade700),
                      _buildButton("x", Colors.yellow),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton("4", Colors.grey.shade700),
                      _buildButton("5", Colors.grey.shade700),
                      _buildButton("6", Colors.grey.shade700),
                      _buildButton("-", Colors.yellow),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton("1", Colors.grey.shade700),
                      _buildButton("2", Colors.grey.shade700),
                      _buildButton("3", Colors.grey.shade700),
                      _buildButton("+", Colors.yellow),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton("0", Colors.grey.shade700),
                      _buildButton("", Colors.grey.shade700),
                      _buildButton(".", Colors.grey.shade700),
                      _buildButton("=", Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
