import 'package:flutter/material.dart';
class TodoDetailsPage extends StatefulWidget {
  final String title;
  final DateTime date;

  const TodoDetailsPage({required Key key, required this.title, required this.date}) : super(key: key);

  @override
  _TodoDetailsPageState createState() => _TodoDetailsPageState();
}

class _TodoDetailsPageState extends State<TodoDetailsPage> {
  bool _isImportant = false;
  bool _isUrgent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: ValueKey(widget.title),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${widget.date.toString()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _isImportant,
                  onChanged: (value) {
                    setState(() {
                      _isImportant = value!;
                    });
                  },
                ),
                Text('Important'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _isUrgent,
                  onChanged: (value) {
                    setState(() {
                      _isUrgent = value!;
                    });
                  },
                ),
                Text('Urgent'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Make a Wishlist'),
            ),
          ],
        ),
      ),
    );
  }
}