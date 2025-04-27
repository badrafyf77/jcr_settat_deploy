import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/styles.dart';
import 'package:jcr_settat/features/events/presentation/manager/get%20events%20cubit/get_events_cubit.dart';

class ErrorAndRetry extends StatelessWidget {
  const ErrorAndRetry({
    super.key,
    required this.err,
  });

  final String err;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            BlocProvider.of<GetEventsCubit>(context).getEvents();
          },
          icon: const Icon(
            Icons.restore,
            size: 50,
            color: AppColors.kPrimaryColor,
          ),
        ),
        AutoSizeText(
          err,
          style: Styles.normal28,
        ),
      ],
    );
  }
}
