import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matrimony/Design/MenuDrawer.dart';
import 'package:matrimony/Design/utils/colors.dart';

List<Map<String, String>> users = [];

class AddUser extends StatefulWidget {
  final bool isEditing;
  final int? userIndex;
  final Map<String, String>? userData;

  const AddUser({
    Key? key,
    this.isEditing = false,
    this.userIndex,
    this.userData,
  }) : super(key: key);

  @override
  AddUserScreenState createState() => AddUserScreenState();
}

class AddUserScreenState extends State<AddUser> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController casteController = TextEditingController();
  final TextEditingController subCasteController = TextEditingController();
  final TextEditingController higherEducationController =
      TextEditingController();
  final TextEditingController motherTongueController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String selectedGender = "";
  List<String> selectedHobbies = [];
  DateTime? selectedDate;
  String? selectedCity;
  String? selectedMaritalStatus;

  final List<String> hobbies = [
    'Reading',
    'Traveling',
    'Cooking',
    'Photography',
    'Gardening',
    'Painting',
  ];

  final List<String> maritalStatusOptions = [
    "Single",
    "Married",
    "Divorced",
    "Widowed"
  ];
  final List<String> cities = [
    "Ahmedabad",
    "Amreli",
    "Anand",
    "Bharuch",
    "Bhavnagar",
    "Bhuj",
    "Dahod",
    "Gandhinagar",
    "Godhra",
    "Jamangar",
    "Junagadh",
    "Kheda",
    "Mehsana",
    "Morbi",
    "Navsari",
    "Nadiad",
    "Palanpur",
    "Porbandar",
    "Rajkot",
    "Sihor",
    "Surat",
    "Surendranagar",
    "Valsad",
    "Vapi",
    "Vadodara"
  ];

  void addUser() {
    if (formKey.currentState!.validate()) {
      final user = {
        'fullName': fullNameController.text,
        'email': emailController.text,
        'mobile': mobileController.text,
        'dateOfBirth': dateController.text,
        'gender': selectedGender,
        'hobbies': selectedHobbies.join(', '),
        'city': selectedCity ?? '',
        'occupation': occupationController.text,
        'religion': religionController.text,
        'caste': casteController.text,
        'subCaste': subCasteController.text,
        'higherEducation': higherEducationController.text,
        'motherTongue': motherTongueController.text,
        'annualIncome': incomeController.text,
        'address': addressController.text,
        'maritalStatus': selectedMaritalStatus ?? '',
      };

      users.add(user);
      Navigator.pop(context);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ) ??
        DateTime.now();

    setState(() {
      selectedDate = picked;
      dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: THEMECOLOR,
        title: Text(
          widget.isEditing ? "Edit User" : "Add User",
          style: TextStyle(color: TEXTCOLOR, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: EdgeInsets.all(13.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Text(
                'About',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: THEMECOLOR),
              ),
              _buildTextField("Full Name", fullNameController, (value) {
                if (value == null || value.isEmpty) {
                  return "Name cannot be empty";
                } else if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {

                  return "Name must contain only letters and spaces";
                }
                return null;
              }),
              buildGenderSelection(),
              TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  border: OutlineInputBorder(),
                ),
                onTap: () => selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date of birth';
                  } else if (selectedDate != null && selectedDate!.isAfter(DateTime.now())) {
                    return 'Date of Birth cannot be in the future';
                  }
                return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              buildDropdown(
                  "Marital Status",
                  maritalStatusOptions,
                  selectedMaritalStatus,
                  (value) => setState(() => selectedMaritalStatus = value)),
              _buildTextField("Mother Tongue", motherTongueController, null),
              Text(
                'Religious Background',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: THEMECOLOR),
              ),
              _buildTextField("Address", addressController, null),
              buildDropdown("City", cities, selectedCity,
                  (value) => setState(() => selectedCity = value)),
              _buildTextField("Religion", religionController, null),
              _buildTextField("Caste", casteController, null),
              _buildTextField("Sub Caste", subCasteController, null),
              Text(
                'Professional Background',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: THEMECOLOR),
              ),
              _buildTextField(
                  "Higher Education", higherEducationController, null),
              _buildTextField("Occupation", occupationController, null),
              _buildTextField("Annual Income", incomeController, null),
              Text(
                'Contact Details',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: THEMECOLOR),
              ),
              _buildTextField("Email Address", emailController, (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email address";
                }
                 else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {

                  return "Please enter a valid email address";
                }
                return null;
              }),
              _buildTextField("Mobile Number", mobileController, (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your mobile number";
                } else if (!RegExp(r'^\+?[1-9][0-9]{9,14}$').hasMatch(value))
                  {
                  return "Enter a valid mobile number (10–15 digits)";
                }
                return null;
              }),
              Text(
                "Personal Interests",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: THEMECOLOR),
              ),
              buildHobbiesSelection(),
              SizedBox(height: 15),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          addUser();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please fill all required fields correctly")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: THEMECOLOR, // Green color for save button
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Save", style: TextStyle(fontSize: 16, color: TEXTCOLOR)),
                    ),
                    SizedBox(width: 15), // Increased spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.reset();
                        emailController.clear();
                        mobileController.clear();
                        dateController.clear();
                        occupationController.clear();
                        religionController.clear();
                        casteController.clear();
                        subCasteController.clear();
                        higherEducationController.clear();
                        motherTongueController.clear();
                        incomeController.clear();
                        addressController.clear();

                        setState(() {
                          selectedGender = "";
                          selectedHobbies.clear();
                          selectedDate = null;
                          selectedCity = null;
                          selectedMaritalStatus = null;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: THEMECOLOR, // Red color for reset button
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Reset", style: TextStyle(fontSize: 16, color: TEXTCOLOR)),

                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      String? Function(String?)? validator,
      {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }

  Widget buildDropdown(String label, List<String> options,
      String? selectedValue, void Function(String?) onChanged) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13),
      child: DropdownButtonFormField(
        value: selectedValue,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        items: options
            .map((option) =>
                DropdownMenuItem(value: option, child: Text(option)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget buildHobbiesSelection() {
    return Padding(
      padding: EdgeInsets.only(bottom: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Select Hobbies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Column(
            children: hobbies
                .map((hobby) => CheckboxListTile(
                      title: Text(hobby),
                      value: selectedHobbies.contains(hobby),
                      onChanged: (isChecked) => setState(() => isChecked == true
                          ? selectedHobbies.add(hobby)
                          : selectedHobbies.remove(hobby)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildGenderSelection() {
    return Padding(
      padding: EdgeInsets.only(bottom: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Select Gender",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['Male', 'Female']
                    .map(
                      (gender) => Row(children: [
                        Radio<String>(
                            value: gender,
                            groupValue: selectedGender,
                            onChanged: (value) =>
                                setState(() => selectedGender = value!)),
                        Text(gender)
                      ]),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
