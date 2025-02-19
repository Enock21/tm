import 'package:flutter/material.dart';
import 'package:tm_front/widgets/WTheme.dart';

class WIDate extends StatefulWidget {
  final TextEditingController? controller;
  const WIDate({super.key, this.controller});

  @override
  _WIDateState createState() => _WIDateState();
}

class _WIDateState extends State<WIDate> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: AppColors.interactiveMainColor,
            colorScheme: ColorScheme.dark(
              primary: AppColors.interactiveMainColor,
              onPrimary: Colors.white,
              surface: AppColors.boxColor,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: AppColors.backgroundColor,
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
        prefixIcon: Icon(Icons.calendar_today, color: AppColors.interactiveMainColor),
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
