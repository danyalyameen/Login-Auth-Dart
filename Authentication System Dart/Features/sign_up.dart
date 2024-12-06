import 'dart:io';
import '../Main Folder/main.dart';

signUp() {
  try {
    // To stop the while loop
    isSelect = true;
    // Input Email from the User
    print("----------------------------------------------------");
    stdout.write("Please Enter Your Email : ");
    String email = stdin.readLineSync()!;
    // Use While loop to check the new Email which is Entered by the User after enter the incorrect email by chosing option 2
    while (isRestart == true) {
      isCorrect = false;
      // Use For In Loop to check email is match any of email already present or not
      for (var i in database) {
        // Condition to check Email
        if (i["Email"] == email) {
          // If user repeatedly Enter the incorrect Email which is already present in database. We also again and again show this message.
          while (isCorrect == false) {
            // User Choose the Option below
            print("----------------------------------------------------");
            print("This Email is Already Exists. Please Select One Option: ");
            print("1. Sign In");
            print("2. Try with a different Email");
            stdout.write("Enter Option Number: ");
            String enteredNumber = stdin.readLineSync()!;
            print("----------------------------------------------------");
            // For Sign In Option
            switch (enteredNumber) {
              case "1":
                // Terminate While Loop
                isCorrect = true;
                // Terminate While Loop
                isRestart = false;
                // Restart Parent While Loop
                isSelect = false;
                // For Choose Direct Sign In Option
                selectedOption = "2";
                break;
              case "2":
                // Input Email from the User and store it into global email variable
                stdout.write("Please Enter Your Email : ");
                email = stdin.readLineSync()!;
                // Terminate While Loop
                isCorrect = true;
                // Restart While Loop to check new email is already present in database or not
                isRestart = true;
              default:
                // For Enter Invalid Option Number
                print("Please Enter the Number Carefully!");
            }
          }
          // Terminate the For In Loop
          break;
        } else {
          if (i == database.last && i["Email"] != email) {
            // Map to store data and then add it to list
            Map<String, dynamic> map = {};
            // To Terminate While Loop
            isRestart = false;
            // Get Input From User After Check Email is Already Use or not
            stdout.write("Please Enter Your Password : ");
            String password = stdin.readLineSync()!;
            stdout.write("Please Enter Your Roll No. : ");
            String rollNo = stdin.readLineSync()!;
            stdout.write("Please Enter Your Name: ");
            String name = stdin.readLineSync()!;
            stdout.write("Please Enter Your Class: ");
            String studentClass = stdin.readLineSync()!;
            stdout.write("Please Enter Your Grades: ");
            String grades = stdin.readLineSync()!;
            print("----------------------------------------------------");
            // Add Data to Map
            map["Email"] = email;
            map["Password"] = password;
            map["Roll No."] = rollNo;
            map["Name"] = name;
            map["Class"] = studentClass;
            map["Grades"] = grades;
            print("Account Created Successfully!");
            // Add Map to List
            database.add(map);
            // To Restart the Parent Loop
            isSelect = false;
            // To Reset the Option and Make the Option Variable to Get Again Input From User
            selectedOption = "0";
          }
        }
      }
    }
  } catch (e) {}
}
