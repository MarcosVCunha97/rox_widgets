
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:rox/models/fetch_data_status.dart';

mixin FetchDataMixin {
  final Rx<FetchDataStatusModel> status = FetchDataStatusModel().obs;

  int counter = 0;

  bool get isLoading => status.value.isLoading;
  bool get hasError => status.value.hasError;
  bool get isEmpty => status.value.isEmpty;

  set isLoading (bool newVal) => status.update((val) => val?.isLoading = newVal);
  set hasError (bool newVal) => status.update((val) => val?.hasError = newVal);
  set isEmpty (bool newVal) => status.update((val) => val?.isEmpty = newVal);


  Future<void> showLoadingWhileRunning(Future<void> Function() fn) async {
    isLoading = true;
    counter++;
    try {
      await fn();
    } finally {
      counter--;
      if(counter == 0){
        isLoading = false;
      }
    }
  }
}
