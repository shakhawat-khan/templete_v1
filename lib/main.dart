import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:templete/provider/functions.dart';
import 'package:templete/theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ref.watch(ThemeProviderTest) == true
          ? MyThemes.darkTheme
          : MyThemes.lightTheme,
      //themeMode: ThemeMode.system,
      home: const MyhomePage(),
    );
  }
}

class MyhomePage extends ConsumerWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'dart theme'
        : 'white theme';

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        leading: Switch.adaptive(
          value: ref.watch(ThemeProviderTest),
          onChanged: (value) {
            ref.read(ThemeProviderTest.notifier).update((state) => value);
          },
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(themeProvider.notifier).changeTheme();
            },
            child: const Text('data change'),
          ),
          Center(
            child: Text(ref.watch(ThemeProviderTest).toString()),
          ),
        ],
      ),
    );
  }
}
