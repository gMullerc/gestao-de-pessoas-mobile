import 'dart:convert';
import 'dart:typed_data';

class ImageDecode {
  ImageDecode();
  static Uint8List imageConvert(String image) {
    return base64Decode(image);
  }
}
