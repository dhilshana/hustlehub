// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hastlehub/screens/verificationScreen.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:country_picker/country_picker.dart';

class SecurityCheckScreen extends StatefulWidget {
  const SecurityCheckScreen({super.key});

  @override
  State<SecurityCheckScreen> createState() => _SecurityCheckScreenState();
}

class _SecurityCheckScreenState extends State<SecurityCheckScreen> {
  TextEditingController _countryController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  Country? selectedCountry;

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country;
          _countryController.text = '${country.flagEmoji} ${country.name}';
          _phoneController.text = country.phoneCode;
        });
      },
    );
  }

  bool get _isButtonEnabled {
    return _phoneController.text.isNotEmpty &&
        _countryController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBgColor,
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Hustlehub",
            style: TextStyle(
                fontFamily: ktitleText,
                fontWeight: FontWeight.w600,
                fontSize: 30),
          ),
          centerTitle: true,
        ),
        backgroundColor: kBgColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Security Check",
                style: TextStyle(
                    color: kfontColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              kheightinRec,
              Text(
                "As an extra security step, we’ll need to give you a verification code to register.",
                style: TextStyle(
                  color: ktextColor,
                  fontSize: 15,
                ),
              ),
              Text(
                "Learn more",
                style: TextStyle(
                  color: kshowAllColor,
                  fontSize: 15,
                ),
              ),
              ksizedBoxHeight,
              Material(
                color: kcontainerColor,
                borderRadius: BorderRadius.circular(15),
                child: TextField(
                  readOnly: true,
                  controller: _countryController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        _showCountryPicker();
                      },
                    ),
                    hintText: "Select Country",
                    hintStyle: TextStyle(color: ktextColor),

                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    border: InputBorder.none, // Removes the default border
                  ),
                ),
              ),
              kheightinRec,
              kheightinRec,
              Material(
                color: kcontainerColor,
                borderRadius: BorderRadius.circular(15),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    hintStyle: TextStyle(color: ktextColor),

                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    border: InputBorder.none, // Removes the default border
                  ),
                ),
              ),
              kheightinRec,
              kheightinRec,
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      if(_isButtonEnabled){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationScreen()));
                      }
                      else{
                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('You should fill the fields')));
                      }
                    },
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 13)),
                      backgroundColor: WidgetStatePropertyAll(
                          _isButtonEnabled ? Colors.black : ktextColor),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Set border radius
                        ),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
