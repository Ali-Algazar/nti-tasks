import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartphone/features/home/domain/entities/product_entity.dart';
import 'package:smartphone/features/people/data/models/user_model.dart';
import 'package:smartphone/features/people/domain/entities/user_entity.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<UserEntity>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  snapshot.data![index].picture ?? '',
                                ),
                              ),
                              title: Text(
                                ' ${snapshot.data![index].firstName} ${snapshot.data![index].lastName} ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: Text(
                                '${snapshot.data![index].email} ,'
                                '${snapshot.data![index].phone} '
                                ' ${snapshot.data![index].age} - ${snapshot.data![index].country}',
                              ),
                            ),
                          ),
                        ),
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

  Future<List<UserEntity>> getData() async {
    Dio dio = Dio();
    var respons = await dio.get('https://randomuser.me/api/?results=5');
    return (respons.data['results'] as List)
        .map((e) => UserEntity.fromJson(e))
        .toList();
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
