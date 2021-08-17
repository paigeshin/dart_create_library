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
