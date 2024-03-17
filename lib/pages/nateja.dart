import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nateja/controller/nateja_controller.dart';
import 'package:nateja/data/arabic_number.dart';
import 'package:nateja/data/static.dart';
import 'package:nateja/widget/main_text.dart';

class Nateeja extends StatelessWidget {
  const Nateeja({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NatejaController());
    return GetBuilder<NatejaController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              //Background
              Opacity(
                opacity: 0.9,
                child: Image.asset(
                  'assets/images/background.jpg',
                  width: Get.width,
                  height: Get.height,
                  fit: BoxFit.fill,
                ),
              ),
              //Page Data
              ListView(
                children: [
                  //Safe area
                  const SizedBox(height: 48),
                  //Arabic day name
                  Center(
                    child: MainText(
                      text: DateFormat('EEEE')
                          .format(DateTime.now())
                          .toArabicNumbers,
                      size: 64,
                      weight: FontWeight.w500,
                      font: 'Amiri',
                    ),
                  ),
                  //Englisg day name
                  Center(
                    child: Container(
                      height: 22,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MainText(
                          text: DateFormat('EEEE')
                              .format(DateTime.now())
                              .toUpperCase(),
                          size: 16,
                          weight: FontWeight.w500,
                          font: 'Amiri',
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 16,
                    endIndent: 16,
                    height: 8,
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                  //Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Gregorian date
                      Column(
                        children: [
                          //day
                          MainText(
                            text: DateFormat('dd')
                                .format(DateTime.now())
                                .toArabicNumbers,
                            size: 128,
                            weight: FontWeight.w500,
                            font: 'NotoSans',
                          ),
                          //month
                          MainText(
                            text: controller.gregorianMonth(
                              DateFormat('M').format(DateTime.now()),
                            ),
                            size: 48,
                            weight: FontWeight.w400,
                            font: 'me_quran',
                          ),
                          //year
                          MainText(
                            text: DateFormat('yyyy')
                                .format(DateTime.now())
                                .toArabicNumbers,
                            size: 48,
                            weight: FontWeight.w500,
                            font: 'Amiri',
                          ),
                        ],
                      ),
                      //Divider
                      const SizedBox(
                        height: 320,
                        child: Row(
                          children: [
                            VerticalDivider(
                              color: Colors.black,
                              thickness: 0.5,
                              width: 0,
                            ),
                            SizedBox(width: 2),
                            VerticalDivider(
                              color: Colors.black,
                              thickness: 0.5,
                              width: 0,
                            ),
                          ],
                        ),
                      ),
                      //Hijri date
                      Column(
                        children: [
                          //day
                          MainText(
                            text: controller.today
                                .toFormat('dd')
                                .toString()
                                .toArabicNumbers,
                            size: 128,
                            weight: FontWeight.w500,
                            font: 'NotoSans',
                          ),
                          //month
                          MainText(
                            text: controller
                                .hijriMonth(
                                    controller.today.toFormat('mm').toString())
                                .toString(),
                            size: 48,
                            weight: FontWeight.w500,
                            font: 'me_quran',
                          ),
                          //year
                          MainText(
                            text: controller.today
                                .toFormat('yyyy')
                                .toString()
                                .toArabicNumbers,
                            size: 48,
                            weight: FontWeight.w500,
                            font: 'Amiri',
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Pray Times
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Table(
                      border: TableBorder.all(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        const TableRow(
                          children: [
                            Center(child: Text('المواقيت')),
                            Center(child: Text('الفجر')),
                            Center(child: Text('الشروق')),
                            Center(child: Text('الظهر')),
                            Center(child: Text('العصر')),
                            Center(child: Text('المغرب')),
                            Center(child: Text('العشاء')),
                          ],
                        ),
                        for (int i = 0;
                            i <
                                (controller.nategaType == 0
                                    ? 4
                                    : goversData.length);
                            i++)
                          TableRow(
                            children: [
                              Center(
                                child: Text(
                                  goversData[goversNames[i]][0],
                                  style: TextStyle(
                                    fontSize: Get.width / 36,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(controller.getPrayTime(
                                    goversData[goversNames[i]][1],
                                    goversData[goversNames[i]][2],
                                    'fajr')),
                              ),
                              Center(
                                child: Text(controller.getPrayTime(
                                    goversData[goversNames[i]][1],
                                    goversData[goversNames[i]][2],
                                    'sunrise')),
                              ),
                              Center(
                                child: Text(controller.getPrayTime(
                                    goversData[goversNames[i]][1],
                                    goversData[goversNames[i]][2],
                                    'dhuhr')),
                              ),
                              Center(
                                child: Text(controller.getPrayTime(
                                    goversData[goversNames[i]][1],
                                    goversData[goversNames[i]][2],
                                    'asr')),
                              ),
                              Center(
                                child: Text(controller.getPrayTime(
                                    goversData[goversNames[i]][1],
                                    goversData[goversNames[i]][2],
                                    'maghrib')),
                              ),
                              Center(
                                child: Text(controller.getPrayTime(
                                    goversData[goversNames[i]][1],
                                    goversData[goversNames[i]][2],
                                    'isha')),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  //Random Hadith
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      '${hadith[Random().nextInt(hadith.length)]}',
                    ),
                  ),
                  //Show more and less govers
                  Center(
                    child: TextButton(
                      onPressed: () {
                        controller.moreGoveers();
                      },
                      child: Text(
                        controller.nategaType == 0
                            ? 'عرض المزيد من المحافظات'
                            : 'عرض محافظات اقل',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
