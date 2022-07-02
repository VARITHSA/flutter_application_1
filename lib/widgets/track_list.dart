import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/current_track_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/data.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;
  const TracksList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
      columns: [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time))
      ],
      rows: tracks.map((e) {
        final selected =
            context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textstyle = TextStyle(
            color: selected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).iconTheme.color);
        return DataRow(
          cells: [
            DataCell(
              Text(
                e.title,
                style: textstyle,
              ),
            ),
            DataCell(
              Text(e.artist, style: textstyle),
            ),
            DataCell(
              Text(e.album, style: textstyle),
            ),
            DataCell(
              Text(e.duration, style: textstyle),
            ),
          ],
          selected: selected,
          onSelectChanged: (_) =>
              context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}
