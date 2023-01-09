import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rox/models/fetch_data_status.dart';
import 'package:rox/widgets/error_widgets/errors/rox_error.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    Key? key,
    required this.status,
    required this.child,
    this.loadingWidget,
    this.showAsOverlay = false,
    this.showAppBar = false,
    // this.onWillPop,
  }) : super(key: key);

  final Rx<FetchDataStatusModel> status;

  final Widget child;

  /// Se Loading widget for diferente de null, ele será usado no lugar do default
  final Widget? loadingWidget;

  /// Se showLoadingIndicator == false, o LoadingIndicator não será exibido
  // final Future<bool> Function()? onWillPop;
  /// Se overlay for true, a página por trás será mostrada e o loading ficara por cima, com barreira modal
  final bool showAsOverlay;

  // Indica se deve mostrar a appbar com botão de voltar ao mostrar widgets de erro e página vazia
  final bool showAppBar;

  bool get isLoading => status.value.isLoading;
  bool get hasError => status.value.hasError;
  bool get isEmpty => status.value.isEmpty;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (status.value.isLoading) {
          return false;
        }
        return true;
      },
      child: SizedBox.expand(
        child: Obx(() => Stack(
              children: [
                _buildBody(),
                if (isLoading) _buildLoading(),
              ],
            )),
      ),
    );
  }

  Widget _buildLoading() {
    if (Get.context != null) FocusScope.of(Get.context!).unfocus();
    return Stack(
      children: [
        ModalBarrier(
          dismissible: false,
          color: showAsOverlay ? Colors.black.withOpacity(0.3) : Colors.white,
        ),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: () {
              if (loadingWidget != null) return loadingWidget!;
              return const CircularProgressIndicator();
            }.call(),
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    if (isLoading && !showAsOverlay) {
      return const SizedBox.shrink();
    } else if (!isEmpty && !hasError) {
      return child;
    } else {
      return Scaffold(
        appBar: showAppBar ? AppBar() : null,
        body: isEmpty ? RoxError.defaultEmptyState() : RoxError.defaultError(),
      );
    }
  }
}
