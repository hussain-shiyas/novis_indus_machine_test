import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/ui/login_screen/presentation/provider/login_page_notifier_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height/3.8,
            child: Stack(children: [
              Image.asset("assets/login_image.png",fit: BoxFit.fill,),
              Center(child: Image.asset("assets/app_icon.png",width: 60,))
            ],),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("Login Or Register To Book Your Appointments",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 20,
                  ),
                  TitleTextField(
                    emailController: emailController,
                    hintText: "Enter your email",
                    title: "Email",
                  ),
                  const SizedBox(height: 20,),
                  TitleTextField(
                    emailController: passwordController,
                    hintText: "Enter your Password",
                    title: "Password",
                    passwordMode: true,
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff006837)
                        // color: const Color(0xff006837)
                    ),
                    child: const Center(child: Text("Login",style: TextStyle(
                      fontSize:17,
                      color: Colors.white,
                    ),)),
                  ),
                  const Expanded(child: SizedBox()),
                  RichText(
                    text: const TextSpan(
                      text: "By creating or logging into an account you are agreeing with our ",
                      style: TextStyle(color: Colors.black, fontSize: 14), // Default style
                      children: [
                        TextSpan(
                          text: "Terms and Conditions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: ".",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.emailController,
    this.hintText = "",
    required this.title,
    this.passwordMode = false,
  });

  final TextEditingController emailController;
  final String hintText;
  final String title;
  final bool passwordMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: const Color(0xff000000).withOpacity(.25)),
            filled: true,
            fillColor: const Color(0xff000000).withOpacity(.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: const Color(0xff000000).withOpacity(.1), width:2),
              // borderSide: BorderSide(color: Color(0xff000000).withOpacity(.1), width:2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          ),
          keyboardType: TextInputType.emailAddress,
          obscureText: passwordMode,
        ),
      ],
    );
  }
}
