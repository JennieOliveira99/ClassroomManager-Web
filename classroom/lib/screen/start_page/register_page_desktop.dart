import 'package:classroom/model/register.dart';
import 'package:classroom/service/register_service.dart';
import 'package:classroom/src/custom_font_style.dart';
import 'package:classroom/src/theme.dart';
import 'package:classroom/widget/toast_util.dart';
import 'login_page_desktop.dart';
import 'package:classroom/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPageDesktop extends StatefulWidget {
  const RegisterPageDesktop({super.key});

  @override
  State<RegisterPageDesktop> createState() => _RegisterPageDesktopState();
}

class _RegisterPageDesktopState extends State<RegisterPageDesktop> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  bool _isPasswordVisible = false;
  final RegisterService _registerService = RegisterService();
  final _formKey = GlobalKey<FormState>();

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final register = Register(
        username: _userController.text.trim(),
        password: _passwordController.text.trim(),
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
      );

      final result = await _registerService.register(register);

      if (!mounted) return;

      ToastUtil.showMessage(
        context,
        result["message"],
        isSuccess: result["success"] == true,
      );

      if (result["success"] == true) {
        // Redirecionar para login após cadastro
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPageDesktop()),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ToastUtil.showMessage(
        context,
        "Ocorreu um erro durante o cadastro: ${e.toString()}",
        isSuccess: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryDark,
      body: Center(
        child: Container(
          height: 475,
          width: 940,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 32, top: 16),
                  width: 427,
                  height: 475,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cadastro', style: CustomFontStyle().textTitle),
                      const SizedBox(height: 4),
                      Text(
                        'Para inicar reservas.',
                        style: CustomFontStyle().textRegular,
                      ),
                      const SizedBox(height: 4),

                      CustomTextField(
                        label: "Nome",
                        controller: _nameController,
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 4),
                      CustomTextField(
                        label: "Email",
                        controller: _emailController,
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return "Campo obrigatório";
                          }
                          if (!valor.contains('@') || !valor.contains('.')) {
                            return "Formato de email inválido (deve conter @)";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 4),
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
                      const SizedBox(height: 4),
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
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _registerUser,
                        child: Text(
                          'Cadastrar',
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
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Já tem uma conta?',
                            style: CustomFontStyle().textRegular,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginPageDesktop(),
                                ),
                              );
                            },
                            child: Text(
                              'Entrar',
                              style: CustomFontStyle().textGreenRegular,
                            ),
                          ),
                        ],
                      ),
                    ],
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
      ),
    );
  }
}
