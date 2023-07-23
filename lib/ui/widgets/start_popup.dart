import 'package:flutter/material.dart';

import 'package:essumin_mix/data/data_loader.dart';
import 'package:essumin_mix/data/option.dart';

class StartPopup extends StatelessWidget {
  const StartPopup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataLoader().loadDataFromJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar los datos'));
        } else {
          final Map<String, List<Option>>? data = snapshot.data;
          final Map<String, List<Option>> optionsMap = data ?? {};

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Colors.white),
            ),
            child: Container(
              color: const Color(0XFF0d1117),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Seleccione',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    children: optionsMap.keys.map((category) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/option', arguments: {
                              'category': category,
                              'options': optionsMap[category],
                            });
                          },
                          child: Text(
                              '${category[0].toUpperCase()}${category.substring(1)}'),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
