import 'package:design2/TodoDetailsPage.dart';
import 'package:flutter/material.dart';
class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/todo_image.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.work),
                  
                  onPressed: () {
                    var widget;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoDetailsPage(
                          title: 'Work',
                          date: DateTime.now(), key: ValueKey(widget.title),
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.home),
              
                  onPressed: () {
                    var widget;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoDetailsPage(
                          title: 'Home',
                          date: DateTime.now(), key: ValueKey(widget.title),
                        ),
                      ),
                    );
                  },
                ),
                 IconButton(
                  icon: Icon(Icons.shopping_cart),
                   
                  onPressed: () {
                    var widget;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoDetailsPage(
                          title: 'Shopping',
                          date: DateTime.now(), key: ValueKey(widget.title),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

