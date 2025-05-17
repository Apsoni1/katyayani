import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/feature/product_detail/presentation/bloc/product_item_detail_bloc.dart';

class SpiceSelector extends StatelessWidget {
  const SpiceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(AppLocalizations.of(context).spicy, style: AppTextStyles.spicy),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<ProductItemDetailBloc, ProductItemDetailState>(
          builder: (BuildContext context, ProductItemDetailState state) {
            if (state is ProductItemDetailLoaded) {
              return SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.buttonBg,
                  inactiveTrackColor: AppColors.sliderTrack,
                  trackHeight: 3.0,
                  thumbColor: AppColors.buttonBg,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 7.0),
                ),
                child: Slider(
                  padding: EdgeInsets.zero,
                  value: state.sliderValue,
                  onChanged: (double value) {
                    context
                        .read<ProductItemDetailBloc>()
                        .add(SliderValueChanged(value));
                  },
                  max: 5,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).mild,
              style: AppTextStyles.mild,
            ),
            Text(
              AppLocalizations.of(context).hot,
              style: AppTextStyles.hot,
            ),
          ],
        ),
      ],
    );
  }
}
