# Learn How To Publish Library to Pub

https://pub.dev/packages/prompt_king

### Reference

[PromptKing Project Overview](https://www.notion.so/PromptKing-Project-Overview-d462aaf63f3a477b9577e8b43bb82eba)

[var vs final vs const ](https://www.notion.so/var-vs-final-vs-const-c5649ca09e354255892d6919edccd8b1)

[Publish to Dart Pub](https://www.notion.so/Publish-to-Dart-Pub-98ca495c66a24259aba97d07c17e8b46)

### terminal.dart

```dart
import 'dart:io';

import 'option.dart';

class BytesBuilder {}

class Terminal {
  const Terminal(); // If you want to instantiate terminal outside of this class with `Const`, declare it on Class
  //example:
  /*
    final Terminal terminal = const Terminal();
  */

  void printPrompt(String prompt) {
    stdout.writeln(prompt);
  }

  void printOptions(List<Option> options) {
    // for (var i = 0; i < options.length; i++) {
    //   stdout.writeln('[$i] - ${options[i].label}');
    // }
    options.asMap().forEach((index, option) {
      stdout.writeln('[$index] - ${option.label}');
    });
    stdout.writeln('Enter a choice\n');
    stdout.write('>');
  }

  String? collectInput() {
    return stdin.readLineSync();
  }

  void clearScreen() {
    if (Platform.isWindows) {
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }
}
```

### prompter

```dart
import 'option.dart';
import 'terminal.dart';

final Terminal _terminal = const Terminal();

class Prompter {
  bool askBinary(String prompt) {
    final input = _ask('$prompt (y/n)', []);
    return input.contains('y');
  }

  askMultiple(String prompt, List<Option> options) {
    final input = _ask(prompt, options);
    try {
      if (input != null) {
        final index = int.parse(input);
        return options[index].value;
      }
    } catch (err) {
      askMultiple(prompt, options);
    }
  }

  String _ask(String prompt, List<Option> options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOptions(options);
    return _terminal.collectInput() ?? "";
  }
}
```

### option

```dart
// Create Dynami Fields
class Option {
  String label;
  dynamic value;

  Option(this.label, this.value);
}
```

### main

```dart
import "../lib/prompter_paige.dart" show Option, Prompter;

void main() {
  version7();
}

// void version1() {
//   var terminal = Terminal();
//   terminal.clearScreen();
//   terminal.printPrompt("Cleared");
//   var input = terminal.collectInput();
//   print('You just entered: $input');
// }

// void version2() {
//   var terminal = Terminal();
//   var options = [
//     Option('I want red', '#f00'),
//     Option('I want blue', '#00f'),
//   ];
//   terminal.printOptions(options);
//   var response = terminal.collectInput();
//   print(response);
// }

void version3() {
  var options = [
    Option('I want red', '#f00'),
    Option('I want blue', '#00f'),
  ];
  var prompter = Prompter();
  prompter.askMultiple('What color do you want', options);
}

void version4() {
  var options = [
    Option('I want red', '#f00'),
    Option('I want blue', '#00f'),
  ];
  var prompter = Prompter();
  prompter.askMultiple('What color do you want', options);
  prompter.askMultiple('What color do you want', options);
  prompter.askMultiple('What color do you want', options);
  prompter.askMultiple('What color do you want', options);
}

void version5() {
  var options = [
    Option('I want red', '#f00'),
    Option('I want blue', '#00f'),
  ];
  final prompter = Prompter();
  final usersPick = prompter.askMultiple('What color do you like?', options);
  print(usersPick);
}

void version6() {
  final prompter = Prompter();
  final userPick = prompter.askBinary('Do you like dart');
  print(userPick);
}

void version7() {
  final prompter = Prompter();
  prompter.askBinary('prompt  s');
  print(prompter.askBinary('Do you like dart'));
}
```

### one path

```dart
export 'src/option.dart';
export 'src/prompter.dart';
```

```dart
import "../prompter_paige.dart" 
```

⇒ This imports option.dart, and prompter.dart