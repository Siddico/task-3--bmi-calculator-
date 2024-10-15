import 'package:bmi/bmi_calculator_screen.dart';
import 'package:bmi/components/components.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen1 extends StatefulWidget {
  final bool ismale;

  BMICalculatorScreen1({super.key, required this.ismale});

  @override
  State<BMICalculatorScreen1> createState() => _BMICalculatorScreen1State();
}

double hieght = 120;
int age = 14;
int wieght = 60;
double? result;

class _BMICalculatorScreen1State extends State<BMICalculatorScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff65B741),
                    size: 24,
                  ),
                  onTap: (Navigator.of(context).pop),
                ),
                SizedBox(
                  width: 42,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'BMI ',
                        style: TextStyle(
                          color: Color(0xffFFB534),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Calculator',
                        style: TextStyle(
                          color: Color(0xff65B741),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Please modify the values',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCard('Weight (kg)', '$wieght'),
                _buildCard('Age', '$age'),
              ],
            ),
            SizedBox(height: 20),
            _buildHeightCard(),
            SizedBox(height: 20),
            Container(
              height: 70,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      double bmi = wieght / ((hieght / 100) * (hieght / 100));
                      String status = '';
                      Color statusColor = Colors.green;
                      Color statusBackgroundColor = Colors.green[200]!;

                      if (bmi < 18.5) {
                        status = 'Underweight';
                        statusColor = Colors.blue;
                        statusBackgroundColor = Colors.blue[200]!;
                      } else if (bmi < 25) {
                        status = 'Normal';
                        statusColor = Colors.green;
                        statusBackgroundColor = Colors.green[200]!;
                      } else {
                        status = 'Overweight';
                        statusColor = Colors.red;
                        statusBackgroundColor = Colors.red[200]!;
                      }
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(0),
                        content: Container(
                          width: 300,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Color(0xffF0F8EC),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Your BMI:',
                                style: TextStyle(
                                    color: Color(0xff0A1207),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '${(wieght / ((hieght / 100) * (hieght / 100))).toStringAsFixed(1)}',
                                style: TextStyle(
                                  fontSize: 48.0,
                                  color: Color(0xff519234),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: statusBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Text(
                                  '$status',
                                  style: TextStyle(
                                    color: statusColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                height: 8.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue[400]!,
                                      Colors.yellow[400]!,
                                      Colors.red[400]!,
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildInfoColumn('$wieght kg', 'Weight'),
                                  buildInfoColumn(
                                      '${hieght.toStringAsFixed(1)} cm',
                                      'Height'),
                                  buildInfoColumn('$age', 'Age'),
                                  buildInfoColumn(
                                      isMale ? 'Male' : 'Female', 'Gender'),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'Take care of your physical fitness to maintain your health!',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                height: 55,
                                width: 320,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[500],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 95,
            ),
            Container(
              height: 6,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff272829),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String label, String value) {
    return Container(
      height: 184,
      width: 164,
      child: Card(
        color: Color(0xffFBF6EE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                value,
                style: TextStyle(
                    color: Color(0xffCE922A),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(Icons.remove, () {
                    if (label == 'Weight (kg)') {
                      setState(() {
                        wieght--;
                      });
                    } else {
                      setState(() {
                        age--;
                      });
                    }
                  }),
                  _buildIconButton(Icons.add, () {
                    if (label == 'Weight (kg)') {
                      setState(() {
                        wieght++;
                      });
                    } else {
                      setState(() {
                        age++;
                      });
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Function() ontap) {
    return GestureDetector(
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
            icon: Icon(icon, color: Color(0xff9D6F1F)), onPressed: ontap),
      ),
    );
  }

  Widget _buildHeightCard() {
    return Card(
      color: Color(0xffFBF6EE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Height (cm)',
              style: TextStyle(
                  color: Color(0xffACACAC),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              '${hieght.toStringAsFixed(0)}',
              style: TextStyle(
                  color: Color(0xffCE922A),
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: Slider(
                activeColor: Color(0xffCE922A),
                inactiveColor: Color(0xffC4C4C4),
                value: hieght,
                min: 0,
                max: 220,
                divisions: 44,
                label: '${hieght.toStringAsFixed(0)}',
                onChanged: (value) {
                  setState(() {
                    hieght = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
