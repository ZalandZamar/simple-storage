// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.s.sol";

contract SimpleStorageTest is Test {
    SimpleStorage simpleStorage;

    function setUp() public {
        // first we deploy the deployer script which creates a new instance of SimpleStorage and returns it.
        DeploySimpleStorage deployer = new DeploySimpleStorage();
        // then we assign that returned instance of SimpleStorage from deployer to simpleStorage
        simpleStorage = deployer.run();
    }

    function testStoreNumberIsCorrect() public {
        uint256 expectedNumber = 123;
        simpleStorage.storeFavNumber(expectedNumber);
        uint256 actualNumber = simpleStorage.retreiveFavNumber();

        assertEq(expectedNumber, actualNumber);
    }

    function testMappingReturnsCorrectNumber() public {
        string memory name = "alice";
        uint256 favNumber = 123;

        simpleStorage.storePerson(name, favNumber);
        uint256 nameToFavoriteNumber = simpleStorage.nameToFavNumber(name);

        assertEq(nameToFavoriteNumber, favNumber);
    }

    function testCanStorePeople() public {
        string memory person1 = "alice";
        string memory person2 = "bob";
        uint256 favNumber1 = 1;
        uint256 favNumber2 = 2;

        simpleStorage.storePerson(person1, favNumber1);
        simpleStorage.storePerson(person2, favNumber2);

        uint256 retreiveNumber = simpleStorage.nameToFavNumber(person1);

        assertEq(simpleStorage.getListOfPeopleLength(), 2);
        assertEq(retreiveNumber, favNumber1);
    }
}
