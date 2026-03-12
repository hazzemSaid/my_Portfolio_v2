# Hazem Said — Portfolio v2

> **Built with [Jaspr](https://docs.page/schultek/jaspr) — a Dart web framework — not Flutter Web.**
> Read the [Jaspr vs Flutter Web](#-jaspr-vs-flutter-web) section below to understand why this matters.

A fast, SEO-friendly personal portfolio for **Hazem Said**, a Software Engineer specializing in mobile and backend development. The site is server-side rendered (SSR) and deployed as a static site on [Vercel](https://vercel.com).

---

## 🔑 Why Jaspr — Not Flutter Web

This is one of the key architectural decisions in this project. Both Jaspr and Flutter Web use **Dart**, but they work very differently:

| Feature | **Jaspr** ✅ (this project) | **Flutter Web** |
|---|---|---|
| **Output** | Standard HTML + CSS + JavaScript | Canvas-rendered pixels (or HTML renderer) |
| **SEO** | ✅ Full SSR / static HTML — search engines read real content | ❌ Canvas output is invisible to crawlers |
| **Performance** | ✅ Tiny JS bundle, fast first paint | ❌ Large Wasm/JS bundle (~5–10 MB+), slow initial load |
| **Accessibility** | ✅ Native HTML elements (screen-reader friendly) | ❌ Custom canvas rendering bypasses browser a11y |
| **CSS / Styling** | ✅ Real CSS files, browser dev-tools work naturally | ❌ Flutter paints its own UI; CSS doesn't apply |
| **Progressive Enhancement** | ✅ Works without JS for static content | ❌ Requires JS to render anything |
| **Deployment** | Any static host, CDN, or server | Needs special setup for SSR; large assets |
| **Component model** | Jaspr `Component` → emits real DOM elements | Flutter `Widget` → draws to a canvas/DOM |
| **Hot Reload** | ✅ Dart + browser hot reload | ✅ Flutter hot reload |
| **Best for** | Websites, blogs, portfolios, content-heavy apps | Rich interactive apps needing pixel-perfect fidelity |

### The Bottom Line

A portfolio site **must** be crawlable by Google, load fast on mobile, and be accessible to everyone. Jaspr achieves all three by generating real HTML that browsers understand natively, while Flutter Web would hide the content inside a canvas that search engines cannot read.

---

## 🚀 Live Demo

**[https://my-portfolio-v2-hazem.vercel.app](https://my-portfolio-v2-hazem.vercel.app)** *(Vercel deployment)*

---

## 🏗️ Project Architecture

```
my_Portfolio_v2/
├── lib/
│   ├── app.dart                  # Root component — all page sections
│   ├── components/
│   │   └── layout.dart           # NavBar, Footer, Section, Layout wrappers
│   ├── main.client.dart          # Browser entrypoint (hydration)
│   ├── main.client.options.dart  # Client build options
│   ├── main.server.dart          # Server/static entrypoint (SSR + <head> meta)
│   └── main.server.options.dart  # Server build options
├── web/
│   ├── styles.css                # Global styles & responsive design
│   ├── favicon.svg               # Site icon
│   └── manifest.json             # PWA manifest
├── assets/
│   └── images/                   # Profile photo, project screenshots, skill icons
├── tool/
│   └── sync_assets.dart          # Dev helper: syncs assets to build output
├── pubspec.yaml                  # Dart package & Jaspr config
├── vercel.json                   # Vercel deployment config
└── vercel-build.sh               # CI build script (installs Dart + Jaspr CLI)
```

### How Jaspr SSR Works Here

```
Dart Server (main.server.dart)
        │
        ▼
  Render App to HTML string
        │
        ▼
  Serve pre-rendered HTML   ──▶  Browser receives real HTML (SEO ✅)
        │
        ▼
  Hydrate with main.client.dart  ──▶  Interactive behaviour added client-side
```

`jaspr: mode: static` in `pubspec.yaml` means `jaspr build` generates fully static HTML files — no Node.js server is needed at runtime.

---

## 📄 Page Sections

| Section | Description |
|---|---|
| **Home** | Hero with profile photo, animated circles, CTA buttons, and social links |
| **About** | Personal bio, skills bullets, and academic background |
| **Services** | Cards for Mobile, Backend, Real-Time, Payment, Maps, and Cross-Platform services |
| **Resume** | Timeline of education (Suez Canal University, ITI, MCIT) and work experience |
| **Skills** | Icon grid — Flutter, Node.js, MongoDB, Firebase, Docker, TypeScript, and more |
| **Projects** | Showcase cards for TioNova, BULDM, and Quran App with live demo & GitHub links |
| **Contact** | Contact CTA with skill pills and links to GitHub / email |

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Framework** | [Jaspr](https://github.com/schultek/jaspr) `^0.22.1` |
| **Language** | Dart `^3.10.0` |
| **Styling** | Pure CSS (no framework) |
| **Build** | `jaspr build` → static HTML/CSS/JS |
| **CI / Deploy** | Vercel + custom `vercel-build.sh` |
| **Assets** | SVG icons, PNG screenshots, JPEG profile photo |

---

## 💻 Getting Started

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) `>=3.10.0`
- Jaspr CLI

```bash
dart pub global activate jaspr_cli
```

### Install dependencies

```bash
dart pub get
```

### Run in development mode

```bash
jaspr serve
```

Opens a local dev server with hot reload at `http://localhost:8080`.

### Build for production

```bash
jaspr build
```

Output is in `build/jaspr/` — a fully static site ready to be served by any CDN or static host.

---

## ☁️ Deployment (Vercel)

`vercel.json` configures Vercel to:
1. Run `bash vercel-build.sh` which downloads the Dart SDK, installs the Jaspr CLI, and runs `jaspr build`.
2. Serve the `build/jaspr/` directory as a static site.

No server-side runtime is needed after build — the output is plain HTML + CSS + JS.

---

## 🎨 Featured Projects

### TioNova
> Cross-platform learning app · Flutter + Node.js + MongoDB

A lightweight educational app with a clean UI and seamless UX.
- [Frontend](https://github.com/hazzemSaid/TioNova_frontend) · [Backend](https://github.com/hazzemSaid/TioNova_backend) · [Live Demo](https://tionova-c566b.web.app/)

### BULDM
> Lost & Found ecosystem · Flutter + Node.js + WebSockets

AI-powered matching, real-time communication, and location tracking.
- [Frontend](https://github.com/hazzemSaid/buldm_frontend) · [Backend](https://github.com/hazzemSaid/buldm_backend)

### Quran App
> Mobile application (iOS & Android) · Flutter + Dart

Immersive Quran reading and listening experience with advanced navigation.
- [Repository](https://github.com/hazzemSaid/quran_app)

---

## 📬 Contact

| | |
|---|---|
| **Email** | [haazemsaidd@gmail.com](mailto:haazemsaidd@gmail.com) |
| **LinkedIn** | [hazem-said-775b66263](https://www.linkedin.com/in/hazem-said-775b66263/) |
| **GitHub** | [@hazzemSaid](https://github.com/hazzemSaid) |
| **Resume** | [View on Google Drive](https://drive.google.com/file/d/1ZZhO_ugFV2PDxQsOrfvg69u05UKA5Qvg/view?usp=sharing) |

---

© 2026 Hazem Said · Built with ❤️ and [Jaspr](https://github.com/schultek/jaspr)
