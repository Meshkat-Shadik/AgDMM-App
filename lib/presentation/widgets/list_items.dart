import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_img_recognition/data/model/data_model.dart';
import 'package:mock_img_recognition/data/temp_data.dart';
import 'package:mock_img_recognition/presentation/screens/info_screen.dart';

class AllData extends StatelessWidget {
  AllData({Key? key, required this.genre}) : super(key: key);
  final String genre;

  List<String> riceDiseases = [
    'Bacterial Blight of Rice',
    'Rice Blast',
    'Rice Brown Spot',
    'Tungro of Rice',
    'Leaf Scald of Rice',
    'Sheath Brown Rot of Rice'
  ];

  List<String> maizeDiseases = [
    'Northern Blight of Maize',
    'Common Rust of Maize',
    'Gray Leaf Spot of Maize',
  ];
  List<String> juteDiseases = [
    'Anthracnose of Jute',
    'Black Band of Jute',
    'Leaf Mosaic of Jute',
    'Mealybugs of Jute',
    'Powdery Mildew of Jute',
  ];

  List<String> soybeanDiseases = [
    'Alfalfa mosaic of Soybean',
    'Bacterial Blight of Soybean',
    'Brown Stem Rot of Soybean',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      /*0 Healthy Leaf of Rice
1 Bacterial Blight of Rice
2 Rice Blast
3 Rice Brown Spot
4 Tungro of Rice
5 Leaf Scald of Rice
6 Sheath Brown Rot of Rice
*/
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Learn about ${genre.toLowerCase()} diseases',
            style: GoogleFonts.breeSerif(
              fontSize: 18,
            ),
          ),
          Divider(thickness: 2),
          const SizedBox(height: 10),
          if (genre == 'Rice')
            for (int i = 0; i < riceDiseases.length; i++)
              Column(
                children: [
                  InfoButton(
                    diseaseName: riceDiseases[i],
                    data: riceData[i],
                    genre: genre,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
          if (genre == 'Maize')
            for (int i = 0; i < maizeDiseases.length; i++)
              Column(
                children: [
                  InfoButton(
                    diseaseName: maizeDiseases[i],
                    data: maizeData[i],
                    genre: genre,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
          if (genre == 'Jute')
            for (int i = 0; i < juteDiseases.length; i++)
              Column(
                children: [
                  InfoButton(
                    diseaseName: juteDiseases[i],
                    data: juteData[i],
                    genre: genre,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
          if (genre == 'Soybean')
            for (int i = 0; i < soybeanDiseases.length; i++)
              Column(
                children: [
                  InfoButton(
                    diseaseName: soybeanDiseases[i],
                    data: soybeanData[i],
                    genre: genre,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
          // InfoButton(
          //   riceDiseaseName: 'Bacterial Blight of Rice',
          //   data: riceData[0],
          //   genre: genre,
          // ),
          // const SizedBox(height: 10),
          // InfoButton(
          //     riceDiseaseName: 'Rice Blast', data: riceData[1], genre: 'Rice'),
          // const SizedBox(height: 10),
          // InfoButton(
          //   riceDiseaseName: 'Rice Brown Spot',
          //   data: riceData[2],
          //   genre: genre,
          // ),
          // const SizedBox(height: 10),
          // InfoButton(
          //   riceDiseaseName: 'Tungro of Rice',
          //   data: riceData[3],
          //   genre: genre,
          // ),
          // const SizedBox(height: 10),
          // InfoButton(
          //   riceDiseaseName: 'Leaf Scald of Rice',
          //   data: riceData[4],
          //   genre: genre,
          // ),
          // const SizedBox(height: 10),
          // InfoButton(
          //   riceDiseaseName: 'Sheath Brown Rot of Rice',
          //   data: riceData[5],
          //   genre: genre,
          // ),
        ],
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
    required this.data,
    required this.diseaseName,
    required this.genre,
  }) : super(key: key);

  final String diseaseName;
  final Data data;
  final String genre;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoScreen(
              diseaseName: diseaseName,
              data: data,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(diseaseName),
      ),
    );
  }
}
