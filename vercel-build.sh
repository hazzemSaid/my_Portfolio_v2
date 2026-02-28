#!/bin/bash
set -e

echo "Downloading Dart SDK..."
wget -qO dart-sdk.zip https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip
unzip -q -o dart-sdk.zip
export PATH="$PWD/dart-sdk/bin:$PATH"

echo "Dart version:"
dart --version

echo "Installing Jaspr CLI..."
export PATH="$PATH:$HOME/.pub-cache/bin"
dart pub global activate jaspr_cli

echo "Fetching dependencies..."
dart pub get

echo "Building Jaspr project..."
jaspr build
