import 'package:flutter/material.dart';

class DeckCreatorPage extends StatefulWidget {
  @override
  _DeckCreatorPageState createState() => _DeckCreatorPageState();
}

class _DeckCreatorPageState extends State<DeckCreatorPage> {
  final TextEditingController _deckNameController = TextEditingController();

  void _saveDeck() {
    String deckName = _deckNameController.text.trim();

    if (deckName.isEmpty) {
      // Show a snackbar if the deck name is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a deck name.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Here you can add code to save the deck to your database or local storage

    // After saving, show a confirmation message and pop the page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deck "$deckName" has been saved!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Deck'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create a New Deck',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _deckNameController,
                decoration: InputDecoration(
                  labelText: 'Deck Name',
                  labelStyle: TextStyle(color: Colors.teal.shade600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade800, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveDeck,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Save Deck',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
