import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.data,
    required this.value,
    required this.onChanged,
  });

  final List<String> data;
  final String? value;

  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      icon: const Icon(Icons.arrow_drop_down),
      style: Theme.of(context).textTheme.bodyMedium,
      underline: Container(
        height: 1,
        color: Theme.of(context).colorScheme.secondary,
      ),
      onChanged: onChanged,
      items:
          data.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
    );
  }
}
