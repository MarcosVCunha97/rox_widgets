
class FetchDataStatusModel {
  bool isLoading = false;
  bool hasError = false;
  bool isEmpty = false;

  FetchDataStatusModel({
    this.isLoading = false,
    this.hasError = false,
    this.isEmpty = false,
  });
}