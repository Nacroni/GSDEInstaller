# GSDE Installer

> **WARNING: THIS PROGRAM HAS NOT BEEN TESTED PROPERLY.** Use with caution, and feel free to post issues with the program.

This is an easy-to-use installer for [GNUstep Desktop](https://github.com/onflapp/gs-desktop).

## Support

- [x] [Debian GNU/Linux](https://debian.org/)
- [x] [Fedora GNU/Linux](https://fedoraproject.org/) *Still indev!*

More coming soon...

## Dependencies

- [`Git`](https://www.git-scm.com/) - *for cloning [GSDE](https://github.com/onflapp/gs-desktop/) & it's world*
- [`Sudo`](https://www.sudo.ws/) - *Makes superuser perms easier & widely used in the script.*
- [`Bash`](https://www.gnu.org/software/bash/) - *Main shell it uses for doing all of these operations*
- `lsb_release` - *Detects the distro of GNU/Linux*

### Install dependencies

> *Make sure to update your package repo files & upgrade your packages through your package manager.*

#### Debian

- `Git`
  - `sudo apt install git`
- `Sudo`
  - As root: `apt install sudo`
- `lsb_release`
  - `sudo apt install lsb-release`

#### Fedora

- `Git`
  - `sudo dnf install git`
- `lsb_release`
  - `sudo dnf install lsb_release`

## How to Install

It's simple! Make sure to give the `./gnustep_desktop-install.sh` script (and all the others) executable permissions like this:

```bash
chmod +x ./gnustep_desktop-install.sh
```

And all you have to do is to run it. It should automatically detect the distro of GNU/Linux you're running and execute the correct script. If it doesn't, then you can check the `./scripts/` directory and run the script manually.

## License

This program uses the [GNU Foundation's](https://gnu.org/) [GPL v3 license](https://gnu.org/licenses/gpl-3.0.en.html). A license file can be found [here](./LICENSE.md).
