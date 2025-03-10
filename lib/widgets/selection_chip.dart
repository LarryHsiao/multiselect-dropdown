import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

/// [SelectionChip] is a selected option chip builder.
/// It is used to build the selected option chip.
class SelectionChip extends StatelessWidget {
  final ChipConfig chipConfig;
  final Function(ValueItem) onItemDelete;
  final ValueItem item;
  final Widget Function(ValueItem)? chipLabelBuilder;

  const SelectionChip({
    Key? key,
    required this.chipConfig,
    required this.item,
    required this.onItemDelete,
    this.chipLabelBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: chipConfig.padding,
      label: chipLabelBuilder?.call(item) ?? Text(item.label),
      shape: RoundedRectangleBorder(
        side: chipConfig.borderSide,
        borderRadius: BorderRadius.circular(chipConfig.radius),
      ),
      deleteIcon: chipConfig.deleteIcon,
      deleteIconColor: chipConfig.deleteIconColor,
      labelPadding: chipConfig.labelPadding,
      backgroundColor:
          chipConfig.backgroundColor ?? Theme.of(context).primaryColor,
      labelStyle: chipConfig.labelStyle ??
          TextStyle(color: chipConfig.labelColor, fontSize: 14),
      onDeleted: () => onItemDelete(item),
    );
  }
}
