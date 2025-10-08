import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tshirt_app/features/home/data/models/shirt_model.dart';
import 'package:tshirt_app/features/home/presentation/cubit/get_shirt_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        BlocBuilder<GetShirtCubit, GetShirtState>(
          builder: (context, state) {
            if (state is GetShirtLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetShirtSuccess) {
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: state.shirts.length,
                  itemBuilder: (context, index) {
                    return ShirtItem(shirtModel: state.shirts[index]);
                  },
                ),
              );
            } else if (state is GetShirtFailure) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}

class ShirtItem extends StatelessWidget {
  const ShirtItem({super.key, required this.shirtModel});
  final ShirtModel shirtModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.41,
          height: 200,

          decoration: BoxDecoration(
            color: Color(0xffF1F4FB),
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: NetworkImage(shirtModel.images[0]),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 155,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          shirtModel.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$${shirtModel.price} USD',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
