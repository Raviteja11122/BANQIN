import 'package:bank_genie_task/core/view_models/login_view_model.dart';
import 'package:bank_genie_task/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Login extends ViewModelWidget<LoginViewModel>{
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Column(
        children: [
          Expanded(
              flex: 9,
              child: Form(
                key: model.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Welcome Back!",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w600
                        )
                    ),
                    const SizedBox(height: 11),
                    Text(
                        "Please login to your account",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8E8E93)
                        )
                    ),
                    const SizedBox(height: 37),
                    FormTextField(
                      controller: model.userNameController,
                      hintText: "User Name",
                      validator: (String? name){
                        if(name != null && name.trim().length > 1){
                          return null;
                        }
                        return "Please enter valid user name";
                      },
                    ),
                    const SizedBox(height: 16),
                    FormTextField(
                      hintText: "Password",
                      validator: (String? name){
                        if(name != null && name.trim().length > 1){
                          return null;
                        }
                        return "Please enter valid password";
                      },
                      controller: model.passwordController,
                    ),
                    if(model.errorText != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(model.errorText!, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.red))
                        ],
                      )
                  ],
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF4FD27C)
                  ),
                  onPressed: model.isBusy ? (){} : () => model.login(),
                  child: model.isBusy ? const CircularProgressIndicator(color: Colors.white) : const Text("Login"),
                ),
              )
          )
        ],
      ),
    );
  }

}

