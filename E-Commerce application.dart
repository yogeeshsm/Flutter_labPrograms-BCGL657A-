import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: EcommerceApp()));

class EcommerceApp extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'T-Shirt', 'price': '\$20'},
    {'name': 'Shoes', 'price': '\$50'},
    {'name': 'Watch', 'price': '\$80'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple E-Commerce')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(product['name']!),
              subtitle: Text(product['price']!),
              trailing: ElevatedButton(
                child: Text('Add to Cart'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product['name']} added to cart')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

#Alternative Program 
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Scaffold(
  appBar: AppBar(title: Text('E-commerce')),
  body: Center(child: ProductCard()),
)));

class ProductCard extends StatefulWidget {
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool bought = false;

  @override
  Widget build(BuildContext c) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.phone_android, size: 60),
      Text('Mi 11i 5G', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('₹27,999', style: TextStyle(color: Colors.green)),
      ElevatedButton(
        onPressed: bought ? null : () => setState(() => bought = true),
        child: Text(bought ? 'Purchased' : 'Buy Now'),
      ),
    ],
  );
}
