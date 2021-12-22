import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mock_img_recognition/data/model/data_model.dart';
import 'package:collection/collection.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key, this.diseaseName, this.data}) : super(key: key);
  final String? diseaseName;
  final Data? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diseaseName.toString()),
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Text('Cause : '),
                  Text(data!.cause!.toString()),
                ],
              ),
            ),
            Divider(thickness: 2),
            ListTile(
              title: Row(
                children: [
                  Text('Scientific Name : '),
                  Text(data!.bacteria!.toString()),
                ],
              ),
            ),
            Divider(thickness: 2),
            ListTile(
              title: Row(
                children: [
                  Text('Symptoms : '),
                  Flexible(
                    child: Text(
                      data!.symptoms!.toString(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            ListTile(
              title: Row(
                children: [
                  Text('Origin : '),
                  Flexible(
                    child: Text(
                      data!.origin!.toString(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            ListTile(
              title: Row(
                children: [
                  Text('Trigger : '),
                  Flexible(
                    child: Text(
                      data!.trigger!.toString(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            ListTile(
              title: Row(
                children: [
                  Text('Solution : '),
                  Flexible(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text("Organic : "),
                          title: Text(
                            data!.solution!.organic!,
                          ),
                        ),
                        Divider(thickness: 2),
                        ListTile(
                          leading: Text("Chemical : "),
                          title: Text(
                            data!.solution!.chemical!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            ListTile(
              title: Row(
                children: [
                  Text('Defensive    \nSteps : '),
                  Expanded(
                    child: Column(
                      children: [
                        ...data!.defensiveStep!
                            .mapIndexed((ind, e) => Text('${ind + 1} - $e\n'))
                            .toList(),
                      ],
                    ),
                  ),
                  //  Flexible(
                  //     child: Text(data!.defensiveStep!.single),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
