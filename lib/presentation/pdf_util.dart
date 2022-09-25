// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
// import 'package:printing/printing.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/domain/entity/statistics.dart';
import 'package:sabinpris/domain/repositories/student_record_repository.dart';
import 'package:sabinpris/service_locator.dart';

Future buildSummary() async {
  final head = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 40,
        padding: const EdgeInsets.all(4),
        foregroundDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PdfColors.black),
            left: BorderSide(color: PdfColors.black),
            right: BorderSide.none,
            bottom: BorderSide(color: PdfColors.black),
          ),
        ),
        child: Center(
          child: Text(
            'SN',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 170,
        padding: const EdgeInsets.all(4),
        foregroundDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PdfColors.black),
            left: BorderSide(color: PdfColors.black),
            right: BorderSide.none,
            bottom: BorderSide(color: PdfColors.black),
          ),
        ),
        child: Center(
          child: Text(
            'DESCRIPTION',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 50,
        padding: const EdgeInsets.all(4),
        foregroundDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PdfColors.black),
            left: BorderSide(color: PdfColors.black),
            right: BorderSide.none,
            bottom: BorderSide(color: PdfColors.black),
          ),
        ),
        child: Center(
          child: Text(
            'ROLL',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 100,
        padding: const EdgeInsets.all(4),
        foregroundDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PdfColors.black),
            left: BorderSide(color: PdfColors.black),
            right: BorderSide.none,
            bottom: BorderSide(color: PdfColors.black),
          ),
        ),
        child: Center(
          child: Text(
            'FEES DUE',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 140,
        padding: const EdgeInsets.all(4),
        foregroundDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PdfColors.black),
            left: BorderSide(color: PdfColors.black),
            right: BorderSide.none,
            bottom: BorderSide(color: PdfColors.black),
          ),
        ),
        child: Center(
          child: Text(
            'REGISTRATION',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 140,
        padding: const EdgeInsets.all(4),
        foregroundDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PdfColors.black),
            left: BorderSide(color: PdfColors.black),
            right: BorderSide.none,
            bottom: BorderSide(color: PdfColors.black),
          ),
        ),
        child: Center(
          child: Text(
            'FEES PAID',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 140,
        padding: const EdgeInsets.all(4),
        foregroundDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PdfColors.black),
            left: BorderSide(color: PdfColors.black),
            right: BorderSide(color: PdfColors.black),
            bottom: BorderSide(color: PdfColors.black),
          ),
        ),
        child: Center(
          child: Text(
            'TOTAL INCOME',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );

  _buildRow(GeneralStatistics statistics, int index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            padding: const EdgeInsets.all(4),
            foregroundDecoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                left: BorderSide(color: PdfColors.black),
                right: BorderSide.none,
                bottom: BorderSide(color: PdfColors.black),
              ),
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            width: 170,
            padding: const EdgeInsets.all(4),
            foregroundDecoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                left: BorderSide(color: PdfColors.black),
                right: BorderSide.none,
                bottom: BorderSide(color: PdfColors.black),
              ),
            ),
            child: Center(
              child: Text(
                statistics.description,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            width: 50,
            padding: const EdgeInsets.all(4),
            foregroundDecoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                left: BorderSide(color: PdfColors.black),
                right: BorderSide.none,
                bottom: BorderSide(color: PdfColors.black),
              ),
            ),
            child: Center(
              child: Text(
                NumberFormat().format(statistics.roll),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.all(4),
            foregroundDecoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                left: BorderSide(color: PdfColors.black),
                right: BorderSide.none,
                bottom: BorderSide(color: PdfColors.black),
              ),
            ),
            child: Center(
              child: Text(
                NumberFormat().format(statistics.feesDue),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            width: 140,
            padding: const EdgeInsets.all(4),
            foregroundDecoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                left: BorderSide(color: PdfColors.black),
                right: BorderSide.none,
                bottom: BorderSide(color: PdfColors.black),
              ),
            ),
            child: Center(
              child: Text(
                NumberFormat().format(statistics.registration),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            width: 140,
            padding: const EdgeInsets.all(4),
            foregroundDecoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                left: BorderSide(color: PdfColors.black),
                right: BorderSide.none,
                bottom: BorderSide(color: PdfColors.black),
              ),
            ),
            child: Center(
              child: Text(
                NumberFormat().format(statistics.feesPaid),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            width: 140,
            padding: const EdgeInsets.all(4),
            foregroundDecoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                left: BorderSide(color: PdfColors.black),
                right: BorderSide(color: PdfColors.black),
                bottom: BorderSide(color: PdfColors.black),
              ),
            ),
            child: Center(
              child: Text(
                NumberFormat().format(statistics.totalIncome),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      );
  int statCount = 0;
  final body = (await serviceLocator<StudentRecordRepository>()
          .getGeneralStatistics(SCHOOL_YEAR))
      .map((statistic) {
    statCount++;
    return _buildRow(statistic, statCount);
  }).toList();

  final finalWidget = Container(
    width: double.infinity,
    color: PdfColors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Text(
            'SABINPRIS / GOOD SHEPHERD SCHOOL - MOTOWOH LIMBE',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'CONSOLIDATED SUMMARY OF INCOME COLLECTED FOR THE ACADEMIC YEAR $SCHOOL_YEAR',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              head,
              ...body,
            ],
          )),
        ],
      ),
    ),
  );

  final pdf = Document();

  pdf.addPage(
    Page(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.landscape,
      margin: EdgeInsets.zero,
      build: (Context context) {
        return finalWidget; // Center
      },
    ),
  );

  // On Flutter, use the [path_provider](https://pub.dev/packages/path_provider) library:
  final output = await getApplicationDocumentsDirectory();
  final fileName = 'general_summary_${SCHOOL_YEAR.replaceAll('/', '-')}.pdf';
  final file = File("${output.path}/$fileName");
  final res = await file.writeAsBytes(await pdf.save());
  if (res != null) {
    return res;
  } else {
    throw Exception("FILE GENERATION FAILED");
  }
}
