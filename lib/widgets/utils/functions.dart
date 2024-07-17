String estimateValue(int number) {
  String value;
  double estValue;

  if (number <= 999) {
    value = number.toString();
  } else if (number >= 1000) {
    estValue = number / 1000;

    if (estValue.toString().contains('.0')) {
      value = '${estValue.toStringAsFixed(0)}K';
    } else {
      value = '${estValue.toStringAsFixed(1)}K';
    }
  } else if (number >= 1000000) {
    estValue = number / 1000000;

    if (estValue.toString().contains('.0')) {
      value = '${estValue.toStringAsFixed(0)}M';
    } else {
      value = '${estValue.toStringAsFixed(1)}M';
    }
  } else if (number >= 1000000000) {
    estValue = number / 1000000000;
    if (estValue.toString().contains('.0')) {
      value = '${estValue.toStringAsFixed(0)}B';
    } else {
      value = '${estValue.toStringAsFixed(1)}B';
    }
  } else {
    return 'null';
  }
  return value;
}
