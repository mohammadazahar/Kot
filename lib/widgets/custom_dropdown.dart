import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.items,
    this.onChanged,
  });
  final String hint;
  final List<String> items;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  var value;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        isExpanded: true,
        isDense: false,
        hint: Text(widget.hint),
        style: Theme.of(context).textTheme.bodyLarge,
        underline: const SizedBox(),
        value: value,
        borderRadius: BorderRadius.circular(8),
        items: [
          for (var item in widget.items)
            DropdownMenuItem(
              value: item,
              child: Text(item),
            ),
        ],
        onChanged: (_) {
          setState(() {
            value = _ ?? ''.toString();
          });
          widget.onChanged?.call(value.toString());
        },
      ),
    );
  }
}
