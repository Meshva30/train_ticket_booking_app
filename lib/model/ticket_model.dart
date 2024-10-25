class Ticket {
  final String trainName;
  final double price;
  final String departureCity;
  final String arrivalCity;
  final String departureTime;
  final String arrivalTime;
  final String departureDate;
  final String arrivalDate;
  final String duration;
  final String date;

  Ticket({
    required this.trainName,
    required this.price,
    required this.departureCity,
    required this.arrivalCity,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureDate,
    required this.arrivalDate,
    required this.duration,
    required this.date,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      trainName: json['train_name'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'],
      departureCity: json['departure_city'],
      arrivalCity: json['arrival_city'],
      departureTime: json['departure_time'],
      arrivalTime: json['arrival_time'],
      departureDate: json['departure_date'],
      arrivalDate: json['arrival_date'],
      duration: json['duration'],
      date: json['date'],
    );
  }
}

class TrainData {
  final List<Ticket> trains;

  TrainData({required this.trains});

  factory TrainData.fromJson(Map<String, dynamic> json) {
    var trainList = json['trains'] as List;
    List<Ticket> trainItems = trainList.map((i) => Ticket.fromJson(i)).toList();

    return TrainData(trains: trainItems);
  }
}