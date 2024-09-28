import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/src/core/core.dart';
import 'package:flutter_starter_project/src/ui/components/components.dart';
import 'package:flutter_starter_project/src/ui/features/profile/cubit/cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (_) => Injector.locateService<ProfileCubit>(),
      child: NavigatedPageLayout(
        title: l10n.profile,
        child: const _ProfileContentView(),
      ),
    );
  }
}

class _ProfileContentView extends StatelessWidget {
  const _ProfileContentView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileLoaded) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.quantity.toString()),
              );
            },
          );
        } else if (state is ProfileError) {
          return Center(
            child: Text('${l10n.error}: ${state.message}'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
