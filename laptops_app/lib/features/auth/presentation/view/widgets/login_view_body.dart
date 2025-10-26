import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptops_app/core/utils/validator.dart';
import 'package:laptops_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:laptops_app/features/auth/presentation/view/register_view.dart';
import 'package:laptops_app/features/main/presentation/view/main_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
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
          print(state.user.nationalId);
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
              CostomTextField(
                hintText: 'Email',
                validator: MyValidators.emailValidator,
                controller: emailController,
                prefixIcon: Icons.email,
              ),
              CostomTextField(
                hintText: 'Password',
                controller: passwordController,
                validator: MyValidators.passwordValidator,
                prefixIcon: Icons.lock,
              ),
              Text('Forget password?'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
                child: Text(' Create account'),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(
                        context,
                      ).login(emailController.text, passwordController.text);
                    }
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CostomTextField extends StatelessWidget {
  const CostomTextField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.prefixIcon,
    this.controller,
  });
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?) validator;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
