import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_path_provider/pages/registor_page.dart';
import 'package:path_provider/path_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? file;
  bool isImageSelected = false;
  bool isCamera = false;

  Future<void> getImage() async {
    isImageSelected = false;
    final ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (xFile != null) {
      file = File(xFile.path);
      final directory = await getApplicationDocumentsDirectory();
      await file!.copy("${directory.path}/image.png");
      isImageSelected = true;
      setState(() {});
    }
  }

  Future<void> read() async {
    setState(() {});
    final directory = await getApplicationDocumentsDirectory();
    await for (var event in directory.list()) {
      if (event.path.contains('image.png')) {
        isImageSelected = true;
      }
    }
    if (isImageSelected) {
      file = File("${directory.path}/image.png");
      setState(() {});
    }
  }

  @override
  void initState() {
    read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // User? user = ModalRoute.of(context)?.settings.arguments as User;

    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerEmailID = TextEditingController();
    TextEditingController controllerPhoneNomber = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFF8D76),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {},
            ),
            const Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.share),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: const Color(0xffFF8D76),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            minWidth: 200,
            height: 50,
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 120,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () async {
                            isCamera = false;
                            await getImage();
                          },
                          child: const Text("Gallery"),
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () async {
                            isCamera = true;
                            await getImage();
                          },
                          child: const Text("Camera"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.transparent,
              backgroundImage: profileImage(file: file),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Change Picture'),
          ),
          Container(
            height: 535,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 439,
                width: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'UserName',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: controllerName,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        labelText: 'username',
                      ),
                    ),
                    const Text(
                      'Email I`D',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: controllerEmailID,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        labelText: 'email',
                      ),
                    ),
                    const Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: controllerPhoneNomber,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        labelText: 'phone',
                      ),
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: controllerPassword,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        labelText: 'passwords',
                      ),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: double.infinity,
                      height: 50,
                      color: const Color(0xff171F1D),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Update ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
