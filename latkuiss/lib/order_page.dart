import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  static const String routeName = '/order';
  final Map<String, dynamic> item;

  const OrderPage({super.key, required this.item});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _controller = TextEditingController();
  int jumlah = 0;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final harga = item["price"];
    final total = jumlah * harga;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Order")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(
              item["image"],
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Icon(Icons.fastfood, size: 100),
            ),
            const SizedBox(height: 15),
            Text(
              item["name"],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("Harga: Rp $harga"),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Jumlah",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                setState(() {
                  jumlah = int.tryParse(v) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Submit")),
            const SizedBox(height: 10),
            Text(
              "Total Harga: Rp $total",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
