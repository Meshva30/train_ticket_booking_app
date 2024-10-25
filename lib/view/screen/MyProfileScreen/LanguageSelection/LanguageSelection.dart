import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  final String? selectedLanguage; // Make nullable
  final Function(String)? onLanguageSelected; // Make nullable

  LanguageSelectionPage({this.selectedLanguage, this.onLanguageSelected});

  final List<Map<String, dynamic>> _languages = [
    {'name': 'English', 'flag': '🇬🇧'},
    {'name': 'Bahasa Indonesia', 'flag': '🇮🇩'},
    {'name': 'Chinese', 'flag': '🇨🇳'},
    {'name': 'Deutsch', 'flag': '🇩🇪'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
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
        child: Column(
          children: [
            // Search bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  hintText: 'Search language',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: ListTile(
                            leading: Text(
                              _languages[index]['flag'],
                              style: TextStyle(fontSize: 24),
                            ),
                            title: Text(
                              _languages[index]['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing:
                                selectedLanguage == _languages[index]['name']
                                    ? Icon(Icons.check, color: Colors.blue)
                                    : null,
                            onTap: () {

                              if (onLanguageSelected != null) {
                                onLanguageSelected!(_languages[index]['name']);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
