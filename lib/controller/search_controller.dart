import 'package:get/get.dart';

class TrainSearchController extends GetxController {
  var fromLocation = ''.obs;
  var toLocation = ''.obs;
  var selectedDate = DateTime.now().obs;
  var trainList = <String>[].obs; // Specify the type of trainList as List<String>

  void searchTrains() {
    // Fetch train list based on fromLocation, toLocation, and selectedDate
    trainList.value = fetchTrains(fromLocation.value, toLocation.value, selectedDate.value);
  }

  // Simulated fetchTrains method
  List<String> fetchTrains(String from, String to, DateTime date) {
    // Check if from and to locations are empty
    if (from.isEmpty || to.isEmpty) {
      // Return an empty list if either location is not provided
      return [];
    }

    // Simulated data - Replace this with actual API or database fetching logic
    return [
      'Express Train - $from to $to on ${date.toLocal().toString().split(' ')[0]}',
      'Local Train - $from to $to on ${date.toLocal().toString().split(' ')[0]}',
      'Superfast Train - $from to $to on ${date.toLocal().toString().split(' ')[0]}',
    ];
  }

  // Method to update the departure location
  void updateFromLocation(String location) {
    fromLocation.value = location;
  }

  // Method to update the destination location
  void updateToLocation(String location) {
    toLocation.value = location;
  }

  // Method to update the selected date
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }
}
