# zsh aliases

`ls`, `grep`, `egrep` **are aliased for output with colors.**

`cp`, `mv`, `rm` **are aliased for confirmation before rewriting/losing files.**

`mkdir` **is aliased for creating directories with creating intermediate directories if not exist.**

| Alias | Description |
| ----- | ----------- |
| `v`, `vi` | `vim` |
| `ds` | shows size of current directory |
| `dsa` | lists sizes of all files in current directory |
| `mcd` | create directory and change current directory to it |
| `la` | `ls -la` |
| `ll` | `ls -l` |
| `please` | `sudo` |
| `:q`, `:qa` | `exit` |
| `logtail` | `tail -f`, appends new lines of file(s) if changed |
| `week` | ISO week number |
| `timer` | Start timer, stop with Ctrl-D |
| `hd` | `hexdump -C` |
| `md5sum` | `md5` |
| `sha1sum` | `shasum` |
| `dns` | clearing DNS cache (macOS only) |
| `emptytrash` | clearing trash and some logs (macOS only) |

More aliases come from oh-my-zsh [git](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git), [composer](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/composer), [brew](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/brew) plugins.
