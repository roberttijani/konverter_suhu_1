import 'package:flutter/material.dart';
import 'package:konverter_suhu_1/widgets/KonversiSuhu.dart';
import 'package:konverter_suhu_1/widgets/PerhitunganTerakhir.dart';
import 'package:konverter_suhu_1/widgets/RiwayatPerhitungan.dart';
import 'package:konverter_suhu_1/widgets/TargetPerhitungan.dart';
import 'package:konverter_suhu_1/widgets/inputSuhu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropDown = "Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        hasilPerhitungan = int.parse(etInput.text) * 1;
        switch (selectedDropDown) {
          case "Kelvin":
            hasilPerhitungan = int.parse(etInput.text) + 273.15;
            break;

          case "Reamur":
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
            break;

          case "Fahrenheit":
            hasilPerhitungan = (int.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius ke " +
            selectedDropDown +
            " Dengan Hasil : " +
            hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          margin: EdgeInsets.all(0),
          child: Column(
            children: [
              inputSuhu(etInput: etInput),
              const SizedBox(
                height: 8,
              ),
              TargetPerhitungan(
                selectedDropDown: selectedDropDown,
                listSatuanSuhu: listSatuanSuhu,
                onDropDownChanged: onDropDownChanged,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
              ),
              PerhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
              SizedBox(
                height: 10,
              ),
              KonversiSuhu(
                onPressed: konversiSuhu,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
              RiwayatPerhitungan(listHasil: listHasil),
            ],
          ),
        ));
  }

  void onDropDownChanged(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }
}
