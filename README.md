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


## Usage
First off source the library

```sh
source ./assert.sh
```

You now have a simple `assert`/`assert_fail` methods shown below

```sh
assert "4" -lt "5"
assert_fail "5" -lt "4"
```

There is also a [tap](https://testanything.org/tap-version-13-specification.html) version, which will log out tap output for each assertion

```text
## file: example/tassert-simple.sh
tassert "4" -lt "5"
tassert_fail "5" -lt "4"
tend
```

```sh
./tassert.sh example/tassert-simple.sh
```


## License
[MIT](LICENSE)
