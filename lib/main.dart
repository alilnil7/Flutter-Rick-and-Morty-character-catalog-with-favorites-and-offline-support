import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/character_list/character_list_cubit.dart';
import 'business_logic/favorites/favorites_cubit.dart';
import 'presentation/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CharacterListCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
      ],
      child: MaterialApp(
        title: 'Rick and Morty',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}