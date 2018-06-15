# Sol's dotfiles

[![Latest Stable Version](https://poser.pugx.org/hiqsol/dotfiles/v/stable)](https://packagist.org/packages/hiqsol/dotfiles)
[![Total Downloads](https://poser.pugx.org/hiqsol/dotfiles/downloads)](https://packagist.org/packages/hiqsol/dotfiles)
[![Build Status](https://img.shields.io/travis/hiqsol/dotfiles.svg)](https://travis-ci.org/hiqsol/dotfiles)
[![Scrutinizer Code Coverage](https://img.shields.io/scrutinizer/coverage/g/hiqsol/dotfiles.svg)](https://scrutinizer-ci.com/g/hiqsol/dotfiles/)
[![Scrutinizer Code Quality](https://img.shields.io/scrutinizer/g/hiqsol/dotfiles.svg)](https://scrutinizer-ci.com/g/hiqsol/dotfiles/)

I use no special tool to setup home, only a package manager.

The whole home is comprised of the root package (holding private data)
and dependencies like this:

- hiqsol/home - private root package
    - hiqsol/dotfiles - this package
    - [hiqsol/quotes]

I use [composer] package manager to setup dependencies.

Other tools I use:

- [hidev] to create and maintain packages
- [rewatcher] to watch changes in repos

[hidev]:            https://github.com/hiqdev/hidev
[rewatcher]:        https://github.com/hiqdev/rewatcher
[composer]:         https://getcomposer.org/
[hiqsol/quotes]:    https://github.com/hiqsol/quotes

## Installation

The preferred way to install this project is through [composer](http://getcomposer.org/download/).

```sh
php composer.phar create-project "hiqsol/dotfiles:*" directory2install
```

## License

This project is released under the terms of the MIT [license](LICENSE).
Read more [here](http://choosealicense.com/licenses/mit).

Copyright © 2014-2018, sol (http://hiqdev.com/)
