import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://cdn.builder.io/api/v1/image/assets/TEMP/ca687cf24977eba006d41791d5142f07bcbee050fb4b081aabd348b174519261?placeholderIfAbsent=true&apiKey=548dc40bf0764bb5a9f5dae06d7d160d',
          width: 53,
          height: 44,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Recuperação de',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Senha',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}