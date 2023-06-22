#!/usr/bin/env bash

readonly APP_NAME="Woof"
IOS_SDK="16.4"

xcodebuild -project ${APP_NAME}/${APP_NAME}.xcodeproj \
           -scheme NetworkService
xcodebuild -project ${APP_NAME}/${APP_NAME}.xcodeproj \
           -scheme ${APP_NAME} \
           -configuration Release \
           -sdk iphonesimulator${IOS_SDK}
