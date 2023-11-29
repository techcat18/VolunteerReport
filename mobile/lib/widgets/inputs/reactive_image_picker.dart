import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/widgets/image_container.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveImagePicker extends ReactiveFormField<dynamic, File?> {
  ReactiveImagePicker({
    super.key,
    Widget? icon,
    Image? placeholder,
    required String name,
    ImageContainerDecoration? decoration,
  }) : super(
          formControlName: name,
          builder: (ReactiveFormFieldState<dynamic, File?> field) {
            var value = field.value;

            return _CustomImagePicker(
              width: decoration?.width,
              height: decoration?.height,
              selectedImage: value,
              onSelect: (image) => field.didChange(image),
              child: ImageContainer(
                icon: value == null ? icon : null,
                image: value == null ? placeholder : Image.file(value),
                decoration: decoration,
              ),
            );
          },
        );

  @override
  ReactiveFormFieldState<dynamic, File?> createState() =>
      ReactiveFormFieldState<dynamic, File?>();
}

class _CustomImagePicker extends StatelessWidget {
  const _CustomImagePicker({
    this.width,
    this.height,
    required this.child,
    required this.onSelect,
    required this.selectedImage,
  });

  final double? width;
  final double? height;
  final Widget child;
  final File? selectedImage;
  final void Function(File?) onSelect;

  void _showImageSourceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery).then(
                    (value) => Navigator.pop(context),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Picture'),
                onTap: () {
                  _pickImage(ImageSource.camera).then(
                    (value) => Navigator.pop(context),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: const Text('Cancel'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        maxWidth: width,
        maxHeight: height,
      );

      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);
      onSelect(imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e.stacktrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showImageSourceOptions(context),
      child: child,
    );
  }
}
