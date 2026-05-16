
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Hand-Carved Walnut Owl',
      tagline: 'Nature\'s masterpiece, shaped by hand.',
      description: 'Crafted from a single piece of select Turkish walnut wood. The wood\'s natural grain and deep, rich color make each owl truly unique.\n\nMaterial: 100% Solid Turkish Walnut Wood\nDimensions: Height 15cm, Width 10cm, Depth 5cm',
      price: '350₺',
      image: 'assets/images/owl.png',
    ),
    Product(
      id: 2,
      name: 'Minimalist Oak Elephant',
      tagline: 'Nature\'s masterpiece, shaped by hand.',
      description: 'Crafted from a single piece of select Turkish oak wood. The wood\'s natural grain and deep, rich color make each elephant truly unique.\n\nMaterial: 100% Solid Turkish Oak Wood\nDimensions: Height 12cm, Width 14cm, Depth 6cm',
      price: '500₺',
      image: 'assets/images/elephant.png',
    ),
    Product(
      id: 3,
      name: 'Intricate Cherry Wood Box',
      tagline: 'Nature\'s masterpiece, shaped by hand.',
      description: 'Crafted from select Turkish cherry wood. The wood\'s natural grain and intricate carvings make each box truly unique.\n\nMaterial: 100% Solid Turkish Cherry Wood\nDimensions: Height 8cm, Width 16cm, Depth 10cm',
      price: '650₺',
      image: 'assets/images/box.png',
    ),
    Product(
      id: 4,
      name: 'Polished Pine Keyring Set',
      tagline: 'Nature\'s masterpiece, shaped by hand.',
      description: 'Crafted from a single piece of select Turkish pine wood. The wood\'s natural grain and deep, rich color make each keyring truly unique.\n\nMaterial: 100% Solid Turkish Pine Wood\nDimensions: Height 5cm, Width 3cm, Depth 1cm',
      price: '120₺',
      image: 'assets/images/keyring.png',
    ),
  ];

  String _searchQuery = '';
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Walnut', 'Oak', 'Figurines', 'Boxes'];

  List<Product> get _filteredProducts {
    return _products.where((product) {
      bool matchesCategory = false;
      if (_selectedCategory == 'All') {
        matchesCategory = true;
      } else if (_selectedCategory == 'Walnut') {
        matchesCategory = product.name.contains('Walnut');
      } else if (_selectedCategory == 'Oak') {
        matchesCategory = product.name.contains('Oak');
      } else if (_selectedCategory == 'Figurines') {
        matchesCategory = product.name.contains('Owl') || product.name.contains('Elephant');
      } else if (_selectedCategory == 'Boxes') {
        matchesCategory = product.name.contains('Box');
      }

      bool matchesSearch = product.name.toLowerCase().contains(_searchQuery.toLowerCase()) || 
                           product.description.toLowerCase().contains(_searchQuery.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade50,
        elevation: 0,
        title: const Text('Wood Decor', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.brown.shade800),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/banner.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.black.withValues(alpha: 0.3),
                child: const Center(
                  child: Text(
                    'WOOD DECOR',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      letterSpacing: 2.0,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search decor, wood types...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) _selectedCategory = category;
                      });
                    },
                    selectedColor: Colors.brown.shade800,
                    backgroundColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? Colors.brown.shade800 : Colors.grey.shade400,
                      ),
                    ),
                    showCheckmark: false,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _filteredProducts.isEmpty
                ? const Center(child: Text('No products found.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
