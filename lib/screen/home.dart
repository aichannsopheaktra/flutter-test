import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/user_api.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rest API Call')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
            child: Text('Go to Login'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: Image.network(user.picture.large),
                  title: Text(user.fullName),
                  subtitle: Text(user.location.postcode.toString()), // Convert postcode to string if it's an int
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Future<void> fetchUsers() async {
    final userdata = await UserApi.fetchUsers();
    setState(() {
      users = userdata;
    });
  }
}
