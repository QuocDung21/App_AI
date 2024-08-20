// disease_screen.dart

import 'package:flutter/material.dart';

class DiseaseInfo {
  final String name;
  final String symptoms;
  final String causes;
  final String prevention;

  DiseaseInfo({
    required this.name,
    required this.symptoms,
    required this.causes,
    required this.prevention,
  });
}

// Dữ liệu mẫu
final diseaseSample = DiseaseInfo(
  name: 'Bệnh đốm nâu',
  symptoms: 'Xuất hiện các đốm nhỏ màu nâu trên lá, có thể có viền vàng quanh đốm.',
  causes: 'Do nấm Bipolaris oryzae gây ra.',
  prevention: 'Sử dụng giống kháng bệnh, bón phân hợp lý và phun thuốc chống nấm.',
);

class DiseaseScreen extends StatelessWidget {
  final DiseaseInfo disease;

  DiseaseScreen({required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Hình ảnh từ Internet
            Image.asset(
              'IMG20201109210615_00.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Tên bệnh:',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              disease.name,
              style: TextStyle(

              ),
            ),
            SizedBox(height: 16),
            Text(
              'Triệu chứng:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              disease.symptoms,
              style: TextStyle(

              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nguyên nhân:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              disease.causes,
              style: TextStyle(

              ),
            ),
            SizedBox(height: 16),
            Text(
              'Cách phòng, chống bệnh:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              disease.prevention,
              style: TextStyle(

              ),
            ),
          ],
        ),
      ),
    );
  }
}
