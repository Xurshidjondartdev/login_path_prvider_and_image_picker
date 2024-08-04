import 'package:flutter/material.dart';
import 'package:learn_path_provider/pages/profile_page.dart';
import 'package:learn_path_provider/pages/registor_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '  Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 247,
                height: 290,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 251, 206, 70),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 550,
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
                      'Email                                                          ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your Email',
                      ),
                      controller: controllerEmail,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Password                                                   ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_off),
                        ),
                        hintText: 'Enter your Password',
                      ),
                      obscureText: true,
                      controller: controllerPassword,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                          child: const Icon(Icons.done),
                        ),
                        const Text(' stay logged in?'),
                        const SizedBox(width: 100),
                        GestureDetector(
                          onTap: () {},
                          child: const Text('Forgot password?'),
                        )
                      ],
                    ),
                    const SizedBox(height: 50),
                    MaterialButton(
                      onPressed: () {
                        if (controllerEmail.text == user.email.toString() &&
                            controllerPassword.text == user.password.toString()) {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) => const ProfilePage()), (route) => false);
                        }
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
                        'Login',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account yet?  Register  ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'here',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width: 110,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text('Or login with'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 1,
                          width: 110,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 240, 235, 235),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mail,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 240, 235, 235),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
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
