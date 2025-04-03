import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tm_front/utils/u_theme.dart';

class CSearchCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;
  final String searchedIconAsset;

  const CSearchCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.searchedIconAsset,
  }) : super(key: key);
  
  @override
  _CSearchCheckboxState createState() => _CSearchCheckboxState();
}

class _CSearchCheckboxState extends State<CSearchCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  void _handleCheckboxChange(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: _isChecked,
            onChanged: _handleCheckboxChange,
            activeColor: AppColors.nonInteractiveGreen,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 40,
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/oi--magnifying-glass.svg',
                width: 40,
                height: 40,
              ),
              SvgPicture.asset(
                widget.searchedIconAsset,
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            widget.title,
            style: AppTexts.headlineMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
