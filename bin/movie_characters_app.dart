import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:dotenv/dotenv.dart';
import 'package:logger/logger.dart';
import 'package:rename/rename.dart' as rename;

const appName = 'name';
const bundleId = 'bundleId';
const dataAPI = 'dataAPI';

const app = 'app';
const help = 'help';

final argParser = ArgParser()
  ..addOption(app, abbr: 'a', help: 'The name of the app to activate')
  ..addFlag(help, abbr: 'h', help: 'Shows help.', negatable: false);

void main(List<String> arguments) async {
  final logger = Logger(filter: ProductionFilter());
  try {
    final results = argParser.parse(arguments);
    if (results[help] || results.arguments.isEmpty) {
      logger.i(argParser.usage);
      return;
    }

    final app = results['app'];

    final file = File('apps/$app/.env');
    if (!await file.exists()) {
      final dir = Directory('apps');
      final list = await dirContents(dir);
      var errorMessage = 'App with name "$app" does not exist. '
          'Please, select one of the following:';
      for (final element in list) {
        errorMessage += ' \n${element.path.split('/').last}';
      }
      throw FormatException(errorMessage);
    }
    await file.copy('.env');
    var env = DotEnv()..load();
    final mandatoryEnvVariables = [
      appName,
      dataAPI,
      bundleId,
    ];
    if (!env.isEveryDefined(mandatoryEnvVariables)) {
      throw FormatException('Please, make sure that all mandatory'
          ' variables are defined in ${file.path}: $mandatoryEnvVariables');
    }

    final platforms = <rename.Platform>{
      rename.Platform.android,
      rename.Platform.ios,
    };
    //
    await rename.changeAppName(env[appName], platforms);
    await rename.changeBundleId(env[bundleId], platforms);
  } on FormatException catch (e) {
    logger.w('${e.message}\n');
    logger.d(argParser.usage);
  } on Exception catch (e) {
    logger.e(e);
  }
}

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list();
  lister.listen((file) => files.add(file),
      // should also register onError
      onDone: () => completer.complete(files));
  return completer.future;
}
