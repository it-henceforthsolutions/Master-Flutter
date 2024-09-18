
/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

/*=================================================================== Image Pick Using camera ===================================================*/

import '../../export.dart';

Future<PickedFile?> imageFromCamera() async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 100);
  if (pickedFile == null) {
    showToast(message: 'file not selected');
  } else {
    return cropImage(pickedFile.path);
  }
  return null;
}
/*=================================================================== File picker with pdf===================================================*/
Future<PickedFile?> pickFiles() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['.pdf','.doc'],
    allowMultiple: false,
  );
  if (result != null) {
    File? file = File(result.files.single.path!);
    return PickedFile(file.path);
  } else {
    toast(strNoFileSelected);
  }
  return null;
}

/*=================================================================== File picker with images ===================================================*/
Future<PickedFile?> pickImageFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['.png','.jpg'],
    allowMultiple: false,
  );
  if (result != null) {
    File? file = File(result.files.single.path!);
    return PickedFile(file.path);
  } else {
    toast( strNoImageClicked);
  }
  return null;
}


/*=================================================================== Image Pick Using Gallery ===================================================*/

Future<PickedFile?> imageFromGallery() async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 100);
  if (pickedFile == null) {
    showToast(message: 'File not selected');
  } else {
    return cropImage(pickedFile.path);
  }
  return null;
}

Future<PickedFile?> cropImage(filePath) async {
  var croppedImage = await ImageCropper().cropImage(
    sourcePath: filePath,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    aspectRatioPresets: [CropAspectRatioPreset.original],
  );
  if (croppedImage == null) {
    showToast(message: 'No image');
  } else {
    return PickedFile(croppedImage.path);
  }
  return null;
}
