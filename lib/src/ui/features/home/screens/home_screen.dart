import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_starter_project/src/core/core.dart';
import 'package:flutter_starter_project/src/ui/components/components.dart';
import 'package:flutter_starter_project/src/ui/features/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Injector.locateService<HomeCubit>(),
        child: const _HomePageContentView());
  }
}

class _HomePageContentView extends StatelessWidget {
  const _HomePageContentView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.home,
        onActionIconNavigate: () =>
            context.pushNamed(Routes.profilePage.routeName),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  subtitle: Text(item.quantity.toString()),
                  title: Text(item.name),
                  trailing: Image.asset(Images.apple),
                );
              },
            );
          } else if (state is HomeError) {
            return Center(
              child: Text('${l10n.error}: ${state.message}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
