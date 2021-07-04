class TicketSticker {
  String name;
  String country;
  int price;

  TicketSticker({
    this.name,
    this.price,
    this.country,
  });

  String get qrText => "name:$name, price:$price, country:$country";
}
