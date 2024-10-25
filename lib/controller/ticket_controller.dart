import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/ticket_model.dart';


class TicketController extends GetxController {
  var trains = <Ticket>[].obs;
  var filteredTrains = <Ticket>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTickets();
  }

  void loadTickets() async {
    try {
      isLoading(true);
      // Load JSON file
      String jsonString = await rootBundle.loadString('assets/ticket.json');
      print('Loaded JSON: $jsonString'); // Debugging statement

      // Decode JSON
      Map<String, dynamic> jsonData = json.decode(jsonString);
      print('Decoded JSON: $jsonData'); // Debugging statement

      // Parse JSON to TrainData
      TrainData trainData = TrainData.fromJson(jsonData);
      trains.value = trainData.trains;
      filteredTrains.value = trains;
      print('Loaded Trains: ${trains.length}'); // Debugging statement
    } catch (e) {
      print("Error loading tickets: $e");
    } finally {
      isLoading(false);
    }
  }


  void filterTicketsByDate(String date) {
    if (date.isEmpty) {
      filteredTrains.value = trains;
    } else {
      filteredTrains.value = trains.where((ticket) => ticket.date == date).toList();
    }
  }
}
