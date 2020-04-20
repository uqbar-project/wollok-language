![image](https://user-images.githubusercontent.com/4549002/65472817-bf01f200-de4b-11e9-94c6-433d9c037dca.png)

# Wollok Language

This is the repository for the **Wollok Language definition**, and also the main access point for all resources.

## What is Wollok?

Wollok is a language designed to satisfy our main goals for teaching OO concepts. You can see [Wollok site](https://www.wollok.org) for further information.

## About this repository

It is a Wollok Project which contains

- Wollok core libraries: strings, numbers, dates, booleans, etc. in `src` folder
- Wollok language specification, in form of unit tests: in `test` folder you'll see our **sanity tests** where you can check how should you use Wollok objects from core libraries, and syntax definitions.

All files follow a [standard coding convention](https://github.com/uqbar-project/wollok-language/wiki/Coding-Standards-for-writing-this-repository), please read them before collaborating.

## Changes

- If you want to propose a change, please [open a new issue](/issues/new). Ideally, a new feature proposal should have: a) what do you want to achieve, b) why do you want the new feature, c) (optional) if it could solved with Wollok-side implementation or it could require native implementations, d) (optional, nice-to-have) acceptance tests. We have a sort of _consensus_ instead of a bureaucratic committee, and will evaluate and prioritize the proposal. Pending task: [add a template](https://help.github.com/es/github/building-a-strong-community/configuring-issue-templates-for-your-repository)
- Once approved, we should add it to the [changelog file](CHANGELOG.md), which could also be useful in case you need to migrate your examples according to different versions.

## Current work

- [Wollok Roadmap for 2020](https://docs.google.com/document/d/1M8suCfdetT12YIb62VzORnpesRW2DKrm8hS01dqIPlc/edit)

## Another useful repositories

- [wollok-xtext](https://github.com/uqbar-project/wollok): our first & stable implementation, is Eclipse Xtext-based.
- [wollok-ts](https://github.com/uqbar-project/wollok-ts): next generation interpreter Typescript-based, which has...
  - [wollok-run-client](https://github.com/uqbar-project/wollok-run-client): A proof of concept using Wollok Game, first prototype of a dynamic diagram, a new console REPL and wollok-ts interpreter
  - [wollok-linter](https://github.com/uqbar-project/wollok-linter): A Work-in-Progress implementation of Language Server Protocol, supported for a lot of IDEs (especially Visual Studio Code)
- [wollok-highlight-vscode](https://github.com/uqbar-project/wollok-highlight-vscode), a highlighter plugin for Visual Studio Code which should be integrated with [Wollok-Sublime project](https://github.com/uqbar-project/wollok-sublime)
- [wollok-cli](https://github.com/uqbar-project/wollok-cli): Wollok CLI for tasks automation (Travis integration, bash scripting, etc.)
- [wollok-site](https://github.com/uqbar-project/wollok-site): Main content of our Wollok site (hosted in github pages with Jekyll)

## Experimental tools for Wollok

We also have several ideas currently suspended, that eventually anybody could resume at any time:

- [wollok-s](https://github.com/uqbar-project/wollok-s): Wollok Scala interpreter & parser
- [wollok-js](https://github.com/uqbar-project/wollok-js): Wollok javascript interpreter, parser & linker
- [wollok-blockly](https://github.com/uqbar-project/wollok-blockly): a Wollok blockly editor
- [wollok-sublime-linter](https://github.com/uqbar-project/wollok-sublime-linter): A Linter for sublime 3

## How to contribute?

Open an issue here, and we will contact you!
