import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: CartManager.items.isEmpty
          ? const Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 18)))
          : ListView.builder(
              itemCount: CartManager.items.length,
              itemBuilder: (context, index) {
                final product = CartManager.items[index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.price),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        CartManager.items.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
