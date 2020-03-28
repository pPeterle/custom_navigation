library custom_navigation;

import 'package:flutter/material.dart';

class PaginasWidget extends StatelessWidget {
  @required final List<Widget> children;
  final int paginaAtual;

  const PaginasWidget({
    Key key,
    this.paginaAtual = 0,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children
          .map(
            (c) => AnimatedOpacity(
              duration: Duration(
                milliseconds: 400,
              ),
              opacity: children.indexOf(c) == paginaAtual ? 1 : 0,
              curve: Curves.easeOut,
              child: Visibility(
                child: c,
                visible: children.indexOf(c) == paginaAtual,
                maintainState: true,
              ),
            ),
          )
          .toList(),
    );
  }
}
