import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:telecell_price_checker/presentation/bloc/debtor_list/debtor_list_cubit.dart';
import 'package:telecell_price_checker/presentation/screens/data_screen.dart';

import '../bloc/cubit/sales_data_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final debtorList = context
            .read<DebtorListCubit>()
            .state
            .debtorList
            ?.map((item) => SearchFieldListItem<String>(item.debtor))
            .toList() ??
        [];

    return Column(children: [
      Container(
        height: (MediaQuery.of(context).size.height * 1 / 4),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.lightBlue),
        child: Center(
          child: Text(
            'What do you want to search for today',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      const SizedBox(height: 24),
      SearchField(
          suggestions: debtorList,
          hint: 'Search debtor',
          searchStyle: TextStyle(
            fontSize: 18,
            color: Colors.black.withOpacity(0.8),
          ),
          searchInputDecoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          maxSuggestionsInViewPort: 6,
          itemHeight: 50,
          onSuggestionTap: (SearchFieldListItem<String> suggestion) {
            String debtor = suggestion.searchKey;
            context.read<SalesDataCubit>().onLoadingSalesData(debtor);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const DataScreen(),
            ));
          }),
    ]);
  }
}
