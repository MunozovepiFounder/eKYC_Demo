import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/input.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:flutter/material.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  // Initialize the controller
  final TextEditingController _firstName = TextEditingController(text: 'Jane');
  final TextEditingController _lasttName = TextEditingController(text: 'Doe');
  final TextEditingController _madienName = TextEditingController();
  final TextEditingController _NIC = TextEditingController();
  DateTime? _dob;
  DateTime? _residenceDate;

  //address
  final TextEditingController _addressLine1 = TextEditingController(
    text: '123 Main Street',
  );
  final TextEditingController _addressLine2 = TextEditingController();
  final TextEditingController _addressLine3 = TextEditingController();
  final TextEditingController _city = TextEditingController(text: 'Rose Hill');
  final TextEditingController _postalCode = TextEditingController(text: '1234');

  @override
  void dispose() {
    // Dispose controller to prevent memory leaks
    _firstName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerProfileStepper(
                  backButton: true,
                  step1Status: 'completed',
                  step2Status: 'active',
                  step3Status: 'inactive',
                  step4Status: 'inactive',
                  activeLabel: 'Get started',
                ),
                SS40(),
                BodyBold16(
                  text: 'Manage your details:',
                  color: AppColors.labelGrey,
                ),
                SS32(),
                MAccordion(
                  label: 'Personal details',
                  children: [
                    SS24(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: BodyRegular14(
                              text:
                                  'Feel free to update your personal details, just keep your NIC nearby to complete the process.',
                              color: AppColors.labelGrey,
                            ),
                          ),
                          SS24(),
                          Row(
                            children: [
                              CustomDropdown(
                                items: ['Miss', 'Mrs', 'Mr', 'Dr', 'Honorable'],
                                onChanged: (value) {},
                                hintText: 'Mrs',
                                labelText: 'Title',
                                containerWidth: 114,
                              ),
                              SizedBox(width: 16),
                              CustomTextField(
                                labelText: 'First name',
                                controller: _firstName,
                                containerWidth: 168,
                              ),
                            ],
                          ),

                          SS16(),

                          CustomTextField(
                            labelText: 'Last name',
                            controller: _lasttName,
                            containerWidth: 298,
                          ),

                          SS16(),
                          CustomTextField(
                            labelText: 'Surname at birth (optional)',
                            controller: _madienName,
                            containerWidth: 298,
                          ),

                          SS16(),
                          CustomDatePickerField(
                            labelText: 'Date of birth',
                            displayValueWhenDisabled: '15/09/1978',
                            selectedDate: _dob,
                            onDateSelected: (value) {},
                            containerWidth: 298,
                            disabled: true,
                          ),

                          SS16(),
                          //
                          FlagDropdown(
                            labelText: 'Nationality',
                            onChanged: (value) {},
                          ),

                          SS16(),

                          CustomTextField(
                            labelText: 'NIC issue date',
                            controller: _NIC,
                            containerWidth: 298,
                            isDisabled: true,
                            disabledText: "1234567890123",
                          ),

                          SS16(),

                          CustomDropdown(
                            items: [
                              'Single',
                              'Married',
                              'Divorced',
                              'Widowed',
                              'Separated',
                            ],
                            onChanged: (value) {},
                            labelText: 'Marital status',
                            containerWidth: 298,
                            hintText: 'Married',
                          ),

                          //bottom spacing
                          SS40(),

                          DGPrimaryButton(
                            onTap: () {},
                            buttonText: 'My details have not changed',
                          ),

                          SS16(),

                          DGPrimaryButton(
                            onTap: () {},
                            buttonText: 'Update my details',
                          ),

                          SS40(),
                        ],
                      ),
                    ),
                  ],
                ),

                // SS8(),

                //the addresss
                MAccordion(
                  label: 'Address details',
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Container(
                            child: BodyRegular14(
                              text:
                                  'Ensure your address details are always up to date to guarantee smooth and timely product deliveries. Please note that any address changes will require proof of address.',
                              color: AppColors.labelGrey,
                            ),
                          ),
                          SS24(),

                          CustomDropdown(
                            items: [
                              'Owner',
                              'Living with spouse',
                              'Living with parents',
                              'Renting',
                            ],
                            onChanged: (value) {},
                            labelText: 'Residential status',
                            containerWidth: 298,
                            hintText: 'Mrs',
                          ),
                          SS16(),

                          //residence since date
                          CustomDatePickerField(
                            labelText: 'Residence since date',
                            containerWidth: 298,
                          ),

                          SS16(),

                          //address 1
                          CustomTextField(
                            labelText: 'Address (1)',
                            controller: _addressLine1,
                            containerWidth: 298,
                          ),

                          SS16(),

                          CustomTextField(
                            labelText: 'Address (2)',
                            controller: _addressLine2,
                            containerWidth: 298,
                          ),

                          SS16(),

                          CustomTextField(
                            labelText: 'Address (3)',
                            controller: _addressLine3,
                            containerWidth: 298,
                          ),

                          SS16(),

                          CustomTextField(
                            labelText: 'City',
                            controller: _city,
                            containerWidth: 298,
                          ),

                          SS16(),

                          CustomTextField(
                            labelText: 'Postal code',
                            controller: _postalCode,
                            containerWidth: 298,
                          ),

                          SS40(),

                          DGPrimaryButton(
                            onTap: () {},
                            buttonText: 'My details have not changed',
                          ),

                          SS16(),

                          DGPrimaryButton(
                            onTap: () {},
                            buttonText: 'Update my details',
                          ),

                          SS40(),
                        ],
                      ),
                    ),
                  ],
                ),

                //contact details
              ],
            ),
          ),
        ),
      ),
    );
  }
}
