// ignore_for_file: non_constant_identifier_names

class BookModel {
  String? Image;
  String? Name;
  String? type;
  String? price;
  String? date;
 

  BookModel({
    required this.Image,
    required this.Name,
    required this.type,
    required this.price,
    required this.date,
   
  });

  BookModel.fromJson(Map<String, dynamic> json) {
    Image = json['Image'];
    Name = json['Name'];
    type = json['type'];
    price = json['price'];
    date = json['date'];

    // selectedStartingDate = json['selectedStartingDate'].toDate();

 
  }

  Map<String, dynamic> tomap() {
    return {
      'Image': Image,
      'Name': Name,
      'type': type,
      'price': price,
      'date': date,
  
    };
  }
}
