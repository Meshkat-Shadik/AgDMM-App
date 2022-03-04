import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LanguageCubit extends HydratedCubit<bool> {
  LanguageCubit() : super(false);
  void toggleLang({required bool value}) {
    emit(value);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isBan'] as bool;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    // ignore: unnecessary_cast
    return {'isBan': state} as Map<String, dynamic>;
  }
}
