# python-wechaty-puppet-padplus [![Python 3.7](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/release/python-370/) [![PyPI GitHub Actions](https://github.com/wechaty/python-wechaty-puppet-padplus/workflows/PyPI/badge.svg)](https://github.com/wechaty/python-wechaty-puppet/actions?query=workflow%3APyPI)

[![Powered by Python-Wechaty](https://img.shields.io/badge/Powered%20By-Wechaty-brightgreen.svg)](https://github.com/wechaty/wechaty)

[![PyPI Version](https://img.shields.io/pypi/v/wechaty-puppet-hostie?color=blue)](https://pypi.org/project/wechaty-puppet-hostie)
![PyPI - Downloads](https://img.shields.io/pypi/dm/wechaty-puppet-hostie?color=blue)

Python Padplus Puppet for Wechaty

## Features

1. Consume padplus service

## Usage

```python
import asyncio
from wechaty import Wechaty
from wechaty_puppet_padplus import PadPlusPuppet

bot = Wechaty(PadPlusPuppet("your-token-here"))
bot.on('message', lambda x: print(x))

asyncio.run(bot.start())
```

## Environment Variables

### 1 `WECHATY_PUPPET_PADPLUS_TOKEN`

The token set to this environment variable will become the default value of `puppetOptions.token`

```sh
WECHATY_PUPPET_PADPLUS_TOKEN=secret python bot.py
```

## History

### master

### v0.0.1 (July 8, 2020)

1. Init Python version

## Author

[JingJing Wu](https://github.com/wj-Mcat) ([吴京京](https://github.com/wj-Mcat)) 1435130236@qq.com

## Copyright & License

* Code & Docs © 2020-now JingJing Wu 1435130236@qq.com
* Code released under the Apache-2.0 License
* Docs released under Creative Commons
