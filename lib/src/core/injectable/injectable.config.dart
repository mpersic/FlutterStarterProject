// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data.dart' as _i388;
import '../../data/repositories/mock/mock_repository.dart' as _i29;
import '../../domain/services/mock/mock_service.dart' as _i266;
import '../../ui/features/home/cubit/home_cubit.dart' as _i391;
import '../../ui/features/onboarding/cubit/onboarding_cubit.dart' as _i443;
import '../../ui/features/profile/cubit/profile_cubit.dart' as _i965;
import '../../ui/features/settings/cubit/settings_cubit.dart' as _i319;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i319.SettingsCubit>(() => _i319.SettingsCubit());
  gh.factory<_i965.ProfileCubit>(() => _i965.ProfileCubit());
  gh.factory<_i443.OnboardingCubit>(() => _i443.OnboardingCubit());
  gh.factory<_i29.IMockRepository>(() => _i29.MockRepository());
  gh.factory<_i391.HomeCubit>(
      () => _i391.HomeCubit(repository: gh<_i388.IMockRepository>()));
  gh.factory<_i266.IMockService>(
      () => _i266.MockService(repository: gh<_i388.IMockRepository>()));
  return getIt;
}
