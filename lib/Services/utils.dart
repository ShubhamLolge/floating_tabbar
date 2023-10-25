String getStringFromTextWidget(String string) {
  String? resultString;
  // Extract text inside double quotes using RegExp match
  RegExp regex = RegExp(r'"([^"]*)"');
  Match? match = regex.firstMatch(string);

  if (match != null) {
    String result = match.group(1) ?? '';
    resultString = result;
  }
  return resultString!;
}
