import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'settings_state.dart';

@Injectable()
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
}
