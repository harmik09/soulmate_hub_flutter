// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:matrimony/Design/MenuDrawer.dart';
// import 'package:matrimony/Design/utils/colors.dart';
//
// // Global List to store user data
// List<Map<String, String>> users = [];
//
// class demo extends StatefulWidget {
//   final bool isEditing;
//   final int? userIndex;
//   final Map<String, String>? userData;
//
//   const AddUser({
//     Key? key,
//     this.isEditing = false,
//     this.userIndex,
//     this.userData,
//   }) : super(key: key);
//
//   @override
//   AddUserScreenState createState() => AddUserScreenState();
// }
//
// class AddUserScreenState extends State<AddUser> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   // Controllers for form fields
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//   TextEditingController();
//   final TextEditingController dateController = TextEditingController();
//
//   String selectedGender = "";
//   List<String> selectedHobbies = [];
//   DateTime? selectedDate;
//   String? selectedCity;
//
//   // Define hobbies and cities
//   final List<String> hobbies = [
//     'Reading',
//     'Traveling',
//     'Cooking',
//     'Photography',
//     'Gardening',
//     'Painting',
//   ];
//   final List<String> cities =[
//     "Ahmedabad",
//     "Amreli",
//     "Anand",
//     "Bharuch",
//     "Bhavnagar",
//     "Bhuj",
//     "Dahod",
//     "Gandhinagar",
//     "Godhra",
//     "Jamangar",
//     "Junagadh",
//     "Kheda",
//     "Mehsana",
//     "Morbi",
//     "Navsari",
//     "Nadiad",
//     "Palanpur",
//     "Porbandar",
//     "Rajkot",
//     "Sihor",
//     "Surat",
//     "Surendranagar",
//     "Valsad",
//     "Vapi",
//     "Vadodara"
//   ];
// // Static list of users
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     if (widget.isEditing && widget.userData != null) {
//       final userData = widget.userData!;
//       fullNameController.text = userData['fullName'] ?? "";
//       emailController.text = userData['email'] ?? "";
//       mobileController.text = userData['mobile'] ?? "";
//       dateController.text = userData['dateOfBirth'] ?? "";
//       selectedGender = userData['gender'] ?? "";
//       selectedHobbies = userData['hobbies']?.split(', ') ?? [];
//       selectedCity = userData['city'] ?? "";
//
//       if (userData['dateOfBirth'] != null) {
//         selectedDate = DateFormat('dd/MM/yyyy').parse(userData['dateOfBirth']!);
//       }
//     }
//   }
//
//   void AddUser() {
//     if (formKey.currentState!.validate()) {
//       // Calculate age
//       int? age;
//       DateTime? selectedDate = DateTime(2000, 5, 15);
//       if (selectedDate != null) {
//         final now = DateTime.now();
//         int age = now.year - selectedDate.year;
//         if (now.month < selectedDate.month ||
//             (now.month == selectedDate.month && now.day < selectedDate.day)) {
//           age -= 1; // Adjust if birthday hasn't occurred this year
//         }
//
//         if (age < 18 || age > 80) {
//           print("Age must be between 18 and 80 years.");
//           // Display error or take other actions
//         } else {
//           print("Valid age: $age");
//           // Perform further operations with the valid age
//         }
//       }
//
//       // Collect user data
//
//       final user = {
//         'fullName': fullNameController.text,
//         'email': emailController.text,
//         'mobile': mobileController.text,
//         'dateOfBirth': dateController.text,
//         'gender': selectedGender,
//         'hobbies': selectedHobbies.join(', '),
//         'city': selectedCity ?? '',
//         'age': age?.toString() ?? '',
//         'isFavorite': false.toString(), // Default value for isFavorite
//       };
//
//       if (widget.isEditing && widget.userIndex != null) {
//         // Update existing user
//         users[widget.userIndex!] = user;
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("User updated successfully!")),
//         );
//       } else {
//         // Add new user
//         users.add(user);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("User added successfully!")),
//         );
//       }
//
//       // Navigate back to User List Screen
//       Navigator.pop(context);
//     }
//   }
//
//   // Function to open the Date Picker
//   Future<void> selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     ) ??
//         DateTime.now();
//
//     setState(() {
//       selectedDate = picked;
//       dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
//     });
//   }
//
//   // Date of Birth validation
//   String? validateDateOfBirth(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select a date of birth';
//     }
//     try {
//       DateFormat('dd/MM/yyyy').parseStrict(value);
//     } catch (e) {
//       return 'Invalid date format. Use dd/MM/yyyy';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: THEMECOLOR,
//         title: Text(
//           widget.isEditing ? "Edit User" : "Add User",
//           style: TextStyle(
//             color: TEXTCOLOR,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       drawer: MenuDrawer(),
//       body: Padding(
//         padding: EdgeInsets.all(13.0),
//         child: Form(
//           key: formKey,
//           child: ListView(
//             children: [
//               SizedBox(height: 13),
//
//               // Full Name
//               TextFormField(
//                 controller: fullNameController,
//                 decoration: InputDecoration(
//                   labelText: "Full Name",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your full name";
//                   } else if (!RegExp(r"^[a-zA-Z\s'-]{3,50}$").hasMatch(value)) {
//                     return "Enter a valid full name (3-50 characters, alphabets only)";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 13),
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email Address",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your email address";
//                   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return "Please enter a valid email address";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 13),
//
//               // Mobile Number
//               TextFormField(
//                 controller: mobileController,
//                 decoration: InputDecoration(
//                   labelText: "Mobile Number",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your mobile number";
//                   } else if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
//                     return "Enter a valid mobile number (10–15 digits)";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 13),
//
//               // Date of Birth
//               TextFormField(
//                 controller: dateController,
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                 ),
//                 onTap: () => selectDate(context),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select a date of birth';
//                   }
//                   try {
//                     DateTime parsedDate =
//                     DateFormat('dd/MM/yyyy').parseStrict(value);
//                     final now = DateTime.now();
//                     int age = now.year - parsedDate.year;
//                     if (now.month < parsedDate.month ||
//                         (now.month == parsedDate.month &&
//                             now.day < parsedDate.day)) {
//                       age -= 1;
//                     }
//
//                     if (age < 18 || age > 80) {
//                       return 'Age must be between 18 and 80 years';
//                     }
//                   } catch (e) {
//                     return 'Invalid date format. Use dd/MM/yyyy';
//                   }
//                   return null;
//                 },
//               ),
//
//               SizedBox(height: 13),
//
//               // City Dropdown Menu
//               DropdownButtonFormField<String>(
//                 value: selectedCity,
//                 hint: Text("Select your city"),
//                 items: cities
//                     .map((city) => DropdownMenuItem(
//                   value: city,
//                   child: Text(city),
//                 ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedCity = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please select a city";
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: "City",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 13),
//
//               // Gender
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Gender:"),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         children: [
//                           Radio<String>(
//                             value: "Male",
//                             groupValue: selectedGender,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedGender = value!;
//                               });
//                             },
//                           ),
//                           Text("Male"),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Radio<String>(
//                             value: "Female",
//                             groupValue: selectedGender,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedGender = value!;
//                               });
//                             },
//                           ),
//                           Text("Female"),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Radio<String>(
//                             value: "Other",
//                             groupValue: selectedGender,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedGender = value!;
//                               });
//                             },
//                           ),
//                           Text("Other"),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 13),
//
//               // Hobbies
//               Text("Hobbies:"),
//               Column(
//                 children: hobbies
//                     .map((hobby) => CheckboxListTile(
//                   title: Text(hobby),
//                   value: selectedHobbies.contains(hobby),
//                   onChanged: (isChecked) {
//                     setState(() {
//                       if (isChecked == true) {
//                         selectedHobbies.add(hobby);
//                       } else {
//                         selectedHobbies.remove(hobby);
//                       }
//                     });
//                   },
//                 ))
//                     .toList(),
//               ),
//               SizedBox(height: 13),
//
//               // Password
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your password";
//                   } else if (value.length < 6) {
//                     return "Password must be at least 6 characters";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 13),
//
//               // Confirm Password
//               TextFormField(
//                 controller: confirmPasswordController,
//                 decoration: InputDecoration(
//                   labelText: "Confirm Password",
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please confirm your password";
//                   } else if (value != passwordController.text) {
//                     return "Passwords do not match";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 13),
//
//               // Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: AddUser,
//                     child: Text("Save"),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       formKey.currentState!.reset();
//                       fullNameController.clear();
//                       emailController.clear();
//                       mobileController.clear();
//                       passwordController.clear();
//                       confirmPasswordController.clear();
//                       dateController.clear();
//                       setState(() {
//                         selectedGender = "";
//                         selectedHobbies.clear();
//                         selectedDate = null;
//                         selectedCity = null;
//                       });
//                     },
//                     child: Text("Reset"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }