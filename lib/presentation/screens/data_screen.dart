import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/cubit/sales_data_cubit.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<SalesDataCubit, SalesDataState>(
        builder: (context, state) {
          if (state is SalesDataLoading) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightBlueAccent,
                title: Text(
                  BlocProvider.of<SalesDataCubit>(context).state.debtor,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightBlueAccent,
                title: Text(
                  BlocProvider.of<SalesDataCubit>(context).state.debtor,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    if (BlocProvider.of<SalesDataCubit>(context)
                        .state
                        .salesData
                        .isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text("No data to be displayed")),
                      )
                    else
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Date')),
                              DataColumn(label: Text('Stock Code')),
                              DataColumn(label: Text('Unit Price')),
                              DataColumn(label: Text('Quantity')),
                              DataColumn(label: Text('Invoice')),
                              DataColumn(label: Text('Debtor')),
                            ],
                            rows: BlocProvider.of<SalesDataCubit>(context)
                                .state
                                .salesData
                                .map((salesData) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(salesData.date)),
                                  DataCell(Text(salesData.stockcode)),
                                  DataCell(Text(salesData.unitprice)),
                                  DataCell(Text(salesData.quantity.toString())),
                                  DataCell(Text(salesData.invoice)),
                                  DataCell(Text(salesData.debtor)),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
