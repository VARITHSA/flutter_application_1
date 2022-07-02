import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/current_track_model.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _TrackInfo(),
            Spacer(),
            _PlayerControls(),
            Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls()
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.grey[300],
                    fontSize: 12.0,
                  ),
            )
          ],
        ),
        const SizedBox(width: 12.0),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        )
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shuffle_rounded),
              padding: const EdgeInsets.only(),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_previous_outlined),
              padding: const EdgeInsets.only(),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_outlined),
              padding: const EdgeInsets.only(),
              iconSize: 34.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.repeat_rounded),
              padding: const EdgeInsets.only(),
              iconSize: 20,
            ),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              width: 8.0,
            ),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (() {}),
          icon: Icon(Icons.devices_outlined),
          iconSize: 20.0,
        ),
        Row(
          children: [
            IconButton(
              onPressed: (() {}),
              icon: Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            )
          ],
        ),
        IconButton(
          onPressed: (() {}),
          icon: Icon(Icons.fullscreen_outlined),
        ),
      ],
    );
  }
}
