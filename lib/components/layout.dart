import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Top-level page layout with navbar, main content and footer.
class Layout extends StatelessComponent {
  const Layout({
    super.key,
    required this.children,
  });

  final List<Component> children;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'layout',
      [
        const NavBar(),
        div(
          classes: 'layout-content',
          children,
        ),
        const Footer(),
      ],
    );
  }
}

/// Generic section wrapper that applies shared spacing and width constraints.
class Section extends StatelessComponent {
  const Section({
    super.key,
    required this.id,
    required this.title,
    required this.children,
  });

  final String id;
  final String title;
  final List<Component> children;

  @override
  Component build(BuildContext context) {
    return section(
      id: id,
      classes: 'section',
      [
        div(
          classes: 'section-inner',
          [
            h2(classes: 'section-title', [text(title)]),
            div(
              classes: 'section-body',
              children,
            ),
          ],
        ),
      ],
    );
  }
}

class NavBar extends StatelessComponent {
  const NavBar({super.key});

  @override
  Component build(BuildContext context) {
    return nav(
      classes: 'navbar',
      [
        ul(
          classes: 'navbar-links',
          [
            _NavLink('#home', 'HS'),
            _NavLink('#about', 'About'),
            _NavLink('#services', 'Services'),
            _NavLink('#resume', 'Resume'),
            _NavLink('#skills', 'Skills'),
            _NavLink('#projects', 'Projects'),
            _NavLink('#contact', 'Contact'),
          ],
        ),
      ],
    );
  }
}

class _NavLink extends StatelessComponent {
  const _NavLink(this.href, this.label);

  final String href;
  final String label;

  @override
  Component build(BuildContext context) {
    return li(
      [
        a(
          href: href,
          classes: 'navbar-link',
          [text(label)],
        ),
      ],
    );
  }
}

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(
      classes: 'footer',
      [
        div(
          classes: 'footer-header',
          [
            p([text('© 2026 Hazem Said. All Rights Reserved')]),
          ],
        ),
        div(
          classes: 'footer-content',
          [
            ul(
              classes: 'footer-links',
              [
                _footerNav('#about', 'About'),
                _footerNav('#services', 'Services'),
                _footerNav('#resume', 'Resume'),
                _footerNav('#skills', 'Skills'),
                _footerNav('#projects', 'Projects'),
              ],
            ),
            ul(
              classes: 'footer-links',
              [
                li([
                  a(
                    href: 'https://github.com/hazzemsaid',
                    target: Target.blank,
                    classes: 'footer-link',
                    [text('GitHub')],
                  ),
                ]),
                li([
                  a(
                    href: 'https://www.linkedin.com/in/hazem-said-775b66263/',
                    target: Target.blank,
                    classes: 'footer-link',
                    [text('LinkedIn')],
                  ),
                ]),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _footerNav(String href, String label) {
    return li([
      a(
        href: href,
        classes: 'footer-link',
        [text(label)],
      ),
    ]);
  }
}
