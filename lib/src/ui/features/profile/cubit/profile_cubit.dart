import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter_project/src/data/data.dart';

part 'profile_state.dart';

@Injectable()
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    fetchData();
  }

  void fetchData() {
    emit(ProfileLoading());
    final mockData = [
      Item('Activity 1', 10),
      Item('Activity 2', 10),
      Item('Activity 3', 10)
    ];
    emit(ProfileLoaded(mockData));
  }
}
