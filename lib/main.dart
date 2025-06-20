import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [CupertinoRadio].

void main() => runApp(const CupertinoRadioApp());

class CupertinoRadioApp extends StatelessWidget {
  const CupertinoRadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Material vs Cupertino Comparison'),
        ),
        child: SafeArea(child: RadioComparisonExample()),
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class RadioComparisonExample extends StatefulWidget {
  const RadioComparisonExample({super.key});

  @override
  State<RadioComparisonExample> createState() => _RadioComparisonExampleState();
}

class _RadioComparisonExampleState extends State<RadioComparisonExample> {
  SingingCharacter? _cupertinoCharacter = SingingCharacter.lafayette;
  SingingCharacter? _materialCharacter = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row: Cupertino Radio Buttons
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Text(
                'Cupertino Style',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CupertinoListSection(
              children: <Widget>[
                CupertinoListTile(
                  title: const Text('Lafayette'),
                  leading: CupertinoRadio<SingingCharacter>(
                    value: SingingCharacter.lafayette,
                    groupValue: _cupertinoCharacter,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _cupertinoCharacter = value;
                      });
                    },
                  ),
                ),
                CupertinoListTile(
                  title: const Text('Thomas Jefferson'),
                  leading: CupertinoRadio<SingingCharacter>(
                    value: SingingCharacter.jefferson,
                    groupValue: _cupertinoCharacter,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _cupertinoCharacter = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),

        // Second row: Material Radio Buttons
        Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                child: Text(
                  'Material Style',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  children: [
                    RadioListTile<SingingCharacter>(
                      title: const Text('Lafayette'),
                      value: SingingCharacter.lafayette,
                      groupValue: _materialCharacter,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _materialCharacter = value;
                        });
                      },
                    ),
                    RadioListTile<SingingCharacter>(
                      title: const Text('Thomas Jefferson'),
                      value: SingingCharacter.jefferson,
                      groupValue: _materialCharacter,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _materialCharacter = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
