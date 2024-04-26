import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";
import "package:way_finder/app_provider.dart";

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _controller = TextEditingController();
  bool _isEnoughPoints = false;

  @override
  void initState() {
    final globalState = context.read<AppProvider>();

    // If the points amount is 0, there's no need to display it in the text field.
    _controller.text = globalState.pointsAmount == 0
        ? ""
        : globalState.pointsAmount.toString();

    _checkPointsAmount(globalState);

    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        globalState.pointsAmount = int.parse(_controller.text);
      }

      _checkPointsAmount(globalState);
    });

    super.initState();
  }

  /// Checks the amount of points and updates the [_isEnoughPoints] state.
  void _checkPointsAmount(AppProvider globalState) {
    if (globalState.pointsAmount >= 3 && !_isEnoughPoints) {
      setState(() => _isEnoughPoints = true);
    } else if (globalState.pointsAmount < 3 && _isEnoughPoints) {
      setState(() => _isEnoughPoints = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final globalState = context.watch<AppProvider>();

    return Column(
      children: <Widget>[
        TextField(
          controller: _controller,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text("Liczba punktów"),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Widoczność punktów:",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Slider(
          min: 30,
          max: 255,
          value: globalState.opacity.toDouble(),
          onChanged: (value) => globalState.opacity = value.round(),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.search_rounded),
            label: const Text("Znajdź trasę"),
            onPressed: _isEnoughPoints
                ? () {
                    globalState.isPathVisible.value = true;
                    globalState.newPathNotifier.value = true;
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
