import 'package:flutter/material.dart';
import 'order_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  final List<Map<String, dynamic>> menu = const [
    {
      "name": "Nasi Goreng",
      "price": 15000,
      "image": "https://assets.unileversolutions.com/recipes-v2/242794.jpg",
    },
    {
      "name": "Mie Ayam",
      "price": 12000,
      "image":
          "https://assets.unileversolutions.com/recipes-v3/242756-default.jpg?im=AspectCrop=(350,350);Resize=(350,350)",
    },
    {
      "name": "Sate Ayam",
      "price": 20000,
      "image":
          "https://assets.unileversolutions.com/v1/126151706.png?im=AspectCrop=(350,350);Resize=(350,350)",
    },
    {
      "name": "Bakso",
      "price": 10000,
      "image":
          "https://assets.unileversolutions.com/v1/110511299.jpg?im=AspectCrop=(350,350);Resize=(350,350)",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang, $username ! "),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.red,
            tooltip: "Logout",
            onPressed: () {
              // Logout -> kembali ke LoginPage dan hapus semua halaman sebelumnya
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            "https://assets.unileversolutions.com/v1/104190077.png?im=AspectCrop=(380,220);Resize=(380,220)",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 15),
          const Text(
            "Daftar Menu:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 20, // jarak horizontal antar gambar
                mainAxisSpacing: 20, // jarak vertikal antar gambar
              ),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                final item = menu[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              item["image"],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item["name"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Rp ${item["price"]}"),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(item: item),
                            ),
                          );
                        },
                        child: const Text("Pesan"),
                      ),
                      const SizedBox(height: 5),
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
