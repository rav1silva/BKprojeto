import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ravi_desafio/theme/pallete.dart';
import 'package:ravi_desafio/widgets/button_back.dart';
import 'package:ravi_desafio/widgets/step_by_step.dart';

import '../theme/font.dart';
import '../widgets/button_default.dart';
import '../widgets/text_field.dart';
import 'registration_screen_third.dart';

class RegistrationScreenSecond extends StatefulWidget {
  const RegistrationScreenSecond({super.key});

  @override
  State<RegistrationScreenSecond> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreenSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Pallete.primaryColor,
          child: SafeArea(
            child: Stack(children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 16),
                child: ButtonBack(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo-bk-color.png',
                        width: 38,
                      ),
                    ),
                    const SizedBox(height: 36),
                    const StepByStep(quantity_steps: 3, current_step: 1),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Agora, conte mais sobre você',
                        style: TextStyle(
                          fontSize: Font.size24,
                          fontFamily: Font.flame,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gostaríamos de te conhecer melhor, para isso, preencha os campos abaixo:',
                        style: TextStyle(
                          fontSize: Font.size18,
                          fontFamily: Font.flame,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomTextField(
                      labelText: 'O que mais gosta de fazer?',
                      controller: TextEditingController(),
                      width: double.infinity,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      labelText: 'Qual o seu maior sonho?',
                      controller: TextEditingController(),
                      width: double.infinity,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      labelText: 'Qual a sua maior motivação?',
                      controller: TextEditingController(),
                      width: double.infinity,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      labelText: 'Cite uma referência pessoal',
                      controller: TextEditingController(),
                      width: double.infinity,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      labelText:
                          'Como o BK pode contribuir com seus objetivos?',
                      controller: TextEditingController(),
                      width: double.infinity,
                    ),
                    const SizedBox(height: 40),
                    ButtonDefault(
                      text: 'Continuar',
                      width: double.infinity,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationScreenThird()),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Image.asset(
                            'assets/images/bottom-registration-2-3.png',
                            width: 300),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
