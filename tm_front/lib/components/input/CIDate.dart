import 'package:flutter/material.dart';
import 'package:tm_front/components/CTheme.dart';

class CIDate extends StatefulWidget {
  final TextEditingController? controller;
  const CIDate({super.key, this.controller});

  @override
  _CIDateState createState() => _CIDateState();
}

class _CIDateState extends State<CIDate> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      locale: const Locale('pt', 'BR'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: AppColors.interactiveMainColor,
            colorScheme: ColorScheme.dark(
              primary: AppColors.interactiveSecondColor,
              onPrimary: AppColors.neutralColor,
              surface: AppColors.boxColor,
              onSurface: AppColors.neutralColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller?.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        hintText: 'Selecione sua data',
        hintStyle: AppTexts.hintText,
        filled: true,
        fillColor: AppColors.boxColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 14,
        ),
        prefixIcon:
            Icon(Icons.calendar_today, color: AppColors.interactiveSecondColor),
      ),
      style: AppTexts.bodyMedium.copyWith(
        color: AppColors.neutralColor,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Falta a data de nascimento';
        }
        return null;
      },
    );
  }
}
