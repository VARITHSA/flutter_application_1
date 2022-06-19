

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}
