import 'package:flutter/material.dart';
import 'package:quran/features/home/data/models/surah_model.dart';
import 'widgets/surah_view_body.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key, required this.surah});
  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          surah.name,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SurahViewBody(surah: surah),
    );
  }
}
