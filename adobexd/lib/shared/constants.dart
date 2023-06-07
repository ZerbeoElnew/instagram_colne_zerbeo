
import 'package:adobexd/Models/DTO/register_afwra.dart';
import 'package:flutter/material.dart';

import '../Models/DTO/Login_Afwara.dart';

late LoginAuthModel loginResult;
late RegisterAuthModel registerResult;

void navigateTo(BuildContext context,Widget screen){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
}

void navigateToAndDelete(BuildContext context,Widget screen){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>screen));
}