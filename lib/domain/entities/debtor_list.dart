import 'package:equatable/equatable.dart';

class DebtorListEntity extends Equatable {
  final String debtor;

  const DebtorListEntity({required this.debtor});

  @override

  List<Object?> get props => [debtor];
}
