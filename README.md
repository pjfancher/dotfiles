# PJ's dotfiles
Custom dotfiles and scripts to setup new dev environments.

## Install As Is
[peej.io](http://peej.io) links to the raw `install-remote.sh` script.

To install all dot files and plugins: `curl -L peej.io | bash`

![screen](http://i.imgur.com/RRC54fI.png)

## Custom Setup
* Clone the repo: `git clone https://github.com/pjfancher/dotfiles` 
* Replace all dot files in the root directory with your own dot files.
* Run `./install.sh`

## Install Packages (beta)
* `./install-packages.sh` installs apt and npm packages necessary for a LAMP dev environment.
* `/install/packages/docker.sh` sets up a new Docker environment.

## GitHub Account
`install.sh` asks whether the machine should use the personal (`pjfancher`) or work (`db-pj`) GitHub account. It writes the commit identity and the `gh` credential helper to `~/.gitconfig.local`, which isn't tracked and is included by `.gitconfig`. It then logs `gh` in as that account.

To switch accounts later: `~/dotfiles/install/github.sh` (or pass `personal` / `work`).
