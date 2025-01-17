import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_appp_1_0/routes/routes.dart';

File? image;
String name = "";
String email = "";

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  ImagePicker picker = ImagePicker();
  Future<void> pickImage({required ImageSource source}) async {
    XFile? xFile = await picker.pickImage(
      source: source,
    );
    if (xFile != null) {
      image = File(xFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff5f7fa),
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(75.w, 10),
                  child: Container(
                    height: 250.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/car.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Gujarat CAR Hub",
                  style: GoogleFonts.oswald(
                    fontSize: 38.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Gujarat's roads, your style, our guide",
                  style: GoogleFonts.lora(
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          AvatarGlow(
                            glowColor: Colors.pinkAccent,
                            glowRadiusFactor: 0.2,
                            child: CircleAvatar(
                              radius: 60.w,
                              backgroundImage: (image != null)
                                  ? FileImage(image!)
                                  : const NetworkImage(
                                          "https://tse2.mm.bing.net/th?id=OIP.tXKGs73UYjBEZSclUWLSMAHaHa&pid=Api&P=0&h=180")
                                      as ImageProvider,
                            ),
                          ),
                          FloatingActionButton.small(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Pick Image"),
                                  titleTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                  ),
                                  backgroundColor: Colors.white,
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton.icon(
                                        // style: ButtonStyle(
                                        //   backgroundColor:
                                        //       WidgetStateProperty.all(Color(0xff22262b)),
                                        // ),
                                        onPressed: () {
                                          pickImage(source: ImageSource.camera);
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                        label: const Text(
                                          "Camera",
                                          style: TextStyle(
                                            color: Color(0xff22262b),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        // style: ButtonStyle(
                                        //   backgroundColor:
                                        //       WidgetStateProperty.all(Color(0xff22262b)),
                                        // ),
                                        onPressed: () {
                                          pickImage(
                                              source: ImageSource.gallery);

                                          Navigator.pop(context);
                                        },
                                        label: const Text(
                                          "Gallary",
                                          style: TextStyle(
                                            color: Color(0xff22262b),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            splashColor: Colors.white,
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      SizedBox(
                        width: 350.w,
                        child: TextFormField(
                          validator: (val) =>
                              (val!.isEmpty) ? "Enter your email..." : null,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.black,
                          textInputAction: TextInputAction.next,
                          cursorWidth: 2,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.black,
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Colors.black45,
                            ),
                            labelText: "Email",
                            hintText: "Enter your email",
                            labelStyle: const TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onChanged: (val) {
                            email = val;
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 350.w,
                        child: TextFormField(
                          validator: (val) =>
                              (val!.isEmpty) ? "Enter your Name..." : null,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.black,
                          textInputAction: TextInputAction.done,
                          cursorWidth: 2,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.black,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black45,
                            ),
                            labelText: "Name",
                            hintText: "Enter Your Name",
                            labelStyle: const TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onChanged: (val) {
                            name = val;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: name.isNotEmpty && image != null && email.isNotEmpty,
          child: GestureDetector(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.Userinterface),
            child: Transform.scale(
              scale: 0.9,
              child: Container(
                height: 50.h,
                width: 250.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "Let's Go ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
