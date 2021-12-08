class Person {
  late String Nation;
  late String Population;

  Person({
    required this.Nation,
    required this.Population,
  });

  Person.fromJson(Map<String, dynamic> json):
       Nation = '${json['Nation']}',
       Population = '${json['Population']}';
}
