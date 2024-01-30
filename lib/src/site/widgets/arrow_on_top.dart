import 'package:flutter/material.dart';

class ArrowOnTop extends StatefulWidget {
  const ArrowOnTop({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  State<ArrowOnTop> createState() => _ArrowOnTopState();
}

class _ArrowOnTopState extends State<ArrowOnTop> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: widget.onPressed,
          onHover: (isHovering) {
            if (isHovering) {
              setState(() {
                isHover = true;
              });
            } else {
              setState(() {
                isHover = false;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              boxShadow: isHover
                  ? [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.primary,
                        blurRadius: 12.0,
                        offset: const Offset(2.0, 3.0),
                      )
                    ]
                  : [],
            ),
            child: Icon(
              Icons.arrow_drop_up_outlined,
              color: Theme.of(context).colorScheme.onSecondary,
              size: MediaQuery.of(context).size.height * 0.05,
            ),
          ),
        ),
      ],
    );
  }
}
