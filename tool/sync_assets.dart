import 'dart:io';

/// Syncs `jaspr_portfolio/assets/` -> `jaspr_portfolio/web/assets/`.
///
/// Jaspr serves static files from the `web/` folder, so this script makes your
/// existing Flutter-style `assets/` folder available to the browser.
///
/// Run from `jaspr_portfolio/`:
///   dart run tool/sync_assets.dart
Future<void> main() async {
  final root = Directory.current;
  final source = Directory(_join(root.path, 'assets'));
  final target = Directory(_join(root.path, 'web', 'assets'));

  if (!source.existsSync()) {
    stderr.writeln('Source folder not found: ${source.path}');
    exitCode = 2;
    return;
  }

  target.createSync(recursive: true);

  var copied = 0;
  var skipped = 0;

  for (final entity in source.listSync(recursive: true, followLinks: false)) {
    if (entity is! File) continue;

    final relative = entity.path.substring(source.path.length + 1);
    final outFile = File(_join(target.path, relative));
    outFile.parent.createSync(recursive: true);

    final shouldCopy = _shouldCopy(entity, outFile);
    if (!shouldCopy) {
      skipped++;
      continue;
    }

    outFile.writeAsBytesSync(entity.readAsBytesSync());
    copied++;
  }

  stdout.writeln('Asset sync complete.');
  stdout.writeln('Copied: $copied');
  stdout.writeln('Skipped (up-to-date): $skipped');
  stdout.writeln('Output dir: ${target.path}');
}

bool _shouldCopy(File input, File output) {
  if (!output.existsSync()) return true;
  try {
    final inStat = input.statSync();
    final outStat = output.statSync();
    // Copy when input is newer or sizes differ.
    return inStat.modified.isAfter(outStat.modified) || inStat.size != outStat.size;
  } catch (_) {
    return true;
  }
}

String _join(String a, [String? b, String? c, String? d]) {
  final parts = [a, if (b != null) b, if (c != null) c, if (d != null) d];
  return parts.join(Platform.pathSeparator);
}
