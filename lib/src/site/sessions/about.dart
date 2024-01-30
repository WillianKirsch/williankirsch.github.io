import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    const aboutMe =
        'Experiência de 6 anos em desenvolvimento de software utilizando C# .Net com os ORM’s Entity Framework, Dapper e ADO.Net junto aos bancos de dados Microsoft SQL Server, MySql e Oracle Sql, sendo que durante 5 anos trabalhei em projetos full stack utilizando Angular para front end, no último ano atuando como líder técnico e desenvolvedor em aplicações mobile utilizando Flutter e mantendo aplicações em Xamarin. \n\nGraduado em Ciência da Computação pela UNIVALI.\nPós Graduado em Análise, Projeto e Gerência de Sistemas pela Uniderp.\nConhecimentos:\n- Back-end: C#, .NET, .NET Core, .NET MVC, .NET WebForms, WebApi.\n- Front-end: TypeScript, JavaScript, Angular, React.\n- Mobile: Xamarin, Flutter, Ionic.\n- Banco de dados: Microsoft SQL Server, Oracle SQL, MySql, PostgreSQL. \n- Liderança de equipe;\n- Análise de ponto de função;\n- ITIL;\n- LGPD;\n- Métodologia ágil;\n- Scrum;\n- Kanban;\n- Planning Poker;';

    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.04,
          ),
          color: Theme.of(context).colorScheme.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sobre',
                style: TextStyle(
                  fontSize: height * 0.055,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      aboutMe,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.0,
                        height: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
