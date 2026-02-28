import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/layout.dart';

/// Root component for the Jaspr portfolio app.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Layout(
      children: const [
        _HomeSection(),
        _AboutSection(),
        _ServicesSection(),
        _ResumeSection(),
        _SkillsSection(),
        _ProjectsSection(),
        _ContactSection(),
      ],
    );
  }
}

class _HomeSection extends StatelessComponent {
  const _HomeSection();

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'home',
      title: '',
      children: [
        div(
          classes: 'hero',
          [
            // Profile image with animated background circles
            div(
              classes: 'hero-image-container',
              [
                // Animated circle backgrounds
                div(classes: 'hero-circle hero-circle-1', []),
                div(classes: 'hero-circle hero-circle-2', []),
                div(classes: 'hero-circle hero-circle-3', []),
                // Profile image
                img(
                  src: 'assets/images/me.jpg',
                  alt: 'Hazem Said',
                  classes: 'hero-image',
                ),
              ],
            ),
            // Content section
            div(
              classes: 'hero-content',
              [
                p(classes: 'hero-kicker', [text('HELLO, MY NAME IS')]),
                h1(
                  classes: 'hero-heading',
                  [
                    span(classes: 'hero-name hero-name--accent', [text('Hazem')]),
                    span(classes: 'hero-name', [text('Said')]),
                  ],
                ),
                p(classes: 'hero-role', [text('Software Engineer')]),
                p(
                  classes: 'hero-subtitle',
                  [
                    text(
                      'Passionate about building impactful software, I craft elegant solutions for mobile, backend, and cross-platform systems. I thrive on turning ideas into reliable, scalable products—combining creativity, technical expertise, and strong problem-solving skills to tackle complex challenges.',
                    ),
                  ],
                ),
                div(
                  classes: 'hero-cta-row',
                  [
                    a(
                      href: 'https://drive.google.com/file/d/1ZcWsIOEGk8ONRVwL2yvI-ettf9gSnrtj/view',
                      target: Target.blank,
                      classes: 'btn-primary',
                      [text('Download Resume')],
                    ),
                    a(
                      href: 'mailto:haazemsaidd@gmail.com',
                      classes: 'btn-secondary',
                      [text('Contact Me')],
                    ),
                  ],
                ),
                div(
                  classes: 'hero-social',
                  [
                    _socialIcon(
                      href: 'https://github.com/hazzemSaid',
                      icon: 'assets/images/github-icon-1.svg',
                      label: 'GitHub',
                    ),
                    _socialIcon(
                      href: 'https://www.linkedin.com/in/hazem-said-775b66263/',
                      icon: 'assets/images/linkedin-icon-1.svg',
                      label: 'LinkedIn',
                    ),
                    _socialIcon(
                      href: 'mailto:haazemsaidd@gmail.com',
                      icon: 'assets/images/mail.svg',
                      label: 'Email',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static Component _socialIcon({
    required String href,
    required String icon,
    required String label,
  }) {
    return a(
      href: href,
      target: Target.blank,
      classes: 'social-icon',
      [
        img(
          src: icon,
          alt: label,
          classes: 'social-icon-img',
        ),
      ],
    );
  }
}

class _AboutSection extends StatelessComponent {
  const _AboutSection();

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'about',
      title: '',
      children: [
        div(
          classes: 'about',
          [
            div(
              classes: 'about-content',
              [
                h3(classes: 'about-title', [text('About Me')]),
                h4(
                  classes: 'about-subtitle',
                  [
                    span(classes: 'text-accent', [text('Driven, ')]),
                    text('innovative Software '),
                    span(classes: 'text-accent', [text('Engineer')]),
                  ],
                ),
                p(
                  classes: 'about-description',
                  [
                    text(
                      'A driven, innovative Software Engineer specializing in mobile and backend development. I\'m pursuing a Bachelor\'s degree in Computer Science at Suez Canal University while actively building production-grade applications. With hands-on experience from the ITI Mobile Development Track and professional internship at Cyber Royale (AUVNET), I combine strong technical expertise with clean code principles and problem-solving skills. I\'m passionate about creating real-time, scalable applications that solve real-world problems and deliver exceptional user experiences.',
                    ),
                  ],
                ),
                ul(
                  classes: 'about-list',
                  [
                    _aboutBullet('developing cross-platform applications using Flutter and Dart'),
                    _aboutBullet('building scalable backend systems using Node.js and MongoDB'),
                    _aboutBullet('problem-solving and algorithmic thinking on platforms like Codeforces and LeetCode'),
                    _aboutBullet('Integration of payment services such as M-Pesa and PayPal'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _aboutBullet(String value) {
    return li(
      classes: 'about-bullet',
      [
        span(classes: 'about-check', [text('✓')]),
        span([text(value)]),
      ],
    );
  }
}

class _ServicesSection extends StatelessComponent {
  const _ServicesSection();

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'services',
      title: '',
      children: [
        div(
          classes: 'section-header',
          [
            p(classes: 'section-kicker', [text('I like to make things easy and fun')]),
            h3(
              classes: 'section-headline',
              [
                text('My '),
                span(classes: 'text-accent', [text('Special Services ')]),
                text('For your '),
                span(classes: 'text-accent', [text('Business Development')]),
              ],
            ),
          ],
        ),
        div(
          classes: 'services-grid',
          [
            _serviceCard(
              title: 'Mobile App Development',
              icon: '📱',
              description:
                  'Build beautiful, high-performance mobile apps using Flutter and Dart. I specialize in reactive apps with real-time features, push notifications, and smooth animations.',
            ),
            _serviceCard(
              title: 'Backend Development',
              icon: '⚙️',
              description:
                  'Develop scalable, secure backend systems using Node.js and MongoDB. I create RESTful APIs, handle complex business logic, and ensure optimal database performance.',
            ),
            _serviceCard(
              title: 'Real-Time Systems',
              icon: '⚡',
              description:
                  'Design and implement real-time applications with Firebase, WebSockets, and live data synchronization. Perfect for chat apps, collaborative tools, and live notifications.',
            ),
            _serviceCard(
              title: 'Payment Integration',
              icon: '💳',
              description:
                  'Seamlessly integrate payment systems including M-Pesa, PayPal, and Stripe. I handle secure transactions, payment verification, and transaction management.',
            ),
            _serviceCard(
              title: 'Location Tracking & Maps',
              icon: '📍',
              description:
                  'Implement Google Maps integration, geolocation services, and location tracking features. Perfect for delivery apps, navigation, and location-based services.',
            ),
            _serviceCard(
              title: 'Cross-Platform Development',
              icon: '🚀',
              description:
                  'Write once, deploy everywhere. Leverage Flutter and web technologies to build apps for mobile, web, and desktop with a single codebase and consistent UI.',
            ),
          ],
        ),
      ],
    );
  }

  Component _serviceCard({
    required String title,
    required String icon,
    required String description,
  }) {
    return div(
      classes: 'service-card',
      [
        div(classes: 'service-icon', [text(icon)]),
        h4(classes: 'service-title', [text(title)]),
        p(classes: 'service-desc', [text(description)]),
      ],
    );
  }
}

class _ResumeSection extends StatelessComponent {
  const _ResumeSection();

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'resume',
      title: '',
      children: [
        div(
          classes: 'section-header',
          [
            h3(classes: 'section-headline', [text('My Resume')]),
            p(
              classes: 'section-subheadline',
              [
                text('Practical '),
                span(classes: 'text-accent', [text('Mobile & Backend Dev ')]),
                text('Experience'),
              ],
            ),
          ],
        ),
        div(
          classes: 'resume-grid',
          [
            div(
              classes: 'resume-column',
              [
                h4(classes: 'resume-column-title', [text('Education')]),
                _timelineItem(
                  company: 'Faculty of Computers and Information, Suez Canal University',
                  role: 'Bachelor of Computer Science',
                  period: '2022 - 2026 (Expected) | Current GPA: 3.1',
                  description:
                      'Studying core subjects including data structures, algorithms, operating systems, and software engineering. Currently focusing on mobile and backend development.',
                ),
                _timelineItem(
                  company: 'Information Technology Institute (ITI)',
                  role: 'Mobile App Development Track (Flutter)',
                  period: '2024',
                  description:
                      'Completed “Sportify” as a graduation project. Gained deep practical experience with Flutter, Firebase, and clean code principles.',
                ),
                _timelineItem(
                  company: 'Ministry of Communications and Information Technology (MCIT), Egypt',
                  role: 'Mobile App Development Course',
                  period: '2024',
                  description:
                      'Completed a comprehensive course on Flutter development, focusing on building responsive and performant mobile applications.',
                ),
              ],
            ),
            div(classes: 'resume-divider', []),
            div(
              classes: 'resume-column',
              [
                h4(classes: 'resume-column-title', [text('Experience')]),
                _timelineItem(
                  company: 'Cyber Royale (AUVNET)',
                  role: 'Software Engineer Intern',
                  period: 'July 2025 - September 2025 · 3 months',
                  description:
                      'Working on real-time mobile applications using Flutter and Node.js. Gained hands-on experience with Firebase, MongoDB, and RESTful APIs.',
                ),
                _timelineItem(
                  company: 'freelance at Upwork & khamsat',
                  role: 'Software Development',
                  period: '2024 - Present',
                  description:
                      'Developing real-time mobile apps using Flutter with Firebase and custom Node.js backends. Implemented features like real-time chat, location tracking, push notifications, and MongoDB data modeling.',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _timelineItem({
    required String company,
    required String role,
    required String period,
    required String description,
  }) {
    return div(
      classes: 'resume-item',
      [
        h5(classes: 'resume-item-company', [text(company)]),
        p(classes: 'resume-item-role', [text(role)]),
        span(classes: 'resume-item-period', [text(period)]),
        p(classes: 'resume-item-desc', [text(description)]),
      ],
    );
  }
}

class _SkillsSection extends StatelessComponent {
  const _SkillsSection();

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'skills',
      title: '',
      children: [
        div(
          classes: 'section-header',
          [
            p(classes: 'section-kicker', [text('My Talent')]),
            h3(
              classes: 'section-headline',
              [
                text('Professional '),
                span(classes: 'text-accent', [text('Skills')]),
              ],
            ),
          ],
        ),
        div(
          classes: 'skills-grid',
          [
            _skill('Javascript', 'assets/images/javascript-1.svg'),
            _skill('Typescript', 'assets/images/typescript.svg'),
            _skill('Figma', 'assets/images/figma.svg'),
            _skill('Node.js', 'assets/images/nodejs-1.svg'),
            _skill('Express', 'assets/images/express-109.svg'),
            _skill('MySQL', 'assets/images/mysql-logo-pure.svg'),
            _skill('MongoDB', 'assets/images/mongodb-icon-1.svg'),
            _skill('Firebase', 'assets/images/firebase-1.svg'),
            _skill('Flutter', 'assets/images/flutter-logo.svg'),
            _skill('Cpp', 'assets/images/c.svg'),
            _skill('Git', 'assets/images/github-icon-1.svg'),
            _skill('Docker', 'assets/images/docker-4.svg'),
            _skill('Postman', 'assets/images/postman.svg'),
          ],
        ),
      ],
    );
  }

  Component _skill(String name, String icon) {
    return div(
      classes: 'skill-card',
      [
        img(src: icon, classes: 'skill-icon', alt: name),
        p(classes: 'skill-name', [text(name)]),
      ],
    );
  }
}

class _ProjectsSection extends StatelessComponent {
  const _ProjectsSection();

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'projects',
      title: '',
      children: [
        div(
          classes: 'section-header',
          [
            p(classes: 'section-kicker', [text('Latest Works')]),
            h3(
              classes: 'section-headline',
              [
                text('Explore My Popular '),
                span(classes: 'text-accent', [text('Projects')]),
              ],
            ),
          ],
        ),
        div(
          classes: 'projects-grid',
          [
            _projectCard(
              category: 'Cross-Platform App',
              title: 'TioNova',
              description:
                  'A lightweight cross-platform learning application built with Flutter. Features a clean UI and seamless user experience for educational content.',
              imagePaths: const ['assets/images/tionova.png'],
              githubLink: 'https://github.com/hazzemSaid/TioNova_frontend',
              demoLink: 'https://tionova-c566b.web.app/',
              backendLink: 'https://github.com/hazzemSaid/TioNova_backend',
            ),
            _projectCard(
              category: 'Cross-Platform App',
              title: 'BULDM',
              description:
                  'A comprehensive lost and found ecosystem featuring a Flutter frontend and Node.js backend with AI-powered matching, real-time communication, and seamless integration.',
              imagePaths: const ["assets/images/darkbuldm.png"],
              githubLink: 'https://github.com/hazzemSaid/buldm_frontend',
              backendLink: 'https://github.com/hazzemSaid/buldm_backend',
            ),
            _projectCard(
              category: 'Mobile Application (iOS, Android)',
              title: 'Quran App',
              githubLink: 'https://github.com/hazzemSaid/quran_app',
              description:
                  'The Quran App provides a unique experience for reading and listening to the Holy Quran, with advanced features that make it easy to interact with the Quran anytime and anywhere.',
              imagePaths: const ['assets/images/784shots_so.png'],
            ),
          ],
        ),
      ],
    );
  }

  Component _projectCard({
    required String category,
    required String title,
    required String description,
    required List<String> imagePaths,
    String? githubLink,
    String? demoLink,
    String? backendLink,
  }) {
    return div(
      classes: 'project-showcase-card',
      [
        div(
          classes: 'project-image',
          [
            img(
              src: imagePaths.first,
              alt: title,
              classes: 'project-image-main',
            ),
          ],
        ),
        div(
          classes: 'project-body-area',
          [
            span(classes: 'project-category', [text(category)]),
            h4(classes: 'project-title', [text(title)]),
            p(classes: 'project-body', [text(description)]),
            if (imagePaths.length > 1)
              div(
                classes: 'project-thumbs',
                [
                  for (final path in imagePaths)
                    img(
                      src: path,
                      alt: title,
                      classes: 'project-thumb',
                    ),
                ],
              ),
            if (githubLink != null || demoLink != null || backendLink != null)
              div(
                classes: 'project-links',
                [
                  if (demoLink != null)
                    a(
                      href: demoLink,
                      target: Target.blank,
                      classes: 'project-link-btn primary',
                      [
                        text('Live Demo'),
                        span(classes: 'btn-icon', [text('↗')]),
                      ],
                    ),
                  if (githubLink != null)
                    a(
                      href: githubLink,
                      target: Target.blank,
                      classes: 'project-link-btn secondary',
                      [
                        img(src: 'assets/images/github-icon-1.svg', classes: 'link-icon', alt: 'GitHub'),
                        text('Frontend'),
                      ],
                    ),
                  if (backendLink != null)
                    a(
                      href: backendLink,
                      target: Target.blank,
                      classes: 'project-link-btn secondary',
                      [
                        img(src: 'assets/images/github-icon-1.svg', classes: 'link-icon', alt: 'Backend'),
                        text('Backend'),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class _ContactSection extends StatelessComponent {
  const _ContactSection();

  @override
  Component build(BuildContext context) {
    return Section(
      id: 'contact',
      title: 'Contact',
      children: [
        div(
          classes: 'contact-top-cta',
          [
            a(
              href: 'https://github.com/hazzemSaid',
              target: Target.blank,
              classes: 'btn-primary',
              [text('View More Projects >')],
            ),
          ],
        ),
        div(
          classes: 'contact-grid',
          [
            div(
              [
                p(classes: 'section-kicker', [text('Get In Touch')]),
                h3(
                  classes: 'section-headline',
                  [
                    text('Let\'s Talk For your '),
                    span(classes: 'text-accent', [text('Next Projects')]),
                  ],
                ),
                p(
                  classes: 'contact-meta',
                  [
                    text(
                      'Discuss a project or just want to say hi? Connect with me via email or through a phone call.',
                    ),
                  ],
                ),
                ul(
                  classes: 'contact-list',
                  const [
                    _ContactPill('2+ Years of Experience'),
                    _ContactPill('Software Engineer'),
                    _ContactPill('Cross-Platform Developer'),
                    _ContactPill('Backend Developer'),
                    _ContactPill('Problem Solver'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactPill extends StatelessComponent {
  const _ContactPill(this.label);
  final String label;

  @override
  Component build(BuildContext context) {
    return li(
      classes: 'contact-pill',
      [
        span(classes: 'about-check', [text('✓')]),
        span([text(label)]),
      ],
    );
  }
}
