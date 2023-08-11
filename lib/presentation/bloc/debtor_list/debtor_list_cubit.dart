
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:telecell_price_checker/data/datasources/debtor_list_api_services.dart';
import 'package:telecell_price_checker/data/models/debtor_list_model.dart';


part 'debtor_list_state.dart';

class DebtorListCubit extends Cubit<DebtorListState> {
  DebtorListCubit() : super(const DebtorListLoading());

  void onGetDebtorList() async {
    final List<DebtorListModel> debtorlist = await getDebtorList();

    emit(DebtorListLoaded(debtorList: debtorlist));
  }
}
