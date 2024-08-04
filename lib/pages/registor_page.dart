import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_path_provider/pages/edit_page.dart';
import 'package:path_provider/path_provider.dart';

class RegitorPage extends StatefulWidget {
  const RegitorPage({super.key});

  @override
  State<RegitorPage> createState() => _RegitorPageState();
}

class _RegitorPageState extends State<RegitorPage> {
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

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();

  Future<void> getImagePSc() async {
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

  Future<void> readPSc() async {
    // isLoading = false;
    setState(() {});
    final directory = await getApplicationDocumentsDirectory();
    await for (var event in directory.list()) {
      if (event.path.contains('image.png')) {
        isImageSelected = true;
      }
    }
    if (isImageSelected) {
      file = File("${directory.path}/image.png");
      // isLoading = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ' Registor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 251, 206, 70),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(290),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                )
              ],
            ),
            Container(
              height: 750,
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
                                      topRight: Radius.circular(20), topLeft: Radius.circular(20)),
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
                      const Text(
                        'Name                                                              ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Your name , e.g : John Doe',
                        ),
                        controller: controllerName,
                      ),
                      const Text(
                        'Email                                                                ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Your name , e.g : John Doe',
                        ),
                        controller: controllerEmail,
                      ),
                      const Text(
                        'Phone Number                                                             ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Your phone number, e.g : +01 112 xxx xxx',
                        ),
                        controller: controllerPhoneNumber,
                      ),
                      const Text(
                        'Confirm Password                                                          ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off),
                          ),
                          hintText: 'Your password, at least 8 character.',
                        ),
                        obscureText: true,
                        controller: controllerPassword,
                      ),
                      const Text(
                        'Confirm Password                                                          ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off),
                          ),
                          hintText: 'Re-type your password',
                        ),
                        obscureText: true,
                        controller: controllerConfirmPassword,
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {
                          User user = User(
                            name: controllerName.text.toString(),
                            email: controllerEmail.text.toString(),
                            phoneNumber: controllerPhoneNumber.text.toString(),
                            password: controllerPassword.text.toString(),
                            confirmPassword: controllerConfirmPassword.text.toString(),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfilePage(),
                              settings: RouteSettings(arguments: user),
                            ),
                          );
                        },
                        minWidth: double.infinity,
                        height: 50,
                        color: Colors.amber,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Sing Up',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  late String name;
  late String email;
  late String phoneNumber;
  late String password;
  late String confirmPassword;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });
}

ImageProvider<Object>? profileImage({File? file}) {
  return file != null ? Image.file(file).image : const AssetImage("assets/images/image.png");
}
