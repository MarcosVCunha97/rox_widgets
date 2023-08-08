import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rox/models/fetch_data_status.dart';
import 'package:rox/widgets/error_widgets/errors/rox_error.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    Key? key,
    this.status,
    this.statusList,
    this.child,
    this.loadingWidget,
    this.showAsOverlay = false,
    this.showAppBar = false,
    this.buildChild,
    // this.onWillPop,
  })  : assert(status != null || (statusList != null && statusList.length > 0),
            'status or statusList must be not null'),
        super(key: key);

  final Rx<FetchDataStatusModel>? status;
  final List<Rx<FetchDataStatusModel>>? statusList;

  @Deprecated('Use buildChild instead')
  final Widget? child; // deprecated

  final Function<Widget>()? buildChild;

  /// Se Loading widget for diferente de null, ele será usado no lugar do default
  final Widget? loadingWidget;

  /// Se showLoadingIndicator == false, o LoadingIndicator não será exibido
  // final Future<bool> Function()? onWillPop;
  /// Se overlay for true, a página por trás será mostrada e o loading ficara por cima, com barreira modal
  final bool showAsOverlay;

  // Indica se deve mostrar a appbar com botão de voltar ao mostrar widgets de erro e página vazia
  final bool showAppBar;

  bool get isLoading {
    if (status != null) {
      return status!.value.isLoading;
    } else if (statusList != null) {
      return statusList!.any((element) => element.value.isLoading);
    }
    return false;
  }

  bool get hasError {
    if (status != null) {
      return status!.value.hasError;
    } else if (statusList != null) {
      return statusList!.any((element) => element.value.hasError);
    }
    return false;
  }

  bool get isEmpty {
    if (status != null) {
      return status!.value.isEmpty;
    } else if (statusList != null) {
      return statusList!.any((element) => element.value.isEmpty);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isLoading) {
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
      if (buildChild != null) {
        return buildChild!();
      } else {
        return child ?? const SizedBox.shrink();
      }
    } else {
      return Scaffold(
        appBar: showAppBar ? AppBar() : null,
        body: isEmpty ? RoxError.defaultEmptyState() : RoxError.defaultError(),
      );
    }
  }
}
