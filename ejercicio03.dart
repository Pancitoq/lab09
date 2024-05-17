import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Imágenes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<ImageData> images = [
    ImageData('PNG', 'assets/images/gato.png', ImageType.png),
    ImageData('JPG', 'assets/images/lima.jpg', ImageType.jpeg),
    ImageData('SVG', 'assets/images/trujillo.svg', ImageType.svg),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria'),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ImageItem(images[index]);
        },
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final ImageData imageData;

  ImageItem(this.imageData);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              imageData.name,
              style: TextStyle(
                fontFamily: getFontFamily(imageData.type),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          getImageWidget(imageData),
        ],
      ),
    );
  }

  String getFontFamily(ImageType type) {
    switch (type) {
      case ImageType.png:
        return 'Arial';
      case ImageType.jpeg:
        return 'Times New Roman';
      case ImageType.svg:
        return 'Roboto';
      default:
        return 'Arial';
    }
  }

  Widget getImageWidget(ImageData imageData) {
    switch (imageData.type) {
      case ImageType.png:
      case ImageType.jpeg:
        return Image.asset(imageData.path);
      case ImageType.svg:
        return SvgPicture.asset(imageData.path);
      default:
        return Container();
    }
  }
}

class ImageData {
  final String name;
  final String path;
  final ImageType type;

  ImageData(this.name, this.path, this.type);
}

enum ImageType { png, jpeg, svg }
// se agrego flutter_svg: ^1.0.3 a las dependencias
