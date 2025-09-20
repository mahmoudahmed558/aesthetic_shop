// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  // قوائم بيانات وهمية للمنتجات والعروض (سنستبدلها لاحقًا ببيانات حقيقية)
  final List<String> featuredImages = [
    'https://picsum.photos/400/200?image=1',
    'https://picsum.photos/400/200?image=2',
    'https://picsum.photos/400/200?image=3',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'Product 1',
      'image': 'https://picsum.photos/150/150?image=4',
    },
    {
      'id': 2,
      'name': 'Product 2',
      'image': 'https://picsum.photos/150/150?image=5',
    },
    {
      'id': 3,
      'name': 'Product 3',
      'image': 'https://picsum.photos/150/150?image=6',
    },
    {
      'id': 4,
      'name': 'Product 4',
      'image': 'https://picsum.photos/150/150?image=7',
    },
    {
      'id': 5,
      'name': 'Product 5',
      'image': 'https://picsum.photos/150/150?image=8',
    },
    {
      'id': 6,
      'name': 'Product 6',
      'image': 'https://picsum.photos/150/150?image=9',
    },
  ];

  final List<Map<String, dynamic>> hotOffers = [
    {
      'id': 1,
      'title': 'خصم 20% على جميع المنتجات',
      'image': 'https://picsum.photos/100/100?image=10',
    },
    {
      'id': 2,
      'title': 'عرض لمدة 3 أيام فقط',
      'image': 'https://picsum.photos/100/100?image=11',
    },
    {
      'id': 3,
      'title': 'اشتر 2 واحصل على الثالث مجاناً',
      'image': 'https://picsum.photos/100/100?image=12',
    },
    {
      'id': 4,
      'title': 'تخفيضات نهاية الموسم',
      'image': 'https://picsum.photos/100/100?image=13',
    },
    {
      'id': 5,
      'title': 'عرض خاص للأعضاء الجدد',
      'image': 'https://picsum.photos/100/100?image=14',
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Our Products',
          style: TextStyle(color: Colors.white),
        ), // سنترجم هذا لاحقًا للعربية
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // قسم الصور المميزة (PageView)
            _buildFeaturedSection(),

            // قسم منتجات (GridView)
            _buildProductsSection(context),

            // قسم العروض الساخنة (ListView)
            _buildHotOffersSection(),
          ],
        ),
      ),
    );
  }

  // دالة لبناء قسم الصور المميزة
  Widget _buildFeaturedSection() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: featuredImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                featuredImages[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }

  // دالة لبناء قسم المنتجات
  Widget _buildProductsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // لمنع التصادم في التمرير
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عمودين
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7, // نسبة الطول إلى العرض
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: Column(
                  children: [
                    Image.network(
                      products[index]['image'],
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(products[index]['name']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        // إظهار SnackBar عند النقر
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${products[index]['name']} added to cart',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // دالة لبناء قسم العروض الساخنة
  Widget _buildHotOffersSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hot Offers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 400, // ارتفاع ثابت للقائمة
            child: ListView.builder(
              physics:
                  const BouncingScrollPhysics(), // تأثير rimble عند التمرير
              itemCount: hotOffers.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Image.network(
                        hotOffers[index]['image'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(hotOffers[index]['title']),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
