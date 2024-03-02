import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';
import 'package:williankirsch/src/models/education_model.dart';

import 'widgets/scaffold_session.dart';

class Education extends StatelessWidget {
  const Education({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldSession(
      title: 'Educação',
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            children: getEducationList()
                .map(
                  (education) => SizedBox(
                    width: constraints.maxWidth / 2.0 - 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          education.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          education.period,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          education.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            onTap: () => goToUrl(education.linkName),
                            child: Text(
                              education.linkName,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
