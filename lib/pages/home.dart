import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        children: [
          _buildHomeCard(context, 'Flashcards', Icons.quiz, '/quiz'),
          _buildHomeCard(context, 'Create Deck', Icons.add, '/deck_creator'),
        ],
      ),
    );
  }

  Widget _buildHomeCard(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
