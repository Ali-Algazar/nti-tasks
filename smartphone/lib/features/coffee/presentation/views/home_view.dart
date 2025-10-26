import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartphone/features/home/domain/entities/product_entity.dart';
import 'package:smartphone/features/people/data/models/user_model.dart';
import 'package:smartphone/features/people/domain/entities/user_entity.dart';

class CoffeeView extends StatelessWidget {
  const CoffeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CoffeeBody());
  }
}

class CoffeeBody extends StatefulWidget {
  const CoffeeBody({super.key});

  @override
  State<CoffeeBody> createState() => _CoffeeBodyState();
}

class _CoffeeBodyState extends State<CoffeeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<String>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey.shade200],
                          ),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            getData();
                          });
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getData() async {
    Dio dio = Dio();
    var respons = await dio.get('https://coffee.alexflipnote.dev/random.json');
    return respons.data['file'];
  }
}

class SmartPhoneItem extends StatelessWidget {
  const SmartPhoneItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: AspectRatio(
            aspectRatio: 173 / 231,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey.shade200],
                ),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(product.images[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          product.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Text(
          '\$${product.price}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
