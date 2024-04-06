import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/2_Platform%20Widget/materialpage.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/3_Flutter%20Layout/materialpage.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/4_Flutter%20Form/flutter_form.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/5_Advanced%20Flutter%20Form/adv_flutter_form.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/7_REST%20API%20JSON/dicebear_avatar.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/bloc/counter_bloc.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/advanced_homepage.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/contact/contact_viewmode.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/9_OPENAI/screens/home.dart';
import 'package:flutter_archieve/Dropdown%20Global%20State%20Provider/page/homepage.dart';
import 'package:flutter_archieve/Dropdown%20Global%20State%20Provider/providers/user_provider.dart';
import 'package:flutter_archieve/Weather%20API/pages/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/stores/contact.dart'
    as contact_store;
import '2_Flutter Introduction/1_New App/flutter_introduction.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => DatabaseProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => contact_store.Contact(), //ContactProvider(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WeatherPage(),
      ),
    );
  }
}
