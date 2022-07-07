import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// Use the commented function signature for recent beta flutter versions
// Future<void> testExecutable(FutureOr<void> Function() testMain) =>
Future<void> main(testMain) async => {
      await GoldenToolkit.runWithConfiguration(
        () async {
          TestWidgetsFlutterBinding.ensureInitialized();

          await loadAppFonts();
          await testMain();
        },
        config: GoldenToolkitConfiguration(
          deviceFileNameFactory: _buildDeviceName,
        ),
      )
    };

String _buildDeviceName(String name, Device device) =>
    'goldens/${name}__${device.name}.png';
