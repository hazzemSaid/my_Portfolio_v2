/// Client entrypoint for the Jaspr portfolio app.
library;

import 'package:jaspr/client.dart';

void main() {
  Jaspr.initializeApp();
  runApp(const ClientApp());
}
