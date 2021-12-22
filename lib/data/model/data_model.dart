// To parse this JSON data, do
//
//     final riceData = riceDataFromJson(jsonString);

class Data {
  Data({
    this.bacteria,
    this.symptoms,
    this.origin,
    this.trigger,
    this.solution,
    this.defensiveStep,
    this.cause,
  });

  String? cause;
  String? bacteria;
  String? symptoms;
  String? origin;
  String? trigger;
  Solution? solution;
  List<String>? defensiveStep;
}

class Solution {
  Solution({
    this.organic,
    this.chemical,
  });

  String? organic;
  String? chemical;
}
