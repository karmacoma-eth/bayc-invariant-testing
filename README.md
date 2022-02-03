# <h1 align="center"> BAYC Max Supply Invariant Testing </h1>

Based on:

- https://github.com/gakonst/dapptools-template
- https://github.com/dapphub/dapptools/tree/master/src/dapp#invariant-testing

## Building and testing

```sh
make # This installs the project's dependencies.
make test
```

## Installing the toolkit

If you do not have DappTools already installed, you'll need to run the below
commands

### Install Nix

```sh
# User must be in sudoers
curl -L https://nixos.org/nix/install | sh

# Run this or login again to use Nix
. "$HOME/.nix-profile/etc/profile.d/nix.sh"
```

### Install DappTools

```sh
curl https://dapp.tools/install | sh
```

## DappTools Resources

* [DappTools](https://dapp.tools)
    * [Hevm Docs](https://github.com/dapphub/dapptools/blob/master/src/hevm/README.md)
    * [Dapp Docs](https://github.com/dapphub/dapptools/tree/master/src/dapp/README.md)
    * [Seth Docs](https://github.com/dapphub/dapptools/tree/master/src/seth/README.md)
* [DappTools Overview](https://www.youtube.com/watch?v=lPinWgaNceM)
* [Awesome-DappTools](https://github.com/rajivpo/awesome-dapptools)
