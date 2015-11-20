# bash-assert
Really simple bash assertion

[![stability-stable](https://img.shields.io/badge/stability-stable-green.svg)][stability]
[![circleci](https://circleci.com/gh/orangemug/bash-assert.png?style=shield)][circleci]
[![Dependency Status](https://david-dm.org/orangemug/bash-assert.svg)][dm-prod]
[![Dev Dependency Status](https://david-dm.org/orangemug/bash-assert/dev-status.svg)][dm-dev]

[stability]: https://github.com/orangemug/stability-badges#stable
[circleci]:  https://circleci.com/gh/orangemug/bash-assert
[dm-prod]:   https://david-dm.org/orangemug/bash-assert
[dm-dev]:    https://david-dm.org/orangemug/bash-assert#info=devDependencies


## Usage
First off source the library

```sh
source assert.sh
```

You now have a simple `assert` method which has 2 modes, as shown below

```sh
assert "4 -lt 5"
assert "4" -lt "5"
```

You'll also get a `assert_fail` is the opposite

```sh
assert_fail "5 -lt 4"
assert_fail "5" -lt "4"
```


## License
[MIT](LICENSE)
