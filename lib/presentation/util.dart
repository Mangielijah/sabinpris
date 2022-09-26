import 'package:flutter/material.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/fee.dart';

List<DropdownMenuItem<T?>> buildDropdownItems<T>(List<T> itemList) {
  List<DropdownMenuItem<T?>> items = [];
  for (var item in itemList) {
    if (item is Gender) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(
            (item.name),
          ),
        ),
      );
    }
    if (item is LanguageSector) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(
            (item.name),
          ),
        ),
      );
    }
    if (item is StudentClass) {
      final displayClass = getClassName(item);
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(displayClass),
        ),
      );
    }
  }
  return items;
}

String getClassName(StudentClass item) {
  late String displayClass;
  if (item == StudentClass.preNusery) {
    displayClass = 'Pre-Nursery';
  } else if (item == StudentClass.nuseryOne) {
    displayClass = 'Nursery I';
  } else if (item == StudentClass.nuseryTwo) {
    displayClass = 'Nursery II';
  } else if (item == StudentClass.classOne) {
    displayClass = 'Class 1';
  } else if (item == StudentClass.classTwo) {
    displayClass = 'Class 2';
  } else if (item == StudentClass.classThree) {
    displayClass = 'Class 3';
  } else if (item == StudentClass.classFour) {
    displayClass = 'Class 4';
  } else if (item == StudentClass.classFive) {
    displayClass = 'Class 5';
  } else if (item == StudentClass.classSix) {
    displayClass = 'Class 6';
  }
  return displayClass;
}

int getClassFee(StudentClass sclass) {
  if (sclass == StudentClass.preNusery) return Fee.preNusery;
  if (sclass == StudentClass.nuseryOne) return Fee.nurseryOne;
  if (sclass == StudentClass.nuseryTwo) return Fee.nurseryTwo;
  if (sclass == StudentClass.classOne) return Fee.classOne;
  if (sclass == StudentClass.classTwo) return Fee.classTwo;
  if (sclass == StudentClass.classThree) return Fee.classThree;
  if (sclass == StudentClass.classFour) return Fee.classFour;
  if (sclass == StudentClass.classFive) return Fee.classFive;
  if (sclass == StudentClass.classSix) return Fee.classSix;
  return 0;
}
