import 'package:telecell_price_checker/domain/entities/debtor_list.dart';

class DebtorListModel extends DebtorListEntity {
  const DebtorListModel({
    required String debtor,
  }) : super(debtor: debtor);

  factory DebtorListModel.fromJson(Map<String, dynamic> map) {
    return DebtorListModel(
      debtor: map['debtor'] ?? "",
    );
  }

  factory DebtorListModel.fromEntity(DebtorListEntity entity) {
    return DebtorListModel(debtor: entity.debtor);
  }
}
