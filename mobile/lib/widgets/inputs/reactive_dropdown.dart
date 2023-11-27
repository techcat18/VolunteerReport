import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

const _dropDownItemHeight = 41.0;

class ReactiveDropdown extends StatefulWidget {
  const ReactiveDropdown({
    super.key,
    required this.name,
    required this.label,
    required this.items,
  });

  final String name;
  final String label;
  final List<String> items;

  @override
  State<ReactiveDropdown> createState() => _ReactiveDropdownState();
}

class _ReactiveDropdownState extends State<ReactiveDropdown> {
  Size? _offsetSize;
  final _focusNode = FocusNode();
  final _layerLink = LayerLink();
  final OverlayPortalController _dropdownController = OverlayPortalController();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _offsetSize ??= context.size!;
        _dropdownController.show();
      } else {
        _dropdownController.hide();
      }
    });
  }

  Widget _buildOverlayChild(BuildContext context) {
    return Positioned(
      width: _offsetSize!.width,
      child: CompositedTransformFollower(
        link: _layerLink,
        showWhenUnlinked: false,
        offset: Offset(0.0, _offsetSize!.height + 5.0),
        child: _buildDropDown(),
      ),
    );
  }

  Widget _buildDropDown() {
    return Material(
      elevation: 4.0,
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: ReactiveValueListenableBuilder(
        formControlName: widget.name,
        builder: (context, control, child) {
          var currentValue = (control.value ?? "") as String;
          var filteredItems = widget.items
              .where(
                (item) => item.contains(currentValue),
              )
              .toList();
          var count = filteredItems.length;

          return SizedBox(
            height: min(3 * _dropDownItemHeight, count * _dropDownItemHeight),
            child: ListView(
              padding: EdgeInsets.zero,
              children: filteredItems
                  .map((e) => _buildDropDownItem(control, e))
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropDownItem(AbstractControl<Object?> control, String item) {
    return InkWell(
      onTap: () {
        control.updateValue(item);
        _focusNode.unfocus();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Text(
          item,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }

  Widget _buildReactiveTextField() {
    return ReactiveTextField(
      focusNode: _focusNode,
      formControlName: widget.name,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
      style: Theme.of(context).textTheme.labelMedium,
      validationMessages: {
        ValidationMessage.required: (error) => "This is a required field!",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: OverlayPortal(
        controller: _dropdownController,
        overlayChildBuilder: _buildOverlayChild,
        child: _buildReactiveTextField(),
      ),
    );
  }
}
