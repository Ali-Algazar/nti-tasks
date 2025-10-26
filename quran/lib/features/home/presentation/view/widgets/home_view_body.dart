import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/home/data/models/surah_model.dart';
import 'package:quran/features/home/presentation/cubit/get_surah_cubit.dart';
import 'package:quran/features/surah/presentation/view/surah_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16),

            width: double.infinity,
            margin: EdgeInsets.all(16),

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'فهرس السور',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                BlocBuilder<GetSurahCubit, GetSurahState>(
                  builder: (context, state) {
                    if (state is GetSurahLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is GetSurahSuccess) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.surahs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SurahView(surah: state.surahs[index]),
                                  ),
                                );
                              },
                              child: surahItem(surahModel: state.surahs[index]),
                            ),
                          );
                        },
                      );
                    } else if (state is GetSurahError) {
                      return Center(child: Text(state.message));
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: BlocBuilder<GetSurahCubit, GetSurahState>(
          //     builder: (context, state) {
          //       if (state is GetSurahLoading) {
          //         return const Center(child: CircularProgressIndicator());
          //       } else if (state is GetSurahSuccess) {
          //         return ListView.builder(
          //           itemCount: state.surahs.length,
          //           itemBuilder: (context, index) {
          //             return InkWell(
          //               onTap: () {
          //                 Navigator.of(context).push(
          //                   MaterialPageRoute(
          //                     builder: (context) =>
          //                         SurahView(surah: state.surahs[index]),
          //                   ),
          //                 );
          //               },
          //               child: ListTile(
          //                 leading: Text(state.surahs[index].number.toString()),
          //                 title: Text(state.surahs[index].name),
          //               ),
          //             );
          //           },
          //         );
          //       } else if (state is GetSurahError) {
          //         return Center(child: Text(state.message));
          //       }
          //       return SizedBox();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class surahItem extends StatelessWidget {
  const surahItem({super.key, required this.surahModel});
  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.teal, width: 1),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
          radius: 17,
          child: Text(
            surahModel.number.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        title: Text(
          surahModel.name,
          style: TextStyle(
            color: Colors.teal,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          ' ${surahModel.ayahs.length} آيه',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
