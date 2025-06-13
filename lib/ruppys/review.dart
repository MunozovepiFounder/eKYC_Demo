import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/input.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/ruppys/done.dart';
import 'package:flutter/material.dart';

class ChildDetails extends StatefulWidget {
  const ChildDetails({super.key});

  @override
  State<ChildDetails> createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  final TextEditingController _firstName = TextEditingController(
    text: '_extractedFromBcertificate',
  );
  final TextEditingController _lasttName = TextEditingController(
    text: '_extractedFromBcertificate',
  );
  final TextEditingController _madienName = TextEditingController();
  final TextEditingController _NIC = TextEditingController(
    text: '_extractedFromBcertificate',
  );
  DateTime? _dob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          headername: 'Ruppy\'s Account Opening',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SS56(),

              Container(
                width: 340,
                // color: Colors.amber,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading03(
                          textAlign: TextAlign.left,
                          text: 'Have we go it right?',
                        ),
                        SS24(),
                        Container(
                          width: 332,
                          child: BodyRegular16(
                            textAlign: TextAlign.left,
                            text:
                                'Please confirm that we captured your child\'s details correctly.',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SS32(),

              CustomTextField(
                labelText: 'First name',
                controller: _firstName,
                containerWidth: 320,
                onChanged: (value) {
                  setState(() {
                    //    personalDetailsChanged = true;
                  });
                },
              ),

              SS24(),

              CustomTextField(
                labelText: 'Last name',
                controller: _lasttName,
                containerWidth: 320,
                onChanged: (value) {
                  setState(() {
                    //   personalDetailsChanged = true;
                  });
                },
              ),

              SS24(),
              CustomDatePickerField(
                labelText: 'Date of birth',
                displayValueWhenDisabled: '15/03/2025',
                selectedDate: _dob,
                onDateSelected: (value) {
                  setState(() {
                    // personalDetailsChanged = true;
                  });
                },
                containerWidth: 320,
                disabled: false,
              ),

              SS24(),
              //
              Container(
                width: 320,
                child: FlagDropdown(
                  labelText: 'Nationality',
                  onChanged: (value) {
                    setState(() {
                      //  personalDetailsChanged = true;
                    });
                  },
                ),
              ),

              SS24(),

              CustomTextField(
                labelText: 'Identification number',
                controller: _NIC,
                containerWidth: 320,
                isDisabled: false,
                disabledText: "1234567890123",
                onChanged: (value) {
                  setState(() {
                    // personalDetailsChanged = true;
                  });
                },
              ),

              SS64(),
              MPrimaryButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ApplicationDone()),
                  );
                },
                buttonText: 'Next',
              ),
              SS24(),
              DGOutlinedButton(onTap: () {}, buttonText: 'Cancel'),
            ],
          ),
        ),
      ),
    );
  }
}
