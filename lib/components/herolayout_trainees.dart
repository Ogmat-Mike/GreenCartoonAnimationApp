import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:green_cartoon_animation_app/models/trainees_resources.dart';

class HerolayoutTrainees extends StatelessWidget {
  const HerolayoutTrainees({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Provider(
        create: (_) => TraineesResources(),
        child: Consumer<TraineesResources>(
          builder: (context, value, child) {
            final traineeData = value.getAllTraineeData();

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, // Important so it works in SliverToBoxAdapter
              itemCount: traineeData.length,
              itemBuilder: (context, index) {
                final traineeName = traineeData.keys.elementAt(index);
                final data = traineeData[traineeName]!;
                final description = data.first;
                final images = data.skip(1).toList();

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trainee Name
                      Text(
                        traineeName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Description
                      Text(
                        description,
                        style: const TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 8),

                      // Horizontal Scrollable Image Row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: images.map((imgPath) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  imgPath,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
