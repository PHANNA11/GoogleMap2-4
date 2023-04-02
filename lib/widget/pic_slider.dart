import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:image_picker/image_picker.dart';

class PicSlider extends StatefulWidget {
  const PicSlider({Key? key}) : super(key: key);

  @override
  State<PicSlider> createState() => _PicSliderState();
}

class _PicSliderState extends State<PicSlider> {
  List<String> images = [
    'https://imgs.search.brave.com/pWc-gyO50QlsXjimbBkvBZbt-cMzVThkiTn1y3IBB88/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9jZG4u/d2FsbHBhcGVyc2Fm/YXJpLmNvbS83MC84/OC9lUUZKZGcuanBn',
    'https://imgs.search.brave.com/so_anogUo6l9ql-VhV1hJkfekgclOd4DccZXJPWxCrc/rs:fit:1200:900:1/g:ce/aHR0cHM6Ly93YWxs/dXAubmV0L3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE0LzEwL25h/dHVyZS9CZWF1dGlm/dWxfTGFrZV9BbmRf/TW91bnRhaW5fTGFu/ZHNjYXBlLmpwZw',
    'https://imgs.search.brave.com/eqiEHQMd8F_ljeiP4VtGTQE0MrOaifoy8tnNnq3_cow/rs:fit:1200:1200:1/g:ce/aHR0cDovL3dhbGx1/cC5uZXQvd3AtY29u/dGVudC91cGxvYWRz/LzIwMTYvMDIvMjQx/Njc0LWJsdWUtbW91/bnRhaW4tbGFrZS1y/ZWZsZWN0aW9uLWZv/cmVzdC1PcmVnb24u/anBn',
    'https://imgs.search.brave.com/MnQbcQ6pcnSaYaMxc7uwk5oKfU1sWmwrCHxKYE7tsj8/rs:fit:1200:1080:1/g:ce/aHR0cHM6Ly93YWxs/dXAubmV0L3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE2LzAxLzI3/MTgxOS1uYXR1cmUt/bGFuZHNjYXBlLWxh/a2UtbW91bnRhaW4t/c3Vuc2V0LWZhbGwt/Zm9yZXN0LXdhdGVy/LXNreS1jbG91ZHMu/anBn',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image SlideShow')),
      body: ImageSlideshow(
        isLoop: true,
        autoPlayInterval: 3000,
        children: List.generate(
            images.length, (index) => buildImageAdvertising(images[index])),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              openCamera();
            },
            child: const Icon(Icons.camera_alt_sharp),
          ),
          FloatingActionButton(
            onPressed: () {
              openGallary();
            },
            child: const Icon(Icons.image),
          )
        ],
      ),
    );
  }
  void openCamera() async {
     await ImagePicker().pickImage(source: ImageSource.camera);
  }
  void openGallary() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Widget buildImageAdvertising(String urlImage) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(urlImage),
      ),
    );
  }
}
