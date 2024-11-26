  import 'dart:math';

Stream<String> randomImageStream(List<String> images) async* {
    final random = Random();
    while (true) {
      yield images[random.nextInt(images.length)]; 
      await Future.delayed(const Duration(seconds: 40));
    }
  }