import 'package:flutter/material.dart';
import 'package:rox/widgets/error_widgets/errors/rox_error_widget.dart';

class RoxError {
  static Widget defaultError () => const RoxDefaultErrorWidget(
      title: 'Desculpe, aconteceu um problema',
      description: 'Verifique sua conexão ou tente novamente mais tarde');

  static Widget defaultEmptyState () => const RoxDefaultErrorWidget(
      title: 'Nada para mostrar',
      description: 'Parece que não há nada para mostrar aqui');
}
