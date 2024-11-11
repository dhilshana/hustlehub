import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hastlehub/company/widgets/jobDetailScreenWidget.dart';
import 'package:hastlehub/services/firebaseStorage.dart';
import 'package:hastlehub/users/widgets/ApplyTextFieldWidget.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/utils/controller.dart';

class ApplyScreen extends StatefulWidget {
  Map<String, dynamic> jobData;
  ApplyScreen({super.key, required this.jobData});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController introController = TextEditingController();

  bool isLoading = false;

  PlatformFile? resume;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ApplyTextFieldWidget(controller: nameController, hintText: 'Name'),
            ksizedBoxHeight,
            ApplyTextFieldWidget(
                controller: emailController, hintText: 'Email'),
            ksizedBoxHeight,
            ApplyTextFieldWidget(
                controller: phoneController, hintText: 'Phone No',type: 'number',),
            ksizedBoxHeight,
            ApplyTextFieldWidget(
                controller: introController,
                hintText: 'Brief indroduction about you'),
            ksizedBoxHeight,
            GestureDetector(
              onTap: () async {
                final file = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if (file != null) {
                  resume = file.files.single;
                  setState(() {});
                }
              },
              child: Container(
                child: Center(
                    child: Text(resume != null
                        ? resume!.name.toString()
                        : 'Attach your resume')),
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            ksizedBoxHeight,
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        isLoading = true;
                      });

                      if (resume != null) {
                        await storeApplicationtoFireStore(
                            companyId: widget.jobData['companyId'],
                            jobId: widget.jobData['jobId'],
                            name: nameController.text,
                            email: emailController.text,
                            phno: phoneController.text,
                            indro: introController.text,
                            resume: File(resume!.path!));

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Application sent successfully')));
                          isLoading = false;
                          Navigator.pop(context);

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No resume attached')));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));

                      isLoading = false;
                      setState(() {});
                    } finally {
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 13)),
                    backgroundColor: const WidgetStatePropertyAll(Colors.black),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25), // Set border radius
                      ),
                    ),
                  ),
                  child: isLoading
                      ? CupertinoActivityIndicator(
                          color: Colors.white30,
                        )
                      : const Text(
                          "Apply",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
            ),
          ],
        ),
      ),
    ));
  }
}
