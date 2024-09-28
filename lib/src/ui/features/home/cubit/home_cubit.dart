import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter_project/src/data/data.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final IMockRepository repository;
  HomeCubit({required this.repository}) : super(HomeInitial()) {
    fetchData();
  }

  void fetchData() async {
    emit(HomeLoading());
    final mockData = await repository.getMockItems();
    if (!isClosed) {
      emit(HomeLoaded(mockData));
    }
  }
}
