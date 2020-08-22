<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Slate](#slate)
  - [Getting Started](#getting-started)
  - [Helper Scripts](#helper-scripts)
  - [Template Details](#template-details)
  - [Deploy to Render.com](#deploy-to-rendercom)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Slate

An Opinionated Elixir Phoenix App Template.

[Maintained by Devato](https://devato.com)

## Getting Started

Clone this repo,

Rename the app:

```
$ bin/rename MyApp (PascalCase)
```

This will re-write all modules and files to match your app.

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

## Template Details

TODO

## Deploy to Render.com

First determine which branch you'd like to use for `staging` / `prod`.

Then follow these steps:

1. Make changes to `render.yaml` as needed.
2. `mix phx.gen.secret` and copy the key
3. Visit render.com, and go to YAML in the navigation.
4. Enter the secret for staging/prod.
