import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/util.dart';

class ExportDialog extends StatefulWidget {
  const ExportDialog({super.key});

  @override
  State<ExportDialog> createState() => _ExportDialogState();
}

class _ExportDialogState extends State<ExportDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      content: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Exporting Database'),
            const SizedBox(
              height: 50,
            ),
            FutureBuilder<String>(
              future: exportDatabase(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const Text('Database has been Exported'),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: size.width * .2,
                          height: size.height * .09,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: kTabColorLight,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                // SvgPicture.asset('assets/Settings.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'DONE',
                                  style: TextStyle(
                                    color: Color(0xff4D4D4D),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      const Text(
                          'Error Exporting Database, please try again later'),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: size.width * .2,
                          height: size.height * .09,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: kTabColorLight,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                // SvgPicture.asset('assets/Settings.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'CLOSE',
                                  style: TextStyle(
                                    color: Color(0xff4D4D4D),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                );
              },
            ),
            // ElevatedButton(onPressed: (){}, child: Text('C'))
          ],
        ),
      ),
    );
  }
}

class ImportDialog extends StatefulWidget {
  const ImportDialog({super.key});

  @override
  State<ImportDialog> createState() => _ImportDialogState();
}

class _ImportDialogState extends State<ImportDialog> {
  File? file;
  bool isImporting = false;
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      content: Container(
        width: 500,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Import Database'),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['isar'],
                    );

                    if (result != null) {
                      file = File(result.files.single.path!);
                      setState(() {});
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Container(
                    width: size.width * .15,
                    height: size.height * .07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kTabColorLight,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          // SvgPicture.asset('assets/Settings.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Choose file',
                            style: TextStyle(
                              color: Color(0xff4D4D4D),
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                if (file != null) Flexible(child: Text(file!.path))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: isImporting
                  ? () {}
                  : file != null
                      ? () async {
                          isImporting == true;
                          setState(() {});
                          final result = await importDatabase(file!);
                          isImporting = false;
                          isCompleted = true;
                          setState(() {});
                          Navigator.pop(context);
                        }
                      : () {},
              child: Container(
                width: size.width * .15,
                height: size.height * .07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: kTabColorLight,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        spreadRadius: 2,
                        blurRadius: 2,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SvgPicture.asset('assets/Settings.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        isImporting ? 'Importing database' : 'Import Now',
                        style: const TextStyle(
                          color: Color(0xff4D4D4D),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (isImporting)
              const SizedBox(
                height: 20,
              ),
            if (isImporting)
              const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
