import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:templete/db/isar/services/isar_services.dart';
import 'package:templete/db/isar/settings.dart';
import 'package:templete/db/isar_db.dart';
import 'package:templete/provider/functions.dart';
import 'package:templete/theme/theme.dart';

void main() async {
  final settings = Settings(theme: 'true', id: 1, isDark: true);
  db = await Isar.open([SettingsSchema], inspector: !kReleaseMode);

  final String boolValue;

  //   final settings = Settings(theme: 'true', id: 1);

  // await db.writeTxn(() => db.settings.put(settings));
  final test = await db.settings.get(1);
  if (test == null) {
    await db.writeTxn(() => db.settings.put(settings));
  }

  // boolValue = test!.theme.toString();
  final isDark = test!.isDark;

  runApp(
    //boolValue = test!.theme.toString();
    ProviderScope(
        child: MyApp(
      boolValue: 'true',
      isDark: isDark,
    )),
  );
}

class MyApp extends StatelessWidget {
  final String? boolValue;
  bool isDark;
  MyApp({super.key, required this.boolValue, required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      //print(ref.watch(themeProviderTest));
      // final lol;
      // ref.watch(themeProviderTest).toString() == 'true'
      //     ? lol = true
      //     : lol = false;

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: lol == null ? MyThemes.darkTheme : MyThemes.lightTheme,

        theme: ref
                .watch(settingsStreamProvider)
                .when(data: (data) {}, error: (e, t) {}, loading: () => {})
            ? MyThemes.darkTheme
            : MyThemes.lightTheme,
        //themeMode: ThemeMode.system,
        home: MyhomePage(
          isDark: isDark,
        ),
      );
    });
  }
}

class MyhomePage extends ConsumerWidget {
  MyhomePage({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'dart theme'
        : 'white theme';

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        leading: Switch.adaptive(
          value: ref.watch(themeProviderTest) ?? isDark,
          onChanged: (value) async {
            final settings =
                Settings(theme: value.toString(), id: 1, isDark: value);

            await db.writeTxn(() => db.settings.put(settings));

            final temp = await db.settings.get(1);
            ref.read(themeProviderTest.notifier).state = temp!.isDark;
            //debugPrint(temp!.theme.toString());

            // ref.read(themeProvider.select((value) => temp!.theme.toString()));

            // ref.read(themeProviderTest.notifier).state =
            //     !ref.watch(themeProviderTest ?? true);

            //IsarService().createTheme(Settings(theme: value.toString()));
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(ref.watch(themeProviderTest).toString()),
          ),
        ],
      ),
    );
  }
}
