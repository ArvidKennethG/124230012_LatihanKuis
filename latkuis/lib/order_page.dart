import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const OrderPage({super.key, required this.item});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _jumlahController = TextEditingController();
  int totalHarga = 0;

  void _hitungTotal() {
    int jumlah = int.tryParse(_jumlahController.text) ?? 0;
    setState(() {
      totalHarga = jumlah * (widget.item["price"] as int);
    });
  }

  @override
  void dispose() {
    _jumlahController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String name = widget.item["name"] as String;
    final int price = widget.item["price"] as int;
    final String image = widget.item["image"] as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Detail Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(image, height: 150, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("Harga: Rp $price"),
            const SizedBox(height: 20),
            TextField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Jumlah Pesanan",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _hitungTotal(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungTotal,
              child: const Text("Submit"),
            ),
            const SizedBox(height: 20),
            Text(
              "Total Harga: Rp $totalHarga",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
