import 'package:ekyc_prototypes/components/alerts.dart';
import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/input.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:ekyc_prototypes/option1/landing.dart';
import 'package:ekyc_prototypes/pages/address.dart';
import 'package:ekyc_prototypes/pages/consent.dart';
import 'package:ekyc_prototypes/pages/liveliness.dart';
import 'package:ekyc_prototypes/pages/otp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Detailspage extends StatefulWidget {
  final bool addressChanged;
  final bool newStatus;
  final bool eKYCamendment;

  Detailspage({
    required this.addressChanged,
    required this.newStatus,
    required this.eKYCamendment,
  });

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

  //contact details
  final TextEditingController _email = TextEditingController(
    text: 'email@gmail.com',
  );

  //education and employment
  String? emplyedType = 'matrix';
  final TextEditingController _customerNumberController =
      TextEditingController();

  //finance
  final TextEditingController _monthlyIncome = TextEditingController();

  final TextEditingController _sourceOfWealth = TextEditingController();

  final TextEditingController _sourceOfFunds = TextEditingController();

  final TextEditingController _taxNumber = TextEditingController();
  List<String> selectedList = [];

  bool? marketConsent = true;
  bool? consentCKYC = true;

  //the logic to identify what has changed
  bool personalDetailsChanged = false;
  bool addressDetailsChanged = false;
  bool contactDetailsChanged = false;
  bool educationDetailsChanged = false;
  bool financeDetailsChanged = false;
  bool consentsDetailsChanged = false;

  bool personalDetailsunChanged = false;
  bool addressDetailsunChanged = false;
  bool contactDetailsunChanged = false;
  bool educationDetailsunChanged = false;
  bool financeDetailsunChanged = false;
  bool consentsDetailsunChanged = false;

  //the triggers
  //bool eKYCamendment = true; //option 2
  bool emailChanged = false;
  bool mobileChanged = false;

  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

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
                  step2Status: widget.newStatus ? 'completed' : 'active',
                  step3Status: widget.newStatus ? 'completed' : 'inactive',
                  step4Status: 'inactive',
                  activeLabel:
                      widget.newStatus
                          ? widget.addressChanged
                              ? 'Profile under review'
                              : 'Profile updated'
                          : 'Update details',
                ),
                SS40(),

                widget.eKYCamendment
                    ? Column(
                      children: [
                        WarningBox(
                          alertHeading: 'Profile review required',
                          alertText:
                              'To avoid any disruption to your banking services, please confirm or update the details highlighted in red.',
                        ),

                        SS24(),
                      ],
                    )
                    : NullBox(),

                //the conditions
                widget.newStatus
                    ? widget.addressChanged
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PendingBox(
                              alertHeading: 'Verification required',
                              alertText:
                                  'You will be informed when to visit your nearest branch to verify your proof of address.',
                            ),

                            SS32(),
                          ],
                        )
                        : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SuccessBox(
                              alertHeading: 'Successful profile update',
                              alertText:
                                  'Your profile has been successfully updated',
                            ),
                            SS16(),
                            BodyBold14(
                              text: 'Profile last updated $formattedDate ',
                              color: AppColors.primaryRed,
                            ),
                            SS32(),
                          ],
                        )
                    : NullBox(),

                BodyBold16(
                  text: 'Manage your details:',
                  color: AppColors.labelGrey,
                ),
                SS24(),
                MAccordion(
                  danger:
                      !widget.eKYCamendment
                          ? false
                          : (personalDetailsChanged == false &&
                              personalDetailsunChanged == false)
                          ? true
                          : false,
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

                          widget.eKYCamendment
                              ? Column(
                                children: [
                                  DGPrimaryButton(
                                    onTap: () {
                                      setState(() {
                                        personalDetailsunChanged = true;
                                      });
                                    },
                                    buttonText: 'My details have not changed',
                                  ),

                                  SS16(),
                                ],
                              )
                              : NullBox(),

                          DGPrimaryButton(
                            onTap: () {
                              setState(() {
                                personalDetailsChanged = true;
                              });
                            },
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
                  danger:
                      !widget.eKYCamendment
                          ? false
                          : (addressDetailsChanged == false &&
                              addressDetailsunChanged == false)
                          ? true
                          : false,
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

                          widget.eKYCamendment
                              ? Column(
                                children: [
                                  DGPrimaryButton(
                                    onTap: () {
                                      setState(() {
                                        addressDetailsunChanged = true;
                                      });
                                    },
                                    buttonText: 'My details have not changed',
                                  ),
                                  SS16(),
                                ],
                              )
                              : NullBox(),

                          DGPrimaryButton(
                            onTap: () {
                              setState(() {
                                addressDetailsChanged = true;
                              });
                            },
                            buttonText: 'Update my details',
                          ),

                          SS40(),
                        ],
                      ),
                    ),
                  ],
                ),

                //contact details
                MAccordion(
                  danger:
                      !widget.eKYCamendment
                          ? false
                          : (contactDetailsChanged == false &&
                              contactDetailsunChanged == false)
                          ? true
                          : false,
                  label: 'Contact details',
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Container(
                            child: BodyRegular14(
                              text:
                                  'We can easily keep you updated through our digital channels just make sure we have your latest contact details',
                              color: AppColors.labelGrey,
                            ),
                          ),
                          SS24(),
                          //mobile number
                          ContactNumberField(
                            codeFieldWidth: 108,
                            numberFieldWidth: 178,
                            labelText: 'Phone Number',
                            onChanged: (value) {
                              print('Full number: $value');
                              setState(() {
                                mobileChanged = true;
                              });
                            },
                          ),

                          SS16(),
                          CustomTextField(
                            labelText: 'Email address',
                            controller: _email,
                            containerWidth: 298,
                            onChanged: (value) {
                              setState(() {
                                emailChanged = true;
                              });
                            },
                          ),

                          SS16(),
                          CustomDropdown(
                            items: ['Email', 'Whatsapp', 'SMS'],
                            onChanged: (value) {},
                            labelText: 'Preferred channel of communication',
                            containerWidth: 298,
                            hintText: 'Email',
                          ),

                          SS16(),
                          CustomDropdown(
                            items: ['English', 'French'],
                            onChanged: (value) {},
                            labelText: 'Preferred language of communication',
                            containerWidth: 298,
                            hintText: 'English',
                          ),

                          SS40(),

                          widget.eKYCamendment
                              ? Column(
                                children: [
                                  DGPrimaryButton(
                                    onTap: () {
                                      setState(() {
                                        contactDetailsunChanged = true;
                                      });
                                    },
                                    buttonText: 'My details have not changed',
                                  ),
                                  SS16(),
                                ],
                              )
                              : NullBox(),

                          DGPrimaryButton(
                            onTap: () {
                              setState(() {
                                contactDetailsChanged = true;
                              });
                            },
                            buttonText: 'Update my details',
                          ),

                          SS40(),
                        ],
                      ),
                    ),
                  ],
                ),

                //education and empolyment
                MAccordion(
                  danger:
                      !widget.eKYCamendment
                          ? false
                          : (educationDetailsChanged == false &&
                              educationDetailsunChanged == false)
                          ? true
                          : false,

                  label: 'Education and employment details',
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Container(
                            child: BodyRegular14(
                              text:
                                  'With the most up to date understanding of your education and employment, we can personalise your banking experience to suit your needs.',
                              color: AppColors.labelGrey,
                            ),
                          ),
                          SS24(),
                          CustomDropdown(
                            items: [
                              'Illiterate',
                              'Primary Education',
                              'Secondary / High School',
                              'Certificate Qualification',
                              'Diploma',
                              'University / Bachelor\'s Degree',
                              'Master\'s Degree',
                              'Doctorate / PhD',
                            ],
                            onChanged: (value) {},
                            labelText: 'Education level',
                            containerWidth: 298,
                            hintText: 'University / Bachelor\'s Degree',
                          ),

                          //employment type and the conditions:
                          SS16(),
                          //employer position
                          CustomDropdown(
                            items: ['Self employed', 'Employed', 'Unemployed'],
                            onChanged: (value) {
                              if (value == 'Self employed') {
                                setState(() {
                                  emplyedType = 'free';
                                });
                              } else if (value == 'Employed') {
                                setState(() {
                                  emplyedType = 'matrix';
                                });
                              } else {
                                setState(() {
                                  emplyedType = 'eish';
                                });
                              }
                            },

                            labelText: 'Employment type',
                            containerWidth: 298,
                            hintText: 'Employed',
                          ),

                          //employers name
                          (emplyedType! == 'matrix')
                              ? Column(
                                children: [
                                  SS16(),

                                  CustomDropdown(
                                    items: [
                                      'IBL Ltd',
                                      'CIEL Group',
                                      'ENL Limited',
                                      'Eclosia Group',
                                      'Vivo Energy Mauritius',
                                      'The Leal Group',
                                      'Engen Petroleum (Mauritius) Ltd',
                                      'New Mauritius Hotels Ltd',
                                      'Mauritius Commercial Bank (MCB)',
                                    ],
                                    onChanged: (value) {},
                                    labelText: 'Employer',
                                    containerWidth: 298,
                                    hintText: 'Mauritius Commercial Bank (MCB)',
                                  ),
                                  SS16(),
                                  //employer position
                                  CustomDropdown(
                                    items: [
                                      'Software Developer',
                                      'Accountant'
                                          'Project Manager',
                                      'Financial Analyst',
                                      'Customer Service Representative',
                                      'Marketing Executive',
                                      'Human Resources Officer',
                                      'Sales Consultant',
                                      'Operations Manager',
                                      'Data Analyst',
                                      'Administrative Assistant',
                                      'Other',
                                    ],
                                    onChanged: (value) {},
                                    labelText: 'Job title',
                                    containerWidth: 298,
                                    hintText: 'Accountant',
                                  ),

                                  //employed since
                                  SS16(),
                                  CustomDatePickerField(
                                    labelText: 'Employed since date',
                                    containerWidth: 298,
                                  ),
                                ],
                              )
                              : NullBox(),

                          //the column for self employed
                          (emplyedType! == 'free')
                              ? Column(
                                children: [
                                  SS16(),
                                  //business activity
                                  CustomDropdown(
                                    items: [
                                      'Financial Services',
                                      'Information Technology',
                                      'Manufacturing',
                                      'Hospitality and Tourism',
                                      'Retail and Wholesale Trade',
                                      'Other',
                                    ],
                                    onChanged: (value) {},
                                    labelText: 'Business activity',
                                    containerWidth: 298,
                                    hintText: 'Financial Services',
                                  ),
                                  SS16(),

                                  //BRN number
                                  CustomerNumberField(
                                    labelText: 'BR number',
                                    fieldWidth: 298,
                                    controller: _customerNumberController,
                                    onChanged: (value) {
                                      // handle change
                                    },
                                  ),
                                ],
                              )
                              : NullBox(),

                          //the column for  unemployed
                          (emplyedType! == 'eish')
                              ? Column(
                                children: [
                                  SS16(),
                                  //business activity
                                  CustomDropdown(
                                    items: [
                                      'Student',
                                      'Housewife',
                                      'Househusband',
                                      'Retired',

                                      'Other',
                                    ],
                                    onChanged: (value) {},
                                    labelText: 'Unemployment type',
                                    containerWidth: 298,
                                    hintText: 'Please select an option',
                                  ),
                                  SS16(),

                                  //BRN number
                                  CustomerNumberField(
                                    labelText: 'BR number',
                                    fieldWidth: 298,
                                    controller: _customerNumberController,
                                    onChanged: (value) {
                                      // handle change
                                    },
                                  ),
                                ],
                              )
                              : NullBox(),

                          // the buttons
                          SS40(),

                          widget.eKYCamendment
                              ? Column(
                                children: [
                                  DGPrimaryButton(
                                    onTap: () {
                                      setState(() {
                                        educationDetailsunChanged = true;
                                      });
                                    },
                                    buttonText: 'My details have not changed',
                                  ),
                                  SS16(),
                                ],
                              )
                              : NullBox(),

                          DGPrimaryButton(
                            onTap: () {
                              setState(() {
                                educationDetailsChanged = true;
                              });
                            },
                            buttonText: 'Update my details',
                          ),

                          SS40(),
                        ],
                      ),
                    ),
                  ],
                ),

                //the financial details
                MAccordion(
                  danger:
                      !widget.eKYCamendment
                          ? false
                          : (financeDetailsChanged == false &&
                              financeDetailsunChanged == false)
                          ? true
                          : false,

                  label: 'Finance details',
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Container(
                            child: BodyRegular14(
                              text:
                                  'Keep your financial details up to date so we can match you with the best products and services.',
                              color: AppColors.labelGrey,
                            ),
                          ),
                          SS24(),

                          CurrencyAmountField(
                            labelText: 'Monthly income',
                            onChanged: (currency, amount) {
                              print('Selected: $currency, Amount: $amount');
                            },
                            currencyFieldWidth: 110,
                            amountFieldWidth: 182,
                          ),

                          SS16(),

                          //the multi-select
                          MultiSelectDropdown(
                            items: [
                              'Pension',
                              'Investments',
                              'Rentals',
                              'Inheritance',
                              'Divorce Settlement',
                            ],
                            selectedValues: selectedList,
                            onChanged: (newList) {
                              setState(() => selectedList = newList);
                            },
                            labelText: 'Source of wealth',
                            containerWidth: 298,
                          ),
                          SS16(),

                          ///
                          CustomerNumberField(
                            labelText: 'Tax number',
                            controller: _taxNumber,
                            fieldWidth: 298,
                          ),

                          SS16(),

                          FlagDropdown(
                            onChanged: (value) {},
                            labelText: 'Tax country',
                          ),

                          //bottom spacing
                          SS40(),

                          widget.eKYCamendment
                              ? Column(
                                children: [
                                  DGPrimaryButton(
                                    onTap: () {
                                      setState(() {
                                        financeDetailsunChanged = true;
                                      });
                                    },
                                    buttonText: 'My details have not changed',
                                  ),
                                  SS16(),
                                ],
                              )
                              : NullBox(),

                          DGPrimaryButton(
                            onTap: () {
                              setState(() {
                                financeDetailsChanged = true;
                              });
                            },
                            buttonText: 'Update my details',
                          ),

                          SS40(),
                        ],
                      ),
                    ),
                  ],
                ),

                //consents
                MAccordion(
                  danger:
                      !widget.eKYCamendment
                          ? false
                          : (consentsDetailsChanged == false &&
                              consentsDetailsunChanged == false)
                          ? true
                          : false,
                  label: 'Consents',
                  children: [
                    YesNoRadioRow(
                      containerWidth: 298,
                      labelText: 'Marketing consent',
                      descriptionText:
                          'Want the latest updates, offers, and tips? Tick the box to stay in the loop.',
                      selectedValue: marketConsent,
                      onChanged: (value) {
                        setState(() {
                          marketConsent = value;
                        });
                      },
                    ),

                    SS24(),
                    YesNoRadioRow(
                      containerWidth: 298,
                      labelText: 'CKYC consent',
                      descriptionText:
                          'For address verification through CKYC (government service), please give your consent by ticking the box below.',
                      selectedValue: consentCKYC,
                      onChanged: (value) {
                        setState(() {
                          consentCKYC = value;
                        });
                      },
                    ),

                    //bottom spacing
                    SS40(),

                    widget.eKYCamendment
                        ? Column(
                          children: [
                            DGPrimaryButton(
                              onTap: () {
                                setState(() {
                                  consentsDetailsunChanged = true;
                                });
                              },
                              buttonText: 'My details have not changed',
                            ),

                            SS16(),
                          ],
                        )
                        : NullBox(),

                    DGPrimaryButton(
                      onTap: () {
                        setState(() {
                          consentsDetailsChanged = true;
                        });
                      },
                      buttonText: 'Update my details',
                    ),

                    SS40(),
                  ],
                ),

                //the final buttons
                SS40(),
                MPrimaryButton(
                  onTap: () {
                    if (!personalDetailsChanged &&
                        !contactDetailsChanged &&
                        !addressDetailsChanged &&
                        !educationDetailsChanged &&
                        !financeDetailsChanged &&
                        !consentsDetailsChanged &&
                        !personalDetailsunChanged &&
                        !consentsDetailsunChanged &&
                        !educationDetailsunChanged &&
                        !financeDetailsunChanged &&
                        !consentsDetailsunChanged) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No changes made, you cannot proceed'),
                        ),
                      );
                    } else if (personalDetailsChanged) {
                      // Navigate to LivelinessTest if personalDetailsChanged is true
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ConsentScreen(
                                addressChanged: addressDetailsChanged,
                                emailChanged: emailChanged,
                                mobileChanged: mobileChanged,
                              ),
                        ),
                      );
                    } else if (addressDetailsChanged) {
                      // Navigate to addressDetails page if addressDetailsChanged is true
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => AddressPage(
                                emailChanged: emailChanged,
                                mobileChanged: mobileChanged,
                              ),
                        ),
                      );
                    } else if (contactDetailsChanged) {
                      // Navigate to OTP page if contactDetailsChanged is true
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DefaultOTPPage(
                                addressChanged: addressDetailsChanged,
                                emailChanged: emailChanged,
                                mobileChanged: mobileChanged,
                              ),
                        ),
                      );
                    } else {
                      // Default fallback if any other change triggers
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DefaultOTPPage(
                                addressChanged: addressDetailsChanged,
                                emailChanged: emailChanged,
                                mobileChanged: mobileChanged,
                              ),
                        ),
                      );
                    }
                  },
                  buttonText: 'Next',
                ),
                SS24(),

                DGOutlinedButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Option1Landing()),
                    );
                  },
                  buttonText: 'Cancel',
                ),

                SS24(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
