import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/flagAppBar.dart';
import '../widgets/nextButton.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  PhoneNumberState createState() => PhoneNumberState();
}

class PhoneNumberState extends State<PhoneNumber> {
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    Map<String, String> phoneNumber;
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp exp = RegExp(pattern);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var response;

    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              //mainAxisSize: MainAxisSize.max,
              children: [
                const FlagAppBar(),
                Container(
                    margin: EdgeInsets.only(
                        left: width / 4,
                        right: width / 4,
                        top: height / 10,
                        bottom: height / 10),
                    child:
                        Image.asset("assets/images/logo-main.png", scale: 25)),
                Container(
                  margin: EdgeInsets.only(left: width / 6, right: width / 6),
                  child: Text(
                    "VILLEZ ENTRER VOTRE NUMÉRO DE TÉLÉPHONE POUR RÉALISER VOTRE INSCRIPTION",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: width / 6,
                      right: width / 6,
                      bottom: 0,
                      top: height / 20),
                  child: Image.asset("assets/images/phoneNumber.gif"),
                ),
                Container(
                    margin: EdgeInsets.only(top: height / 15),
                    width: 3 * width / 4,
                    child: TextField(
                      controller: phoneController,
                      scrollPadding: EdgeInsets.only(bottom: 40),
                      decoration: InputDecoration(
                        hintText: 'Numéro de téléphone',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                              color: Color(0XFF1d3364),
                              borderRadius: BorderRadius.circular(10)),
                          height: height / 13,
                          child: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.send),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => GeneralInformation()),
                                // );
                              }),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true, //<-- SEE HERE
                        fillColor:
                            Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                      ),
                    )),
                Container(
                  child: Text(
                    "Vous devez saisir un numéro de téléphone valide",
                    style: TextStyle(
                        color: showError ? Colors.red : Colors.transparent),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
