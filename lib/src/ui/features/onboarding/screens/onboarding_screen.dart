import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/src/core/core.dart';
import 'package:flutter_starter_project/src/ui/components/components.dart';
import 'package:flutter_starter_project/src/ui/features/onboarding/cubit/cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.locateService<OnboardingCubit>(),
      child: const OnboardingContentView(),
    );
  }
}

class OnboardingContentView extends StatefulWidget {
  const OnboardingContentView({super.key});

  @override
  State<OnboardingContentView> createState() => _OnboardingContentViewState();
}

class _OnboardingContentViewState extends State<OnboardingContentView> {
  Future<void> completeOnboarding(BuildContext context) async {
    if (mounted) {
      context.read<AppBloc>().add(OnboardingChanged(false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(title: l10n.onboarding),
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Text(l10n.welcomeToTheApp),
                const Spacer(),
                CustomButton(
                  onPressed: () => completeOnboarding(context),
                  text: l10n.completeOnboarding,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
