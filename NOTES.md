How to execute nodejs scrpit on ssh login?
------------------------------------------

You add *#!/usr/bin/env/node* on top of your file

Then you
```bash
$ chmod +x your_file.js
```
and
```bash
# chsh -s '/path/to/your/file.js' selected_user
```
Just be careful not to lock yourself out of the system.
