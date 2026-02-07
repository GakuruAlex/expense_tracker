import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
    required this.onCategoryChange,
  });

  final void Function(Category category) onCategoryChange;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Category>(
      width: 240,
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(darkPrimaryColor),
        surfaceTintColor: WidgetStatePropertyAll(
          onPrimaryTextColor,
        ),
      ),
      trailingIcon: Icon(
        Icons.arrow_drop_down_circle_outlined,
        color: onPrimaryTextColor,
        size: 32,
      ),
      textStyle: GoogleFonts.oswald(
        fontStyle: FontStyle.italic,
        color: onPrimaryTextColor,
        fontSize: 18,
      ),
      label: Text(
        "Category",
        style: GoogleFonts.oswald(color: onPrimaryTextColor),
      ),
      hintText: "Select a Category",
      onSelected: (value) {
        onCategoryChange(value!);
      },
      dropdownMenuEntries: Category.values.map((category) {
        return DropdownMenuEntry(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(
              onPrimaryTextColor,
            ),
            textStyle: WidgetStatePropertyAll(
              GoogleFonts.oswald(fontSize: 18),
            ),
            backgroundColor: WidgetStateColor.resolveWith(
              (states) {
                if (states.contains(WidgetState.hovered)) {
                  return onPrimaryTextColor;
                }
                if (states.contains(WidgetState.focused)) {
                  return accentColor;
                }
                if (states.contains(WidgetState.selected)) {
                  return lightPrimaryColor;
                }
                return Colors.transparent;
              },
            ),
            overlayColor: WidgetStatePropertyAll(
              onPrimaryTextColor,
            ),
          ),

          value: category,
          label: category.name.toUpperCase(),
        );
      }).toList(),
    );
  }
}
