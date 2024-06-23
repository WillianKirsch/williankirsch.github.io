import 'package:flutter/material.dart';

import 'widgets/scaffold_session.dart';

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const aboutMe =
        'Experiência de 10 anos em desenvolvimento de software utilizando C# .Net com os ORM’s Entity Framework, Dapper e ADO.Net junto aos bancos de dados Microsoft SQL Server, MySql e Oracle Sql, sendo que durante 5 anos trabalhei em projetos full stack utilizando Angular para front end, nos últimos anos atuando como líder técnico e desenvolvedor em aplicações mobile utilizando Flutter. \n\nGraduado em Ciência da Computação pela UNIVALI.\nPós Graduado em Análise, Projeto e Gerência de Sistemas pela Uniderp.\nConhecimentos:\n- Back-end: C#, .NET, .NET Core, .NET MVC, .NET WebForms, WebApi.\n- Front-end: TypeScript, JavaScript, Angular, React.\n- Mobile: Xamarin, Flutter, Ionic.\n- Banco de dados: Microsoft SQL Server, Oracle SQL, MySql, PostgreSQL. \n- Liderança de equipe;\n- Análise de ponto de função;\n- ITIL;\n- LGPD;\n- Métodologia ágil;\n- Scrum;\n- Kanban;\n- Planning Poker;';

    return ScaffoldSession(
      title: 'Sobre',
      color: Theme.of(context).colorScheme.primaryContainer,
      body: const Row(
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
    );
  }
}
