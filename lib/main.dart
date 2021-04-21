import 'package:flutter/material.dart';
import 'package:flutter_applicaton_1/bloc/pokemon_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/app_navigator.dart';
import 'package:flutter_application_1/bloc/nav_cubit.dart';
import 'package:flutter_application_1/bloc/pokemon_bloc.dart';
import 'package:flutter_application_1/bloc/pokemon_event.dart';

import 'bloc/pokemon_details_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(
            create: (context) =>
                NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
        BlocProvider(create: (context) => pokemonDetailsCubit)
      ], child: AppNavigator()),
    );
  }
}