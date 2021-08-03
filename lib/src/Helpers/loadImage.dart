import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';


Future<Image> loadImage(String path) async {
  final ByteData data = await rootBundle.load(path);
  final Uint8List list = Uint8List.view(data.buffer);
  final Completer<Image> completer = Completer();
  decodeImageFromList(list, completer.complete);
  return completer.future;
}