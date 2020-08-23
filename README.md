# Slate

![CI](https://github.com/devato/slate/workflows/CI/badge.svg)

An Elixir Phoenix App Template we use @ [Devato](https://devato.com)


## Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Template Details](#template-details)
- [Getting Started](#getting-started)
- [Helper Scripts](#helper-scripts)
- [Deploy to Render.com](#deploy-to-rendercom)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Template Details

The app template comes with some common systems pre-configured, tested and ready to go.

Includes a Github Actions workflow that will run checks and optionally deploy on success.

| Library                                                                             | Description                                                                              |
| ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| [Phoenix Framework](https://www.phoenixframework.org/)                              | An Elixir web-framework that gives you peace of mind from development to production.     |
| [Phoenix LiveView](https://github.com/phoenixframework/phoenix_live_view)           | Phoenix LiveView enables rich, real-time user experiences with server-rendered HTML.     |
| [Phoenix LiveDashboard](https://github.com/phoenixframework/phoenix_live_dashboard) | LiveDashboard provides real-time performance monitoring and debugging tools for Phoenix. |
| [Ecto](https://github.com/elixir-ecto/ecto)                                         | A toolkit for data mapping and language integrated query for Elixir.                     |
| [phx_gen_auth](https://github.com/aaronrenner/phx_gen_auth)                         | An authentication system generator for Phoenix 1.5+ applications.                        |
| [Oban](https://github.com/sorentwo/oban)                                            | Robust job processing in Elixir, backed by modern PostgreSQL.                            |
| [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html)                                    | Unit testing framework for Elixir.                                                       |
| [ExMachina](https://github.com/thoughtbot/ex_machina)                               | ExMachina makes it easy to create test data and associations.                            |
| [Faker](https://github.com/elixirs/faker)                                           | Faker is a pure Elixir library for generating fake data.                                 |
| [ExCoveralls](https://github.com/parroty/excoveralls)                               | An Elixir library that reports test coverage statistics.                                 |
| [Bamboo](https://github.com/thoughtbot/bamboo)                                      | Flexible and easy to use email for Elixir.                                               |
| [Credo](https://github.com/rrrene/credo)                                            | A static code analysis tool for the Elixir language.                                     |
| [TailwindCSS](https://tailwindcss.com/)                                             | A utility-first CSS framework for rapidly building custom designs.                       |

## Getting Started

Fork or clone this repo:  [Generate Fork](https://github.com/devato/slate/generate)

Then, rename the app:

```
$ bin/rename MyApp (PascalCase)
```

This will re-write all modules and files to match your app.

**Optional**

Remove git repo to clean the Slate:

```
$ rm -rf .git
$ git init
$ git remote add origin <your-repo>
```

## Helper Scripts

Setup the application:

```
$ bin/setup
```

Check formatting, credo and run tests

```
$ bin/test
```

Lint Assets:

```
$ bin/lint
```

## Deploy

First determine which branch you'd like to use for `staging` / `prod`.

1. Customize `render.yaml` as needed.
2. Visit render.com, go to YAML in the navigation and hit "New From YAML"
3. From here you can enter your secret key base etc.

## Contributing

If you have some ideas on how to improve this template, feel free to create an issue or PR.

[Fork this Repo](https://github.com/devato/slate/generate)
