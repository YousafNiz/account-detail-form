import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Step> stepList() => [
        const Step(
          title: Text('Acoount detail'),
          content: Center(
            child: Text('Account'),
          ),
        ),
        const Step(
          title: Text('Acoount detail'),
          content: Center(
            child: Text('Address'),
          ),
        ),
        const Step(
          title: Text('Acoount detail'),
          content: Center(
            child: Text('Confirm'),
          ),
        ),
      ];

  int _activeStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('form demo'),
      ),
      body: Stepper(
        currentStep: _activeStepIndex,
        type: StepperType.horizontal,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex <= (stepList().length - 1)) {
            _activeStepIndex += 1;
          }
          setState(() {});
        },
      ),
    );
  }
}
