import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  // https://flutter.dev/docs/cookbook/forms/validation
  @override
  Widget build(BuildContext context) {
    final ticket = TicketSticker(name: "name", price: 100, country: "baghdad");
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Wrap(
            children: [
              Card(
                elevation: 10,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      QrImage(
                        data: "name: mohammed,",
                        version: QrVersions.auto,
                        size: 200,
                      ),
                      Text("${ticket.price} \$",
                          style: Theme.of(context).textTheme.headline5),
                      Text("name",
                          style: Theme.of(context).textTheme.headline4),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
