
import 'package:intl/intl.dart';

void main(){
  DateTime data = DateTime.now();

  DateFormat formatter = DateFormat('dd-MM-yyyy');
  String dataFormatada = formatter.format(data);
  print(dataFormatada);
}