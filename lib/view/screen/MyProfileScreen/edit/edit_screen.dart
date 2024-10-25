import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:AssetImage('assets/img/profile.jpg')
                ),
              ),
              SizedBox(height: 20),

              Text(
                'Username',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),

              _buildTextField(
                label: "Username",
                icon: Icons.person,
                initialValue: "Magdalena Succrose",
              ),
              SizedBox(height: 20),

              Text(
                'Email or Phone Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              _buildTextField(
                label: "Email or Phone Number",
                icon: Icons.email_outlined,
                initialValue: "magdalena83@mail.com",
              ),

              SizedBox(height: 16),

              _buildLinkedAccountSection(),

              SizedBox(height: 160),

              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff005667),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  'Save Changes',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String initialValue,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildLinkedAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account Linked With",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: Container(
                height: 35,
                width: 35,
                child: Image.asset('assets/img/google.png')),
            title: Text(
              'Google',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            trailing: Icon(
              Icons.link,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
