part of 'debtor_list_cubit.dart';

class DebtorListState extends Equatable {
  final List<DebtorListModel> ? debtorList;
  const DebtorListState({this.debtorList});

  @override
  List<Object> get props => [debtorList!];
}

final class DebtorListLoading extends DebtorListState {
  const DebtorListLoading();
}

final class DebtorListLoaded extends DebtorListState {
  const DebtorListLoaded({List<DebtorListModel>? debtorList}): super(debtorList: debtorList);
}
