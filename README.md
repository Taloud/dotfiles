# dotfile

## Enabling italic in term

```sh
{ infocmp -1 xterm-256color ; echo "\tsitm=\\E[3m,\n\tritm=\\E[23m,"; } > /tmp/xterm-256color.terminfo
tic /tmp/xterm-256color.terminfo
```

## Enabling the PREMIUM feature Intelephense

Prepare a `licence.txt` file containing the licence key and place it in a designated location.

```sh
$ node -e "console.log(os.homedir() + '/intelephense/licence.txt')"
/Users/username/intelephense/licence.txt
```
