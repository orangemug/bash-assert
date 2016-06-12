# bash-assert
Really simple bash assertion

[![stability-unstable](https://img.shields.io/badge/stability-unstable-yellow.svg)][stability]
[![circleci](https://circleci.com/gh/orangemug/bash-assert.png?style=shield)][circleci]
[![Dependency Status](https://david-dm.org/orangemug/bash-assert.svg)][dm-prod]
[![Dev Dependency Status](https://david-dm.org/orangemug/bash-assert/dev-status.svg)][dm-dev]

[stability]: https://github.com/orangemug/stability-badges#unstable
[circleci]:  https://circleci.com/gh/orangemug/bash-assert
[dm-prod]:   https://david-dm.org/orangemug/bash-assert
[dm-dev]:    https://david-dm.org/orangemug/bash-assert#info=devDependencies


## Install
Either just grab the files `tassert.sh` and `assert.sh`

Alternatively you can install via npm

    npm install orangemug/bash-assert

You'll need to prefix any of the below with `./node_modules/bash-assert/`, for example

    source ./node_modules/bash-assert/assert.sh

If you pass the `-g` flag to `npm install`, `tassert` will also be installed globally

    npm install -g orangemug/bash-assert



## Usage
First off source the library

```bash
source ./assert.sh
```

You now have a simple `assert`/`assert_fail` methods shown below

```bash
assert "4" -lt "5"

# Note: This will fail
assert_fail "5" -lt "4"
```

Any [single bracket syntax](https://linuxacademy.com/blog/linux/conditions-in-bash-scripting-if-statements#single-bracket-syntax) expression should work correctly, you can see the tested expressions in [./test/assert.sh](test/assert.sh)

There is also a [tap](https://testanything.org/tap-version-13-specification.html) version, which will log out tap output for each assertion.

For `tassert` rather than using `source`, call the script directly passing the file containing the `tassert` calls. See below for an example

```text
## file: example/tassert-simple.sh
tassert "4" -lt "5"
tassert_fail "5" -lt "4"
tend
```

```bash
./tassert.sh example/tassert-simple.sh
## >>stderr
## TAP version 13
## ok 1 - "4 -lt 5"
## ok 2 - "5 -lt 4"
## 1..2
##<<stderr
```


## Tests
To run the tests

```bash
./test.sh
```


## License
[MIT](LICENSE)
