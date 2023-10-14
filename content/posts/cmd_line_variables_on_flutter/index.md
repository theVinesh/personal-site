---
title: "Command line variables on Flutter using --dart-define"
categories: ["tech", "flutter"]
date: 2021-03-25T04:42:02+05:30
image: "command_line.png"
---

This post explains how to send command line variables and use them with flutter.  

## Why send variables via command line?
Being able to set a variable through command line comes in very handy whenever you want to change the variable depending on the environment/client it's being built for. Without having to change code manually every time.    

A few common use cases would be 
- to configure your app's base URL during build time.
- to use separate API keys or client ids for development and production.

## --dart-define to the rescue
`--dart-define` helps send key-value pairs to flutter at build time.  

All you have to do is run `flutter run` with `--dart-define=<KEY>=<VALUE>` argument.  
If you want to send multiple key-value pairs, just send `--dart-define` multiple times.  

**Example:** 
`flutter run --dart-define=BASE_URL=https://dev.example.com --dart-define=ENABLE_SECRET_FEATURE=true`

> note: `--dart-define` works starting from Flutter 1.17

### Accessing the key-value pairs in code
You can access the data sent via `--dart-define` by using  
`const <DataType>.fromEnvironment(<Key>,{defaultValue:<Default value>})`.  

**Example:** 
- to get `String` value  
`const String.fromEnvironment("BASE_URL")`  
- to get `bool` value  
`const bool.fromEnvironment("ENABLE_SECRET_FEATURE", defaultValue: false)` 

> note: `const` is important. You wouldn't get the value otherwise

### Usage
{{< highlight dart >}}
class BuildConfig {
    static const String BASE_URL = const String.fromEnvironment("BASE_URL");
    static const bool ENABLE_SECRET_FEATURE = 
        const bool.fromEnvironment("ENABLE_SECRET_FEATURE",defaultValue: false);
    static const int ORG_NO = const int.fromEnvironment("ORG_NO");
}
{{< /highlight >}}

{{< highlight dart >}}
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Base Url: ${BuildConfig.BASE_URL}"),
        Text("Enable Feature: ${BuildConfig.ENABLE_SECRET_FEATURE}"),
        Text("Org No: ${BuildConfig.ORG_NO}"),
      ],
    );
  }
}
{{< /highlight >}}
