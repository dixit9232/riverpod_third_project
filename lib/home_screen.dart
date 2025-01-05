import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_third_project/slider_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                print('Widget : 2');
                final showPassword = ref.watch(sliderProvider.select((value) => value.showPassword));

                return IconButton(
                    onPressed: () {
                      final stateProvider = ref.read(sliderProvider.notifier);
                      stateProvider.state = stateProvider.state.copyWith(showPassword: !showPassword);
                    },
                    icon: Icon(showPassword ? Icons.remove_red_eye : Icons.visibility_off));
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                print("Widget : 1");
                final slider = ref.watch(sliderProvider.select((value) => value.slider,));
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.red.withValues(alpha: slider),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final slider = ref.watch(sliderProvider.select((value) => value.slider,));
                return SizedBox(
                  width: 250,
                  child: Slider(
                    value: slider,
                    onChanged: (value) {
                      final stateProvider = ref.read(sliderProvider.notifier);
                      stateProvider.state = stateProvider.state.copyWith(slider: value);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
