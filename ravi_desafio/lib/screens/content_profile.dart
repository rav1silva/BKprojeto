// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ravi_desafio/theme/font.dart';
import 'package:ravi_desafio/theme/pallete.dart';
import 'package:ravi_desafio/widgets/card_statistics.dart';
import 'package:ravi_desafio/widgets/table_cell_custom.dart';

class ContentProfile extends StatefulWidget {
  const ContentProfile({super.key});

  @override
  State<ContentProfile> createState() => _ContentProfileState();
}

class _ContentProfileState extends State<ContentProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.primaryColor,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Perfil',
                        style: TextStyle(
                            fontFamily: Font.flame,
                            color: Pallete.textPrimaryColor,
                            fontSize: Font.size24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 124,
                            width: 358,
                            decoration: BoxDecoration(
                              color: Pallete.whiteColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 8, right: 8),
                            child: Image.asset(
                              'assets/images/profile.png',
                              width: 74,
                              height: 92,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20, left: 90),
                            child: Text(
                              'Gabriel da Silva',
                              style: TextStyle(
                                  color: Pallete.textPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Font.size18),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 58, left: 90),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  size: 16,
                                  color: Pallete.textSecondaryColor,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Noite',
                                  style: TextStyle(
                                    color: Pallete.textSecondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 84, left: 90),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  size: 16,
                                  color: Pallete.textSecondaryColor,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Gerente Drive Tru',
                                  style: TextStyle(
                                    color: Pallete.textSecondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TableCellCustom(
                          title: 'Sonho', subtitle: 'Fazer um intercâmbio'),
                      TableCellCustom(
                          title: 'Área de interesse',
                          subtitle: 'Relações comerciais',
                          lastColumn: true),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TableCellCustom(title: 'Motivação', subtitle: 'Família'),
                      TableCellCustom(
                        title: 'Pontos fortes',
                        subtitle: 'Resiliência, empatia e...',
                        lastColumn: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text(
                          'Ver mais',
                          style: TextStyle(
                              color: Pallete.textPrimaryColor,
                              fontSize: Font.size16),
                        ),
                        onPressed: () {
                          print('Ver mais');
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 64, child: Center(child: Divider(thickness: 0.5)),),
                  const Row(
                    children: [
                      Text(
                        'Estatísticas',
                        style: TextStyle(
                            fontFamily: Font.flame,
                            color: Pallete.textPrimaryColor,
                            fontSize: Font.size24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardStatistics(
                          title: '641',
                          subtitle: 'Dias seguidos',
                          image: 'assets/images/fire.png'),
                      CardStatistics(
                          title: '24 Conquistas',
                          subtitle: 'Esta semana',
                          image: 'assets/images/medal.png'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
