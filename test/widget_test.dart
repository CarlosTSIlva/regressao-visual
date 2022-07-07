import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:poc_flutter_print/main.dart';

void main() {
  testWidgets('Golden test', (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidget(const MyApp());
    await expectLater(
        find.byType(MyApp), matchesGoldenFile('../test/golden/home.png'));
  });

  String _buildDeviceName(String name, Device device) =>
      '../test/golden/${name}__${device.name}.png';
  testWidgets(
    'Golden test2',
    (WidgetTester tester) async => {
      await GoldenToolkit.runWithConfiguration(
        () async {
          TestWidgetsFlutterBinding.ensureInitialized();

          await loadAppFonts();
          await tester.pumpWidget(const MyApp());
        },
        config: GoldenToolkitConfiguration(
          deviceFileNameFactory: _buildDeviceName,
        ),
      )
    },
  );

  // testWidgets('Golden test2', (WidgetTester tester) async {
  //   const homeScreen = MyApp();

  //   await tester.pumpWidgetBuilder(
  //     homeScreen,
  //     // 'katokMaterialAppWrapper' is a MaterialApp wrapper which ensures that the widget
  //     // under test will use the same theme and localization that is used in the real app.
  //   );

  //   await multiScreenGolden(
  //     tester,
  //     'home_screen',
  //     devices: devicesWithDifferentTextScales,
  //   );
  // });
}
