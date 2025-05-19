// hiit_setup_view.dart
import 'package:flutter/material.dart';
import 'package:kobe/core/colors.dart';
import 'package:kobe/core/strings.dart';
import 'package:kobe/features/hiit/models/hiit_config.dart';
import 'package:kobe/widgets/gradient_button.dart';

class HiitSetupView extends StatefulWidget {
  const HiitSetupView({super.key});

  @override
  State<HiitSetupView> createState() => _HiitSetupViewState();
}

class _HiitSetupViewState extends State<HiitSetupView> {
  HiitConfig config = HiitConfig();
  bool showWarmup = true;
  bool showCooldown = true;

  void _editDuration(
      String label, Duration current, ValueChanged<Duration> onChanged) async {
    final result = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: current.inMinutes, minute: current.inSeconds % 60),
    );
    if (result != null) {
      onChanged(
        Duration(minutes: result.hour, seconds: result.minute),
      );
    }
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(KobeStrings.flowHiit),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: KobeColors.textDark,
      ),
      body: ListView(
        children: [
          if (showWarmup)
            DurationInputSection(
              label: KobeStrings.warmUpTime,
              value: config.warmUp,
              onChanged: (value) =>
                  setState(() => config = config.copyWith(warmUp: value)),
              onDelete: () => setState(() => showWarmup = false),
              onTap: _editDuration,
              formatter: _formatDuration,
            ),
          DurationInputSection(
            label: KobeStrings.workTime,
            value: config.work,
            onChanged: (value) => setState(
              () => config = config.copyWith(work: value),
            ),
            onTap: _editDuration,
            formatter: _formatDuration,
          ),
          DurationInputSection(
            label: KobeStrings.restTime,
            value: config.rest,
            onChanged: (value) => setState(
              () => config = config.copyWith(rest: value),
            ),
            onTap: _editDuration,
            formatter: _formatDuration,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  KobeStrings.rounds,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => setState(
                        () =>
                            config = config.copyWith(rounds: config.rounds - 1),
                      ),
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      '${config.rounds}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    IconButton(
                      onPressed: () => setState(
                        () =>
                            config = config.copyWith(rounds: config.rounds + 1),
                      ),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
          if (showCooldown)
            DurationInputSection(
              label: KobeStrings.cooldownTime,
              value: config.coolDown,
              onChanged: (value) =>
                  setState(() => config = config.copyWith(coolDown: value)),
              onDelete: () => setState(() => showCooldown = false),
              onTap: _editDuration,
              formatter: _formatDuration,
            ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: GradientButton(
              text: KobeStrings.startWorkout,
              onPressed: () {
                // TODO: Navigate to timer screen
              },
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}

class DurationInputSection extends StatelessWidget {
  const DurationInputSection({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.onDelete,
    required this.onTap,
    required this.formatter,
  });

  final String label;
  final Duration value;
  final ValueChanged<Duration> onChanged;
  final VoidCallback? onDelete;
  final void Function(String, Duration, ValueChanged<Duration>) onTap;
  final String Function(Duration) formatter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () => onTap(
                    label,
                    value,
                    onChanged,
                  ),
                  child: Text(
                    formatter(value),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (onDelete != null)
            TextButton(
              onPressed: onDelete,
              style: TextButton.styleFrom(
                backgroundColor: KobeColors.background.withOpacity(0.1),
              ),
              child: const Text(KobeStrings.delete),
            ),
        ],
      ),
    );
  }
}
