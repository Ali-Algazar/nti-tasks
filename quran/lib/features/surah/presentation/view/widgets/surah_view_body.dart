import 'package:flutter/material.dart';
import 'package:quran/features/home/data/models/surah_model.dart';

class SurahViewBody extends StatelessWidget {
  const SurahViewBody({super.key, required this.surah});
  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: surah.ayahs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(
                      "${surah.ayahs[index].numberInSurah}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    surah.ayahs[index].text,
                    textAlign: TextAlign.right,
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
