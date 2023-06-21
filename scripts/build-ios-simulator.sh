#!/usr/bin/env bash

APP_NAME="Woof"
xcodebuild -scheme NetworkService
xcodebuild -project Woof/${APP_NAME}.xcodeproj \
           -target ${APP_NAME} \
           -configuration Release \
           -sdk iphonesimulator16.4
