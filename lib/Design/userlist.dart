// import 'package:flutter/material.dart';
// import 'package:matrimony/Design/adduser.dart';
// import 'package:matrimony/Design/userdetails.dart';
// import 'package:matrimony/Design/utils/colors.dart';
//
// import 'MenuDrawer.dart';
//
// class UserList extends StatefulWidget {
//   const UserList({Key? key}) : super(key: key);
//
//   @override
//   UserListState createState() => UserListState();
// }
//
// class UserListState extends State<UserList> {
//   final TextEditingController searchController = TextEditingController();
//   List<Map<String, String>> filteredUsers = users;
//   final List<Map<String, dynamic>> favoriteUsers = [];
//   bool isFavorite = false;
//   @override
//   void initState() {
//     super.initState();
//     searchController.addListener(filterUsers);
//   }
//
//   void filterUsers() {
//     setState(() {
//       filteredUsers = users
//           .where((user) =>
//       user['fullName']!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//           user['email']!.toLowerCase().contains(searchController.text.toLowerCase()) ||
//           user['city']!.toLowerCase().contains(searchController.text.toLowerCase()))
//           .toList();
//     });
//   }
//
//   void deleteUser(int index) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Delete User"),
//         content: Text("Are you sure you want to delete this user?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context), // Cancel
//             child: Text("No"),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 users.removeAt(index);
//                 filteredUsers = users;
//               });
//               Navigator.pop(context); // Close dialog
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("User deleted successfully!")),
//               );
//             },
//             child: Text("Yes"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void editUser(int index) {
//     final user = users[index];
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AddUser(
//           isEditing: true,
//           userIndex: index,
//           userData: user,
//         ),
//       ),
//     ).then((_) {
//       setState(() {
//         filteredUsers = users;
//       });
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: THEMECOLOR,
//         title: Text("User List",style: TextStyle(color: TEXTCOLOR,fontWeight: FontWeight.bold,),
//
//         ),
//       ),
//       drawer: MenuDrawer(),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   hintText: "Search User",
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 ),
//               ),
//             ),
//           ),
//           // User list
//           Expanded(
//             child: filteredUsers.isEmpty
//                 ? Center(child: Text("No users found."))
//                 : ListView.builder(
//               itemCount: filteredUsers.length,
//               itemBuilder: (context, index) {
//                 final user = filteredUsers[index];
//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => UserDetails(userData: user),
//                         ),
//                       );
//                     },
//                     title: Text(user['fullName'] ?? "N/A"),
//                     subtitle: Text(
//                         "Email: ${user['email'] ?? "N/A"}\n"
//                             "City: ${user['city'] ?? "N/A"}\n"
//                             "Mobile no.: ${user['mobile'] ?? "N/A"}"
//                     ),
//                     isThreeLine: true,
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             isFavorite ? Icons.favorite : Icons.favorite_border,
//                             color: isFavorite ? Colors.red : Colors.grey,
//                           ),
//                           iconSize: 30.0,
//                           onPressed: () {
//                             setState(() {
//                               isFavorite = !isFavorite; // Toggle the favorite status
//                             });
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.edit, color: Colors.blue),
//                           onPressed: () => editUser(users.indexOf(user)),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.delete, color: Colors.red),
//                           onPressed: () => deleteUser(users.indexOf(user)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//
//             ),
//
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddUser(
//                 isEditing: false, // Ensure you're adding a new user, not editing
//               ),
//             ),
//           );
//           setState(() {
//             filteredUsers = users; // Refresh the user list after returning
//           });
//         },
//         backgroundColor: THEMECOLOR,
//         foregroundColor: TEXTCOLOR,
//         elevation: 8.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: const Icon(
//           Icons.add,
//           size: 30.0,
//         ),
//       ),
//     );
//   }
// }