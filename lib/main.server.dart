/// Server entrypoint for the Jaspr portfolio app.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';

void main() {
  Jaspr.initializeApp();

  runApp(
    Document(
      title: 'Hazem Said - Flutter Developer Portfolio',
      styles: [
        // Base typography & layout (mirrors the existing Jaspr setup).
        css.import('https://fonts.googleapis.com/css?family=Roboto'),
        css('html, body').styles(
          width: 100.percent,
          minHeight: 100.vh,
          padding: .zero,
          margin: .zero,
          fontFamily: const .list([FontFamily('Roboto'), FontFamilies.sansSerif]),
        ),
      ],
      head: [
        // Favicon & web app metadata provided from jaspr_portfolio/web.
        link(rel: 'icon', href: 'favicon.svg', type: 'image/svg+xml'),
        link(rel: 'manifest', href: 'manifest.json'),
        // Basic SEO metadata.
        meta(
          name: 'description',
          content:
              'Hazem Said Portfolio - Flutter Developer showcasing mobile and web applications, with expertise in cross-platform development.',
        ),
        meta(
          name: 'keywords',
          content: 'Flutter, Dart, Mobile Development, Web Development, Portfolio, Hazem Said',
        ),
        meta(name: 'author', content: 'Hazem Said'),
        meta(name: 'theme-color', content: '#FF006E'),
        meta(
          attributes: {
            'property': 'og:title',
            'content': 'Hazem Said - Flutter Developer Portfolio',
          },
        ),
        meta(
          attributes: {
            'property': 'og:description',
            'content':
                'Professional Flutter developer portfolio featuring mobile and web applications with modern UI/UX design.',
          },
        ),
        meta(attributes: {'property': 'og:type', 'content': 'website'}),
        meta(
          attributes: {
            'property': 'og:url',
            'content': 'https://hazzemsaid.github.io/my_Portfolio/',
          },
        ),
        meta(attributes: {'property': 'og:image', 'content': 'assets/images/profile.png'}),
        meta(name: 'twitter:card', content: 'summary_large_image'),
        meta(name: 'twitter:title', content: 'Hazem Said - Flutter Developer Portfolio'),
        meta(
          name: 'twitter:description',
          content: 'Professional Flutter developer portfolio featuring mobile and web applications.',
        ),
        meta(name: 'twitter:image', content: 'assets/images/profile.png'),
        // Global stylesheet for layout & theme.
        link(rel: 'stylesheet', href: 'styles.css'),
      ],
      body: const App(),
    ),
  );
}
