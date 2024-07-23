import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController postalCode = TextEditingController();

  int _activeStepIndex = 0;
  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Acoount'),
          content: Column(
            children: [
              TextField(
                controller: firstName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'First Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: lastName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Last Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: confirm,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text('Confirm Password'))),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Address'),
          content: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: country,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Country',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: city,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'City',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: postalCode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Postal Code',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Confirm'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('First Name: ${firstName.text}'),
                Text('Last Name: ${lastName.text}'),
                Text('Email: ${email.text}'),
                const Text('Password: *****'),
                Text('Country : ${country.text}'),
                Text('City : ${city.text}'),
                Text('Postal Code : ${postalCode.text}'),
              ],
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          _activeStepIndex -= 1;
          setState(() {});
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        }, // this code is in pandding
        // controlsBuilder: (dynamic, context, {onStepContinue, onStepCancel}) {
        //   final isLastStep = _activeStepIndex == stepList().length - 1;
        //   return Row(
        //     children: [
        //       Expanded(
        //         child: ElevatedButton(
        //           onPressed: onStepContinue,
        //           child: (isLastStep)
        //               ? const Text('Submit')
        //               : const Text(
        //                   'Next',
        //                   style: TextStyle(color: Colors.blue),
        //                 ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       if (_activeStepIndex > 0)
        //         Expanded(
        //             child: ElevatedButton(
        //                 onPressed: onStepCancel, child: const Text('Back'))),
        //     ],
        //   );
        // },
      ),
    );
  }
}
