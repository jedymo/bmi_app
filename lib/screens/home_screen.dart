import 'package:bmi_app/core/constants.dart';
import 'package:bmi_app/core/enums.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/widgets/bottom_button.dart';
import 'package:bmi_app/widgets/rounded_card.dart';
import 'package:bmi_app/widgets/text_icon.dart';
import 'package:bmi_app/widgets/value_selector.dart';
import 'package:bmi_app/widgets/value_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender selectedGender = Gender.male;
  int selectedHeight = 183;
  int selectedWeight = 74;
  int selectedAge = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(
                          child: RoundedCard(
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                            backgroundColor: kGenderBoxColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextIcon(
                                iconData: Icons.male,
                                label: 'MALE',
                                color: selectedGender == Gender.male
                                    ? kLabelColor
                                    : kUnselectedLabelColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: RoundedCard(
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                            backgroundColor: kGenderBoxColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextIcon(
                                iconData: Icons.female,
                                label: 'FEMALE',
                                color: selectedGender == Gender.female
                                    ? kLabelColor
                                    : kUnselectedLabelColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    flex: 6,
                    child: RoundedCard(
                      backgroundColor: kDefaultBoxColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ValueSlider(
                          initialValue: selectedHeight,
                          title: 'HEIGHT',
                          valueSuffix: 'cm',
                          min: 1.0,
                          max: 300.0,
                          onChanged: (value) {
                            setState(() {
                              selectedHeight = value.round();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        Expanded(
                          child: RoundedCard(
                            backgroundColor: kDefaultBoxColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ValueSelector(
                                title: 'WEIGHT',
                                initialValue: selectedWeight,
                                onDecrease: () {
                                  setState(() {
                                    selectedWeight--;
                                  });
                                },
                                onIncrease: () {
                                  setState(() {
                                    selectedWeight++;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: RoundedCard(
                            backgroundColor: kDefaultBoxColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ValueSelector(
                                onDecrease: () {
                                  setState(() {
                                    selectedAge--;
                                  });
                                },
                                onIncrease: () {
                                  setState(() {
                                    selectedAge++;
                                  });
                                },
                                title: 'AGE',
                                initialValue: selectedAge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResultScreen(),
                ),
              );
            },
            child: const Center(
              child: Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
