#!/usr/bin/env bash

APP_NAME=Woof
xcodebuild -project Woof/${APP_NAME}.xcodeproj \
           -scheme NetworkService
xcodebuild -project Woof/${APP_NAME}.xcodeproj \
           -scheme ${APP_NAME} \
           -configuration Release \
           -sdk iphonesimulator16.4
