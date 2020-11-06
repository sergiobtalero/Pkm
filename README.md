# Pkm

## Previous steps 
This project uses both XCodeGen and Swiftlint, so make sure you have them installed on your machine. If not run following commands:

### Homebrew
```
brew install xcodegen
````

### Swiftlint
```
brew install swiftlint
```

## How to run
If you have both Xcodegen and Swiftlint, then:
1. Clone the repo
2. On project root folder run xcodegen

Xcodegen will generate .xcodeproj, open it and wait for to finish downloading packages.

## General Explanation
The project is clean-oriented, thus you will find folllowing targets on the app with it's corresponding explanation:
- Data: Handles services, providers and data entities.
- Domain: Handles domain models, use cases, and defines contracts of providers.
- Pokedex: Handles business and logic presentation.
- Injector: For dependency injection.

## Tests
All target but Injector have tests, so please feel free to run them.

## Frameworks Used
The app only usess Kingfisher to handle images.
