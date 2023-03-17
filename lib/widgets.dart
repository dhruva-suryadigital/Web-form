import 'package:flutter/material.dart';

import 'models/form_data.dart';

class GenderTile extends StatefulWidget {
  final Gender? groupValue;
  final Gender value;
  final Function(Object?) onChange;

  const GenderTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChange,
  }) : super(key: key);

  @override
  State<GenderTile> createState() => _GenderTileState();
}

class _GenderTileState extends State<GenderTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          Radio(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChange,
          ),
          Text(widget.value.name),
        ],
      ),
    );
  }
}
