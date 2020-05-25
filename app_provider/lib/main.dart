import 'package:app_provider/home_incremente_provider.dart';
import 'package:app_provider/incremente_provider.dart';
import 'package:app_provider/incremente_provider_herois.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider<IncrementeProvider>.value(
            value: IncrementeProvider()),
        ChangeNotifierProvider<IncrementeHerois>.value(value: IncrementeHerois()),
      ],
      child: MaterialApp(
        home: HomeIncremente(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
