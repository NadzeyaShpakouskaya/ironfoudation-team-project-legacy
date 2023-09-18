# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added 

- Add `SitterProfileViewModel` - [#164](https://github.com/ios-course/ironfoudation-team-project/pull/164)
- Integrate `NetworkService` package into the `WoofApp` - [#188](https://github.com/ios-course/ironfoudation-team-project/pull/188)
- Add the ability to create and save a new owner or sitter when choosing a role on the `LoginView` screen - [#192](https://github.com/ios-course/ironfoudation-team-project/pull/192)
- Add `SitterProfileView` to display and edit personal information about the sitter - [#190](https://github.com/ios-course/ironfoudation-team-project/pull/190)
- Add `Obfuscator` enum with `reveal(_:_:)` method - [#196](https://github.com/ios-course/ironfoudation-team-project/pull/196) 
- Add bash script `Obfuscator.sh` - [#197](https://github.com/ios-course/ironfoudation-team-project/pull/197)
- Add `ProductionEndpoint`, `APIEnvironment` - [#199](https://github.com/ios-course/ironfoudation-team-project/pull/199)
- Add scripts to insert API-key to the build phase of the `Woof` target - [#202](https://github.com/ios-course/ironfoudation-team-project/pull/202)
- Add a new endpoint to `WoofAppEndpoint` for adding new sitter - [#205](https://github.com/ios-course/ironfoudation-team-project/pull/205)
- Add request to backend in `SitterProfileViewModel` to upload Sitter information - [#211](https://github.com/ios-course/ironfoudation-team-project/pull/211)

### Changed

 - Update PR template [#194](https://github.com/ios-course/ironfoudation-team-project/pull/194)
 - Update revision of the `SimpleNetworkService` package in the project - [#204](https://github.com/ios-course/ironfoudation-team-project/pull/204)

## [0.3.1] - 21.08.2023

### Changed 

- Changing the application icon in order to enable distributing releases through TestFlight. - [#198](https://github.com/ios-course/ironfoudation-team-project/pull/198)

## [0.3.0] - 19.06.2023

### Added

- Add `enum Stars` and `enum StarRating` and use it into `FiveStarRatingView` and updated code that depends on these changes - [#127](https://github.com/ios-course/ironfoudation-team-project/pull/127)
- Add `SitterMainTabView` for the sitter with stub view for tabs - [#108](https://github.com/ios-course/ironfoudation-team-project/pull/108)
- Update storage keys and storage names to use with the `KeyValueStorage` - [#109](https://github.com/ios-course/ironfoudation-team-project/pull/109)
- Create `Preferences` model, enum `Role` - [#111](https://github.com/ios-course/ironfoudation-team-project/pull/111)
- Move `AvatarView` file to the `ReusableViews` folder - [#136](https://github.com/ios-course/ironfoudation-team-project/pull/136)
- Create `PreferencesHandler` model - [#115](https://github.com/ios-course/ironfoudation-team-project/pull/115)
- Create `CapsuleWithWhiteText` as `ButtonStyle` and apply in the `OwnerProfileView` - [#135](https://github.com/ios-course/ironfoudation-team-project/pull/135)
- Add build schemes for the Woof and WoofTests targets - [#148](https://github.com/ios-course/ironfoudation-team-project/pull/148)
- Add `LoginViewModel` to work with data in LoginView - [#157](https://github.com/ios-course/ironfoudation-team-project/pull/157)
- Add `CopyToClipboardLabel`. Add feature copy to clipboard the pet sitter's name and the phone number. - [#134](https://github.com/ios-course/ironfoudation-team-project/pull/134)
- Add the `StartScreenViewModel` to get user role, update the `WoofApp` to show proper view based on user role - [#156](https://github.com/ios-course/ironfoudation-team-project/pull/156)
- Create view models: `SitterMainTabViewModel`, `OwnerMainTabViewModel` for main tab views - [#154](https://github.com/ios-course/ironfoudation-team-project/pull/154)
- Add the `SitterInfoCardView` - [#112](https://github.com/ios-course/ironfoudation-team-project/pull/158)
- Create `PurpleCapsuleOfInfinityWidth` as `ButtonStyle`. Create `LoginView` and apply in the `WoofApp` to display when running the app when the user role is not selected - [#160](https://github.com/ios-course/ironfoudation-team-project/pull/160)
- Add the `EditSitterInformationView` and the reusable element `TextEditorWithPlaceholder` - [#159](https://github.com/ios-course/ironfoudation-team-project/pull/159)
- Add ability to change the user role using `Logout` button on the `SitterMainTabView` and `OwnerMainTabView` screens - [#167](https://github.com/ios-course/ironfoudation-team-project/pull/167)

### Changed

- Update the Authors section for the `README.md` file - [#139](https://github.com/ios-course/ironfoudation-team-project/pull/139)
- Update the general issue template - [#149](https://github.com/ios-course/ironfoudation-team-project/pull/149)
- Change the class name from `StartScreenViewModel` to `UserRoleViewModel`. Add methods to the `UserRoleViewModel` to set and reset user's role in the application - [#166](https://github.com/ios-course/ironfoudation-team-project/pull/166)


## [0.2.0] - 05.06.2023

### Added 

- Add `OwnerProfileViewModel` for `OwnerProfileView` - [#88](https://github.com/ios-course/ironfoudation-team-project/pull/88)
- Add `OwnerCardView`- [81](https://github.com/ios-course/ironfoudation-team-project/pull/81)
- Enhancement: make `IconName` extension of `String` instead of `Image` - [#95](https://github.com/ios-course/ironfoudation-team-project/pull/95)
- Add icon image for the app [#96](https://github.com/ios-course/ironfoudation-team-project/pull/96)
- Add `OwnerProfileView`- [#93](https://github.com/ios-course/ironfoudation-team-project/pull/93)

## [0.1.0] - 31.05.2023

### Added 

- Add environment setting files: `.gitignore` file, rules for linters - [#24](https://github.com/ios-course/ironfoudation-team-project/pull/24)
- Add project documentation files: `README.md`, `board_rules.md`, `CHANGELOG.md`, `release_notes.md` - [#25](https://github.com/ios-course/ironfoudation-team-project/pull/25)
- Add Xcode project and integrate linters into Xcode build phase - [#26](https://github.com/ios-course/ironfoudation-team-project/pull/26)
- Create project structure - [#27](https://github.com/ios-course/ironfoudation-team-project/pull/27)
- Add `Owner` model to the model layer - [#36](https://github.com/ios-course/ironfoudation-team-project/pull/36)
- Add `Sitter` model to the model layer - [#37](https://github.com/ios-course/ironfoudation-team-project/pull/37)
- Add `MainTabView` for the owner with stub view for tabs - [#29](https://github.com/ios-course/ironfoudation-team-project/pull/29)
- Add `SitterCardViewModel` for `SitterCardView` - [#38](https://github.com/ios-course/ironfoudation-team-project/pull/38)
- Add `SitterCardView` as part of `SitterListView` - [#42](https://github.com/ios-course/ironfoudation-team-project/pull/42)
- Add `SitterListView` to the Sitter's tab in `MainTabView` - [#48](https://github.com/ios-course/ironfoudation-team-project/pull/48)
- Add `DetailedSitterView` to present the detailed information about the selected sitter from `SitterListView`  - [#55](https://github.com/ios-course/ironfoudation-team-project/pull/55)
- Add template for PRs  - [#53](https://github.com/ios-course/ironfoudation-team-project/pull/53)
- Add template for issues  - [#54](https://github.com/ios-course/ironfoudation-team-project/pull/54)
- Add missed information to `CHANGELOG.md`  - [#56](https://github.com/ios-course/ironfoudation-team-project/pull/56)
- Add the `KeyValueStorage` class to manage persistent data storage - [#58](https://github.com/ios-course/ironfoudation-team-project/pull/58)
- Add `EditOwnerInformationView` - [#77](https://github.com/ios-course/ironfoudation-team-project/pull/77)
