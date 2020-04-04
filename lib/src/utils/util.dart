bool isNumeric(String data) {
  if(data.isEmpty) return false;

  final n = num.tryParse(data);

  return (n==null)?false:true;
}