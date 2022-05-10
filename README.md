# GitHub Pages + Flutter Web - williankirsch.github.io

ℹ️ [Como publicar o seu site feito em Flutter no GitHub Pages](https://medium.com/@gracyele?p=5379506dd17a)

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

flutter packages pub run build_runner build

## Publicando web
Rode o comando:

flutter build web

Em seguida, vá ate a /build/web e copie todo o conteúdo para /docs

flutter build web --web-renderer html
flutter build web --web-renderer canvaskit