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
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/domain/repositories/student_record_repository.dart';
import 'package:sabinpris/presentation/util.dart';
import 'package:sabinpris/service_locator.dart';

Future buildSummary() async {
  final head = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 30,
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
        width: 90,
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
        width: 110,
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
            'FEES PAID',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 120,
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
      Container(
        width: 100,
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
            'BALANCE',
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
            width: 30,
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
            width: 90,
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
            width: 110,
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
                NumberFormat().format(statistics.feesPaid),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            width: 120,
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
          Container(
            width: 100,
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
                NumberFormat().format(statistics.balance),
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

//ENGLISH SUMMARY
Future buildSectionSummary(LanguageSector sector) async {
  final head = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 30,
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
        width: 150,
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
            'Class',
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
        width: 90,
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
        width: 110,
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
            'FEES PAID',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 120,
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
      Container(
        width: 100,
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
            'BALANCE',
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
            width: 30,
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
            width: 150,
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
            width: 90,
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
            width: 110,
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
                NumberFormat().format(statistics.feesPaid),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Container(
            width: 120,
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
          Container(
            width: 100,
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
                NumberFormat().format(statistics.balance),
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
          .getSectionSummaryStatistics(SCHOOL_YEAR, sector))
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
            'SABINPRIS SCHOOL - MOTOWOH LIMBE',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            (sector == LanguageSector.english)
                ? 'ENGLISH SECTION: SUMMARY OF INCOME COLLECTED FOR THE ACADEMIC YEAR $SCHOOL_YEAR'
                : 'FRENCH SECTION: SUMMARY OF INCOME COLLECTED FOR THE ACADEMIC YEAR $SCHOOL_YEAR',
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
  final output = await getApplicationDocumentsDirectory();
  late String fileName;
  if (sector == LanguageSector.english) {
    fileName =
        'english_section_summary_${SCHOOL_YEAR.replaceAll('/', '-')}.pdf';
  } else {
    fileName = 'french_section_summary_${SCHOOL_YEAR.replaceAll('/', '-')}.pdf';
  }
  final file = File("${output.path}/$fileName");
  final res = await file.writeAsBytes(await pdf.save());
  // ignore: unnecessary_null_comparison
  if (res != null) {
    return res;
  } else {
    throw Exception("FILE GENERATION FAILED");
  }
}

//FEE COLLECTION SUMMARY
Future buildFeeCollectionSummary(List<FeeCollectionStatistics> feeStatistics,
    LanguageSector sector, StudentClass sclass) async {
  final head = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 25,
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
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 85,
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
            'Names',
            maxLines: 1,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
            'REG',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 60,
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
            'FEES AMT',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      ...List.generate(
        7,
        (_) => Container(
          width: 65,
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
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Container(
        width: 70,
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
            'TOTAL PAID',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
        width: 60,
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
            'BALANCE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
  _buildRow(FeeCollectionStatistics statistics, int index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 25,
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
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Container(
            width: 85,
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
                statistics.name,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
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
                NumberFormat().format(statistics.reg),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Container(
            width: 60,
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
                NumberFormat().format(statistics.feeAmt),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
          ...List.generate(
            7,
            (index) => Container(
              width: 65,
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
                child: (index < statistics.feesPaid.length)
                    ? Text(
                        NumberFormat().format(statistics.feesPaid[index]),
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      )
                    : Text(
                        '-',
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
              ),
            ),
          ),
          Container(
            width: 70,
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
                NumberFormat().format(statistics.totalPaid),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Container(
            width: 60,
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
                NumberFormat().format(statistics.balance),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      );
  int statCount = 0;
  final body = feeStatistics.map((statistic) {
    statCount++;
    return _buildRow(statistic, statCount);
  }).toList();

  final className = getClassName(sclass);
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
            'SABINPRIS SCHOOL - MOTOWOH LIMBE',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'CLASS: $className: SUMMARY OF PUPILS FEES COLLECTED FOR THE ACADEMIC YEAR $SCHOOL_YEAR',
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
  final output = await getApplicationDocumentsDirectory();
  late String fileName;
  fileName =
      'class_${className.toLowerCase().replaceAll(' ', '')}_summary_${SCHOOL_YEAR.replaceAll('/', '-')}.pdf';

  final file = File("${output.path}/$fileName");
  final res = await file.writeAsBytes(await pdf.save());
  // ignore: unnecessary_null_comparison
  if (res != null) {
    return res;
  } else {
    throw Exception("FILE GENERATION FAILED");
  }
}
