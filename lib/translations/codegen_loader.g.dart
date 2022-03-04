// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> bn = {
  "contact_sir_name": "ড: এস.এম. তাওহীদুল ইসলাম",
  "contact_sir_rank": "অধ্যাপক",
  "contact_info_title": "যোগাযোগ সংক্রান্ত তথ্য",
  "contact_help": "সাহায্য",
  "btn_item_rice": "ধান",
  "btn_item_maize": "ভূট্টা",
  "btn_item_jute": "পাট",
  "btn_item_soybean": "সয়াবিন",
  "btn_item_wheat": "গম"
};
static const Map<String,dynamic> en = {
  "contact_sir_name": "Dr. S.M. Taohidul Islam",
  "contact_sir_rank": "Professor",
  "contact_info_title": "Contact Information",
  "contact_help": "Help",
  "btn_item_rice": "Rice",
  "btn_item_maize": "Maize",
  "btn_item_jute": "Jute",
  "btn_item_soybean": "Soybean",
  "btn_item_wheat": "Wheat"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"bn": bn, "en": en};
}
