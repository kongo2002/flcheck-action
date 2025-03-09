# flcheck action

[flcheck][flcheck] is a CLI tool to check, validate and analyze flutter (dart)
package dependencies.

[![flcheck-action](https://github.com/kongo2002/flcheck-action/actions/workflows/test.yaml/badge.svg)][actions]

The tool is meant to assist when creating flutter/dart applications that are
built by assembling multiple packages into one (or multiple) applications,
sometimes called "micro frontends".

When building larger applications it is more important to control the way
packages are allowed to depend on each other. Otherwise you might end up with
one larger intertwined mess of dependencies that are hard to maintain in the
long run.

The main purpose of *flcheck* is best to be integrated into a CI/CD pipeline and
checking that certain dependency rules are met at all times.


## Usage


```yaml
# run the action in the current workspace and
# scanning all flutter packages in the 'apps' directory
uses: kongo2002/flcheck-action@v1
with:
  command: validate
  config: flcheck.yaml
  appDir: ./apps
```


### Full example

```yaml
name: Flutter
on:
  pull_request:
    branches: [ master ]
jobs:
  test:
    runs-on: ubuntu-24.04
    steps:
    - name: Checkout repository
      uses: actions/checkout@v3
    - name: Run flcheck
      uses: kongo2002/flcheck-action@v1
      with:
        command: validate
        config: flcheck.yaml
        appDir: ./apps
```


## Inputs

| input | description | default |
| ----- | ----------- | ------- |
| `command` | command to execute (commonly `validate`, see [commands][commands]) | `--help` |
| `config` | path to the flcheck configuration file | `flcheck.yaml` |
| `appDir` | root directory to recursively search for flutter packages | `.` |


[actions]: https://github.com/kongo2002/flcheck-action/actions/
[commands]: https://github.com/kongo2002/flcheck#running
[flcheck]: https://github.com/kongo2002/flcheck
