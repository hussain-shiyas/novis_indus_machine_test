import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/ui/home_screen/presentation/homeScreen.dart';
import 'package:novis_machine_test/ui/login_screen/presentation/widget/title_text_field.dart';
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
    return Consumer(
      builder: (context, ref, child) {
        final loginState = ref.watch(loginPageNotifierProvider);
        
        ref.listen(loginPageNotifierProvider, (previous, next) {
          next.maybeWhen(
            success: (data) {
              if(data.status ?? false){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );}else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(data.message ?? "")),
                );
              }
            },
            failure: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            },
            orElse: () {},
          );
        });

        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: InkWell(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Column(
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
                          controller: emailController,
                          hintText: "Enter your email",
                          title: "Email",
                        ),
                        const SizedBox(height: 20,),
                        TitleTextField(
                          controller: passwordController,
                          hintText: "Enter your Password",
                          title: "Password",
                          passwordMode: true,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            ref.read(loginPageNotifierProvider.notifier).getLoginResData(
                                emailController.text, passwordController.text);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff006837),
                            ),
                            child: Center(
                              child: loginState.maybeWhen(
                                loading: () => const CircularProgressIndicator(color: Colors.white),
                                orElse: () => const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // const Expanded(child: SizedBox()),
                        const Spacer(),
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
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      }
    );
  }
}


