import 'dart:io';

import '../Functions/all_functions.dart';
import '../Main Folder/main.dart';

signIn() {
  // To Terminate Parent Loop
  isSelect = true;
  // Restart Until the User Successfully Sign In
  while (isSuccessfullySignIn == false) {
    // Get Input From User
    print("----------------------------------------------------");
    stdout.write("Please Enter Your Email : ");
    signInEmail = stdin.readLineSync()!;
    stdout.write("Please Enter Your Password : ");
    signInPassword = stdin.readLineSync()!;
    // Find Index to Fetch, Update and Delete the Data
    int index = database.indexWhere(
      (element) {
        return element["Email"] == signInEmail &&
            element["Password"] == signInPassword;
      },
    );
    // For In Loop to Check Email is Registered or Not
    for (var i in database) {
      if (i["Email"] == signInEmail && i["Password"] == signInPassword) {
        // Terminate Sign In Parent While Loop After the Condition is True
        isSuccessfullySignIn = true;
        // Make Variable to Check User is Logout or Login
        isLogout = false;
        // To Manage State Until the User Logout or Delete Profile
        while (isLogout == false) {
          // Get Input From User
          print("----------------------------------------------------");
          print("Select the Option: ");
          print("1. View Profile");
          print("2. Update Profile");
          print("3. Delete Profile");
          print("4. Logout");
          stdout.write("Enter Option Number: ");
          String numberEntered = stdin.readLineSync()!;
          Functions functions = Functions();
          switch (numberEntered) {
            case "1":
              // View Data
              functions.viewData(index: index);
              break;
            case "2":
              // Update Data Using Index
              functions.updateData(index: index);
              break;
            case "3":
              // Remove Data Using Index
              functions.deleteData(index: index);
              break;
            case "4":
              // Logout Profile
              functions.logoutProfile();
              break;
            default:
              print("Please Select the Option Carefully!");
          }
        }
        break;
      } else {
        // For Error on Email and Password
        if (i == database.last) {
          // Restart the Sign In on Error
          var selectForSignIn = false;
          while (selectForSignIn == false) {
            // Get Input From User
            print("Email and Password is Invalid!");
            print("1. Sign Up");
            print("2. Try Again");
            stdout.write("Enter Option Number: ");
            String options = stdin.readLineSync()!;
            // For Direct Sign Up
            switch (options) {
              case "1":
                // Terminate While Loop
                selectForSignIn = true;
                // Restart Parent Loop
                isSelect = false;
                // Termiate Parent Sign In While Loop
                isSuccessfullySignIn = true;
                // For Direct Sign Up
                selectedOption = "1";
                break;
              case "2":
                // Terminate While Loop
                selectForSignIn = true;
                // Restart Parent Sign In While Loop
                isSuccessfullySignIn = false;
                break;
              default:
                // Print Warning
                print("Please Select the Option Carefully!");
            }
          }
        }
      }
    }
  }
}
