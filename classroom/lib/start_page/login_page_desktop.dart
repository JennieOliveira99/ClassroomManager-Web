import 'package:classroom/model/login.dart';
import 'package:classroom/service/login_service.dart';
import 'package:classroom/src/custom_font_style.dart';
import 'package:classroom/src/theme.dart';
import 'package:classroom/start_page/register_page_desktop.dart';
import 'package:classroom/widget/custom_text_field.dart';
import 'package:classroom/widget/toast_util.dart';
import 'package:flutter/material.dart';

class LoginPageDesktop extends StatefulWidget {
  const LoginPageDesktop({super.key});

  @override
  State<LoginPageDesktop> createState() => _LoginPageDesktopState();
}

class _LoginPageDesktopState extends State<LoginPageDesktop> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  bool _isPasswordVisible = false;
  final LoginService _loginService = LoginService();

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final login = Login(
      username: _userController.text.trim(),
      password: _passwordController.text.trim(),
    );

    final result = await _loginService.login(login);
    if (mounted) {
      ToastUtil.showMessage(
        context,
        result["message"] ?? "Login successful",
        isSuccess: result["success"] == true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryDark,
      body: Center(
        child: Container(
          // height: 475,
          width: 940,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 32, top: 32),
                width: 427,
                height: 475,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login', style: CustomFontStyle().textTitle),
                      const SizedBox(height: 4),
                      Text(
                        'Entre para iniciar o gerenciamento.',
                        style: CustomFontStyle().textRegular,
                      ),
                      const SizedBox(height: 24),

                      CustomTextField(
                        label: "Usuário",
                        controller: _userController,
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        label: "Senha",
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: CustomColors.secondaryDark,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterPageDesktop(),
                                ),
                              );
                            },
                            child: Text(
                              'Redefinir agora.',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: CustomColors.primaryDark,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _loginUser,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primaryDark,
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            'Não tem uma conta?',
                            style: CustomFontStyle().textRegular,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterPageDesktop(),
                                ),
                              );
                            },
                            child: Text(
                              'Cadastre-se',
                              style: CustomFontStyle().textGreenRegular,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(right: 16, top: 16),
                // color: Colors.blue,
                width: 513,
                height: 475,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/image/Group5.png',
                      fit: BoxFit.cover,
                      width: 484,
                      height: 341,
                    ),
                    SizedBox(height: 28),
                    Text(
                      'Organize, gerencie, simplifique sua rotina escolar.',
                      style: CustomFontStyle().textGreenRegular,
                    ),
                    Text(
                      'Classroom Manager',
                      style: CustomFontStyle().textTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
