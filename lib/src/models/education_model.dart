class EducationModel {
  EducationModel({
    required this.description,
    required this.linkName,
    required this.period,
    required this.name,
  });
  final String description;
  final String linkName;
  final String period;
  final String name;
}

List<EducationModel> getEducationList() {
  return [
    EducationModel(
      description: 'Bacharel em Ciência da Computação',
      linkName: 'https://www.univali.br/',
      period: '2013 - 2019',
      name: 'Universidade do Vale do Itajaí',
    ),
    EducationModel(
      description: 'Pós graduação em Análise, projeto e gerência de sistemas',
      linkName: 'https://www.uniderp.com.br/',
      period: '2019 - 2020',
      name: 'Uniderp',
    ),
  ];
}
