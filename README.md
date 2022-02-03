# <h1 align="center"> BAYC Max Supply Invariant Testing </h1>

Based on:

- https://github.com/gakonst/dapptools-template
- https://github.com/dapphub/dapptools/tree/master/src/dapp#invariant-testing
- https://twitter.com/nnnnicholas/status/1488956145872130052

You can see an example of the failed invariant test in [invariantFailure.log](https://github.com/karmacoma-eth/bayc-invariant-testing/blob/main/invariantFailure.log)

The test in [src/test/BoredApeYachtClub.t.sol](https://github.com/karmacoma-eth/bayc-invariant-testing/blob/main/src/test/BoredApeYachtClub.t.sol) has this:

```
    function invariantTotalSupply() public {
        assertLe(bayc.totalSupply(), MAX_APES);
    }
```

It ensures that the `totalSupply()` of bored apes remains under the defined maximum. However the test fails, and gives an example that shows how to violate that invariant: the owner can call `bayc.reserveApes()` at any time and bypass the `MAX_APES` check, therefore the supply of bored apes is actually unlimited.


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
