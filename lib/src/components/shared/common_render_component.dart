// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'components.dart';

class CommonRenderComponent extends StatelessWidget {
  CommonRenderComponent(
      {super.key,
      required this.httpStatus,
      required this.child,
      required this.loading,
      this.error,
      this.fail});

  HttpStatus httpStatus;
  Widget child;
  Widget loading;
  Widget? error;
  Widget? fail;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      switch (httpStatus) {
        case HttpStatus.none:
          return Container();
        case HttpStatus.loading:
          return loading;
        case HttpStatus.success:
          return child;
        case HttpStatus.fail:
          return fail ??
              const CommonFail(texto: 'Ops... Houve um erro Inesperado');
        case HttpStatus.error:
          return error ??
              const CommonError(
                texto: 'Não foram encontradas informações',
              );
      }
    });
  }
}
