import 'package:flutter/material.dart';

import 'package:perfection_webapp/core/theme/styles.dart';

class CustomTextField extends StatelessWidget {
  final String intialValue;

  const CustomTextField({
    super.key,
    required this.intialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: TextEditingController(text: intialValue),
        readOnly: true,
        style: Styles.font16RegularLightGrey,
        decoration: InputDecoration(
          border: buildEnabledBorder(context),
          enabledBorder: buildEnabledBorder(context),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ));
  }

  OutlineInputBorder buildEnabledBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.shadow,
        width: 1.3,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }
}
