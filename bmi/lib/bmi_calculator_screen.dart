import 'package:bmi/bmi_calculator.dart';
import 'package:bmi/components/gender_card.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

bool isMale = true;

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
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
                SizedBox(height: 8),
                Text(
                  'Please choose your gender',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 24),
                GenderCard(
                  ontap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  gender: 'Male',
                  image: 'assets/images/Group.png',
                  backgroundColor: isMale ? Colors.green : Colors.green[100]!,
                  textColor: isMale ? Colors.white : Color(0xff519234),
                ),
                SizedBox(height: 16),
                GenderCard(
                  ontap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  gender: 'Female',
                  image: 'assets/images/Group (1).png',
                  backgroundColor: !isMale ? Colors.red : Color(0xffFBF6EE),
                  textColor: !isMale ? Colors.white : Color(0xffCE922A),
                ),
                SizedBox(height: 24),
                Container(
                  height: 70,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BMICalculatorScreen1(
                                    ismale: isMale,
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
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
        ),
      ),
    );
  }
}
