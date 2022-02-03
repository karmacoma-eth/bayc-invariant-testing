// SPDX-License-Identifier: Unlicense
pragma solidity >=0.6.0 <0.8.0;

import {DSTest} from "ds-test/test.sol";
import {Hevm} from "./utils/Hevm.sol";
import {IERC721Receiver} from "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

import {BoredApeYachtClub} from "../BoredApeYachtClub.sol";

contract ERC721Receiver is IERC721Receiver {
    function onERC721Received(address, address, uint256, bytes calldata) external override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }
}

contract BaycOwner is ERC721Receiver {
    BoredApeYachtClub public bayc;

    constructor(BoredApeYachtClub _bayc) public {
        bayc = _bayc;
    }

    function reserveApes() public {
        bayc.reserveApes();
    }

    function flipSaleState() public {
        bayc.flipSaleState();
    }
}

contract BoredApesTest is DSTest, ERC721Receiver {
    uint public constant MAX_APES = 10000;
    BoredApeYachtClub public bayc = new BoredApeYachtClub("BoredApes", "BAYC", MAX_APES, 0);
    address[] public _targetContracts;

    function targetContracts() public returns (address[] memory) {
        return _targetContracts;
    }

    function setUp() public {
        BaycOwner baycOwner = new BaycOwner(bayc);
        bayc.transferOwnership(address(baycOwner));
        baycOwner.reserveApes();

        baycOwner.flipSaleState();
        while (bayc.totalSupply() < MAX_APES) {
            bayc.mintApe{value: 0.08 ether}(1);
        }

        _targetContracts.push(address(baycOwner));
    }

    function invariantTotalSupply() public {
        assertLe(bayc.totalSupply(), MAX_APES);
    }
}


