import 'package:flutter/material.dart';
import 'package:projectking/watches.dart';

class FavoritesTab extends StatelessWidget {
  
  final List<Watch> favoriteWatches;

  FavoritesTab({required this.favoriteWatches});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: favoriteWatches.length,
        itemBuilder: (context, index) {
          final Watch favoriteWatch = favoriteWatches[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            color: Colors.white70,
            child: ListTile(
              title: Text(
                favoriteWatch.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                children: [
                  Text(
                    'Price: Rs ${favoriteWatch.price}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Implement the Buy Now functionality here
                  // For example, you can add the selected item to the user's cart
                  // and update the cart item count.
                  // For now, we'll just increment the cart item count as a placeholder.
                
                },
                child: Text('Buy Now'),
              ),
            ),
          );
        },
      ),
    );
  }
}
