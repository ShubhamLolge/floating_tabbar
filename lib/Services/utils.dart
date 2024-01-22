/// Data from the Text Widget
String getStringFromTextWidget(String string) {
  String? resultString;
  RegExp regex = RegExp(r'"([^"]*)"');
  Match? match = regex.firstMatch(string);

  if (match != null) {
    String result = match.group(1) ?? '';
    resultString = result;
  }
  return resultString!;
}

/// Converts the string title to route path.
String toRoutePath({required String title}) {
  String routePath;
  String string = getStringFromTextWidget(title);
  string = string.replaceAll(RegExp(r'[^\w\s]+'), '').toLowerCase();
  string.contains(' ')
      ? routePath = string.replaceAll(" ", "-")
      : routePath = string;
  return "/$routePath";
}
