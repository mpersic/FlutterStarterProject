import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_starter_project/src/core/core.dart';
import 'package:flutter_starter_project/src/ui/ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.locateService<SettingsCubit>(),
      child: const _SettingsContentView(),
    );
  }
}

class _SettingsContentView extends StatelessWidget {
  const _SettingsContentView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.settings,
        onActionIconNavigate: () =>
            context.pushNamed(Routes.profilePage.routeName),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return ListView(
            children: [
              ListTile(
                title: Text(
                  l10n.darkMode,
                  style: Fonts.poppinsMedium,
                ),
                trailing: Switch(
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (value) => appBloc.add(ThemeChanged(value)),
                ),
              ),
              ListTile(
                title: Text(l10n.language),
                trailing: DropdownButton<String>(
                  value: state.locale.languageCode,
                  onChanged: (String? newValue) {
                    appBloc.add(LocaleChanged(newValue!));
                  },
                  items: AppLocalizations.supportedLocales
                      .map<DropdownMenuItem<String>>(
                    (Locale locale) {
                      return DropdownMenuItem<String>(
                        value: locale.languageCode,
                        child: Text(
                          locale.languageCode,
                          style: Fonts.poppinsBold,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
