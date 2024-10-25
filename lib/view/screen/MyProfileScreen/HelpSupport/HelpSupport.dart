import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  final List<bool> isExpanded = [false, false, true, false, false]; // Simulate expanded state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
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
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search language',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // FAQ List
            Expanded(
              child: ListView.builder(
                itemCount: isExpanded.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ExpansionPanelList(
                        elevation: 0,
                        expandedHeaderPadding: EdgeInsets.zero,
                        expansionCallback: (int panelIndex, bool isExpanded) {
                          // In a stateless widget, the state should be managed externally
                        },
                        children: [
                          ExpansionPanel(
                            isExpanded: isExpanded[index],
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                            body: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Excepteur veniam consequat sunt nostrud amet.',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
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

void main() => runApp(MaterialApp(home: HelpSupportPage()));
