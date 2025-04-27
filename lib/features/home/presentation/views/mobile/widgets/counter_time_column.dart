import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class MobileCounterTimeColumn extends StatefulWidget {
  const MobileCounterTimeColumn({
    super.key,
    required this.event,
    this.justCounter = false,
  });

  final Event event;
  final bool justCounter;

  @override
  State<MobileCounterTimeColumn> createState() =>
      _MobileCounterTimeColumnState();
}

class _MobileCounterTimeColumnState extends State<MobileCounterTimeColumn> {
  Timer? _timer;
  late DateTime date;
  Duration _duration = const Duration();

  @override
  void initState() {
    super.initState();
    date = widget.event.date.toDate();
    DateTime now = DateTime.now();
    if (date.isAfter(now)) {
      _duration = date.difference(DateTime.now());
    }
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _duration = _duration - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String days = twoDigits(duration.inDays);
    String hours = twoDigits(duration.inHours.remainder(24));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$days:$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Commence dans :',
          style: Styles.normal8.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .52,
          child: AutoSizeText(
            _formatDuration(_duration),
            style: Styles.normal18.copyWith(
              color: Colors.black,
              fontFamily: GoogleFonts.aboreto().fontFamily,
            ),
          ),
        ),
        if (!widget.justCounter)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: const Divider(
                  color: Colors.white,
                  thickness: .5,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.place,
                    color: Colors.black,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      widget.event.place,
                      style: Styles.normal8.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
