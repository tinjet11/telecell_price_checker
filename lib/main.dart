import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecell_price_checker/presentation/screens/home_screen.dart';
import 'domain/bloc/cubit/sales_data_cubit.dart';
import 'domain/bloc/debtor_list/debtor_list_cubit.dart';

Future<void> main() async {
  runApp(MaterialApp(theme: ThemeData(), home: const MainApp(),debugShowCheckedModeBanner: false));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DebtorListCubit()..onGetDebtorList(),
        ),
        BlocProvider(
          create: (context) => SalesDataCubit(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            title: const Text(
              'Telecell Marketing & Services',
              style: TextStyle(color: Colors.black),
            ),
            
          ),
          body: BlocBuilder<DebtorListCubit, DebtorListState>(
            builder: (context, state) {
              if (state is DebtorListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DebtorListLoaded) {
                return const HomeScreen();
              } else {
                return const Text("Something went wrong");
              }
            },
          ),
        ),
      ),
    );
  }
}
