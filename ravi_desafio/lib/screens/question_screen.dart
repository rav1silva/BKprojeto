import 'package:flutter/material.dart';
import 'package:ravi_desafio/screens/result_screen.dart';
import 'package:ravi_desafio/theme/pallete.dart';
import 'package:ravi_desafio/widgets/button_default.dart';
import 'package:ravi_desafio/widgets/step_by_step.dart';

import '../theme/font.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int pontuation = 0;
  int _step = 0;

  String questionCurrent = '';
  final String _question1 =
      'Você e um colega estão trocando e-mails sobre um novo projeto. De repente, seu colega envia um e-mail com várias dúvidas e preocupações não relacionadas ao tópico. Qual das alternativas a seguir é um próximo passo recomendado para um bom ouvinte?';
  final String _question2 =
      'Você e sua chefe estão com alguma dificuldade de se encontrarem pessoalmente em um projeto. Qual seria o melhor contexto para resolver seu conflito?';

  final int _numberResponseCorrectQuestion1 = 2;
  final int _numberResponseCorrectQuestion2 = 3;

  late List<String> responsesCurrent;
  final List<String> _responses1 = [
    "Responder ao e-mail tentando resolver algumas das preocupações",
    "Informar seu supervisor para que ele resolva o problema",
    "Ligar para o colega e conversar por telefone",
    "Ignorar o e-mail. Você tem um plano e deve segui-lo"
  ];

  final List<String> _responses2 = [
    "Um telefonema para um bate-papo oportuno, sabendo que ela está dirigindo para um congresso",
    "Uma conversa improvisada durante um trabalho de assessoria",
    "Um e-mail apresentando seu ponto de vista e pedindo uma resposta",
    "Um e-mail seu perguntando sobre o melhor momento, nos próximos dias, para discutirem a questão pessoalmente"
  ];

  int? responseCurrent;
  int? responseQuestion1;
  int? responseQuestion2;

  @override
  void initState() {
    super.initState();

    questionCurrent = _question1;
    responsesCurrent = _responses1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo-bk-color.png',
                          width: 38,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                StepByStep(quantity_steps: 2, current_step: _step),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          Text(
                            questionCurrent,
                            style: const TextStyle(
                              fontFamily: Font.flame,
                              color: Pallete.textPrimaryColor,
                              fontSize: Font.size18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                for (int i = 0; i < responsesCurrent.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        side: const BorderSide(
                          color: Pallete.textPrimaryColor,
                        ),
                      ),
                      title: Text(
                        responsesCurrent[i],
                        style: const TextStyle(
                          fontSize: Font.size16,
                          color: Pallete.textPrimaryColor,
                        ),
                      ),
                      value: i,
                      groupValue: responseCurrent,
                      onChanged: (value) {
                        setState(() {
                          responseCurrent = value as int;
                        });
                      },
                    ),
                  ),
                const SizedBox(height: 36),
                ButtonDefault(
                  text: 'Continuar',
                  width: double.infinity,
                  onPressed: () {
                    if (responseCurrent == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Selecione uma resposta'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (responseQuestion1 == null) {
                      setState(() {
                        responseQuestion1 = responseCurrent;
                        responseCurrent = null;
                        responsesCurrent = _responses2;
                        questionCurrent = _question2;
                        _step++;
                      });
                    } else if (responseQuestion2 == null) {
                      responseQuestion2 = responseCurrent;

                      if (responseQuestion1 == _numberResponseCorrectQuestion1) {
                        pontuation += 50;
                      }

                      if (responseQuestion2 == _numberResponseCorrectQuestion2) {
                        pontuation += 50;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            result: pontuation,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
