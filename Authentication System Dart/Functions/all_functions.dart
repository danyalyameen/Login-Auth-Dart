import 'dart:io';

import '../Main Folder/main.dart';

class Functions {
  viewData({required int index}) {
    print(
        "---------------------------------- Profile ----------------------------------");
    print("Name : ${database[index]["Name"]}");
    print("Email : ${database[index]["Email"]}");
    print("Password : ${database[index]["Password"]}");
    print("Roll No. : ${database[index]["Roll No."]}");
    print("Class : ${database[index]["Class"]}");
    print("Grades : ${database[index]["Grades"]}");
  }

  updateData({required int index}) {
    // To Restart Until the User Enter Correct Option Number
    bool isSuccessfullyUpdate = false;
    while (isSuccessfullyUpdate == false) {
      // Get Input
      print(
          "------------------------------------ Update ------------------------------------");
      print("1. Update Name");
      print("2. Update Email");
      print("3. Update Password");
      print("4. Update Roll No.");
      print("5. Update Class");
      print("6. Update Grades");
      print("7. Exit");
      stdout.write("Enter Option Number: ");
      String number = stdin.readLineSync()!;
      // Update Profile Using Index
      switch (number) {
        case "1":
          print(
              "------------------------------------ Update ------------------------------------");
          stdout.write("Enter Name: ");
          String name = stdin.readLineSync()!;
          database[index]["Name"] = name;
          break;
        case "2":
          print(
              "------------------------------------ Update ------------------------------------");
          stdout.write("Enter Email: ");
          signInEmail = stdin.readLineSync()!;
          database[index]["Email"] = signInEmail;
          break;
        case "3":
          print(
              "------------------------------------ Update ------------------------------------");
          stdout.write("Enter Password: ");
          signInPassword = stdin.readLineSync()!;
          database[index]["Password"] = signInPassword;
          break;
        case "4":
          print(
              "------------------------------------ Update ------------------------------------");
          stdout.write("Enter Roll No. : ");
          String rollNo = stdin.readLineSync()!;
          database[index]["Roll No."] = rollNo;
          break;
        case "5":
          print(
              "------------------------------------ Update ------------------------------------");
          stdout.write("Enter Class: ");
          String studentClass = stdin.readLineSync()!;
          database[index]["Class"] = studentClass;
          break;
        case "6":
          print(
              "------------------------------------ Update ------------------------------------");
          stdout.write("Enter Grades: ");
          String grades = stdin.readLineSync()!;
          database[index]["Grades"] = grades;
          break;
        case "7":
          isSuccessfullyUpdate = true;
          break;
        default:
          print("Please Enter the Number Carefully!");
      }
    }
  }

  deleteData({required int index}) {
    // Remove Profile
    database.removeAt(index);
    // Terminate While Loop
    isLogout = true;
    // Restart Parent Loop
    isSelect = false;
    // Reset Selected Option
    selectedOption = "0";
  }

  logoutProfile() {
    // Reset Selected Option
    selectedOption = "0";
    // Restart Parent Loop
    isSelect = false;
    // Terminate While Loop
    isLogout = true;
  }
}
