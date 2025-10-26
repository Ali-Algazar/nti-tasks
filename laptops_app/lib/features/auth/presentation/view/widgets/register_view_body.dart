import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laptops_app/core/helper_functions/generate_dandom_number.dart';
import 'package:laptops_app/core/utils/validator.dart';
import 'package:laptops_app/features/auth/data/models/user_model.dart';
import 'package:laptops_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:laptops_app/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:laptops_app/features/main/presentation/view/main_view.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ganderController = TextEditingController();
  String? imageBytes;
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        imageBytes = base64Encode(imageFile!.readAsBytesSync());
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          print(state.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is AuthSuccess) {
          // nationalId = state.user.nationalId;
          print(state.user);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainView()),
          );
        }
        if (state is AuthLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loading...'),
              backgroundColor: Colors.blueGrey,
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          imageFile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : IconButton(
                        onPressed: () async {
                          await pickImage();
                        },
                        icon: Icon(Icons.camera_alt, size: 50),
                      ),
              ),
              CostomTextField(
                controller: emailController,
                hintText: 'Email',
                validator: MyValidators.emailValidator,
                prefixIcon: Icons.email,
              ),
              CostomTextField(
                controller: nameController,
                hintText: 'Name',
                validator: MyValidators.displayNamevalidator,
                prefixIcon: Icons.person,
              ),

              CostomTextField(
                controller: passwordController,
                hintText: 'password',
                validator: MyValidators.passwordValidator,
                prefixIcon: Icons.lock,
              ),

              CostomTextField(
                controller: phoneController,
                hintText: 'Phone',
                validator: MyValidators.phoneValidator,
                prefixIcon: Icons.phone,
              ),

              CostomTextField(
                controller: ganderController,
                hintText: 'Gender',

                prefixIcon: Icons.male,
                validator: MyValidators.displayNamevalidator,
              ),

              Row(
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Login'),
                  ),
                ],
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        imageBytes != null) {
                      BlocProvider.of<AuthCubit>(context).register(
                        UserModel(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                          phone: phoneController.text,
                          nationalId: generateRandomNumber(),
                          gender: 'male',
                          profileImage: imageBytes!,
                        ).toJson(),
                      );
                    }
                  },
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
