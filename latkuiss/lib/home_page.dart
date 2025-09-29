import 'package:flutter/material.dart';
import 'order_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  final String username;

  const HomePage({super.key, required this.username});

  final List<Map<String, dynamic>> menu = const [
    {
      "name": "Nasi Goreng",
      "price": 14500,
      "image":
          "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcRHCsZC74MIva7zVT2-68XGV-lqPe7fkrynYamzmFXb373yfldHrWjtmKW2w1e6CfC4X1vu6cEL4WjVjTTMgsaJGCGkHrU3r4IVTULKG5fNwWBQs6c",
    },
    {
      "name": "Mie Ayam",
      "price": 12000,
      "image":
          "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcQcauK8vOlMFLwUVoXgKYFLPXqaE4c0g4CIoOqu78SjL-QCn9c-oq3wxV9d75Igf5QG-ufUYBCtbxZf73v6zv0U1YVef6bCqgL54jnIBPuWk1Bw3rk",
    },
    {
      "name": "Sate Ayam",
      "price": 20000,
      "image":
          "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcTDe3wAiyD8YVxxTwDSbqZN2JeZhpHDUl1SlM4-G350xa62c5GR69CeOg9Ig6vc2vEqpawapn0rRPWQMNI5_SxqK154cXqIKbR8W04Qt1RaijLgI1g",
    },
    {
      "name": "Bakso",
      "price": 15000,
      "image":
          "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcR-wbkuhBhCH2gW75eGUETSjOiQ9HylgIuAfLefZXp4HRODFnSolxawOCVlWJ50VOcv_wdZoAnViSB-q8EA6qGvZB_yD7_Ix_ku6zsIf8O3ZCD1nvQ",
    },
    {
      "name": "Es Teh",
      "price": 5000,
      "image":
          "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQtsYlZ2YkeU3lib2y-WNdTzDtB329vrvG4rLMFMj9z6hUVsRkmNecjevdcrnVSK1-GF11b8Nnz48WKnYu53_MWEWHWilrE2DJEtl0WqF8W5SVZijs",
    },
    {
      "name": "Kopi Hitam",
      "price": 8000,
      "image":
          "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcTnpKGdDV8Ypd4soKDskfLQDh6Jvi9xhc3nHMA5eYgZ2-0d2w_13vkvAB9znbKLHgA3xOySNFKdaCcUoWiqGBTPlM28uhxSFBtN2QTx4MlhkgNII2Q",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang, $username ! "),
        backgroundColor: const Color.fromARGB(255, 102, 199, 255),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: const Color.fromARGB(255, 255, 255, 255),
            tooltip: "Logout",
            onPressed: () {
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
          // Banner
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://assets.unileversolutions.com/v1/104190077.png?im=AspectCrop=(380,220);Resize=(380,220)",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Daftar Menu:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Grid Menu
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: menu.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final item = menu[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(
                          item["image"],
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) =>
                              const Icon(Icons.fastfood, size: 50),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item["name"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Rp ${item["price"]}"),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            OrderPage.routeName,
                            arguments: item,
                          );
                        },
                        child: const Text("Pesan"),
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
