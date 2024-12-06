import 'dart:io';

import '../Features/sign_in.dart';
import '../Features/sign_up.dart';

// In this code list act as database to store all values
List<Map<dynamic, dynamic>> database = [
  {
    "Name": "Danyal",
    "Email": "danyal@example.com",
    "Password": "Password",
    "Roll No.": 659,
    "Class": "11",
    "Grades": "A+"
  }
];

// Variables
bool? isCorrect, isSuccessfullySignIn, isRestart, isSelect, isLogout;
String? selectedOption, signInEmail, signInPassword;

void main() {
  isSelect = false;
  selectedOption = "0";
  while (isSelect == false) {
    isCorrect = false;
    isSuccessfullySignIn = false;
    isRestart = true;
    try {
      // For Repeat Sign In and Sign Up options
      if (selectedOption == "0") {
        print("----------------------------------------------------");
        print("Please Select One of the below Option: ");
        print("1. Sign Up");
        print("2. Sign In");
        stdout.write("Enter Option Number: ");
        selectedOption = stdin.readLineSync()!;
      }
      switch (selectedOption) {
        case "1":
          signUp();
          break;
        case "2":
          signIn();
          break;
        default:
          selectedOption = "0";
      }
    } catch (e) {}
  }
}
