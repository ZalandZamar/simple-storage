// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract SimpleStorage {
    uint256 public MyFavoriteNumber;
    mapping(string => uint256) public nameToFavNumber;

    struct Person {
        string _name;
        uint256 FavoriteNumber;
    }

    Person[] public listOfPeople;

    /**
     * @param _FavoriteNumber The favorite number to store.
     * @notice Stores the favorite number of a user.
     */
    function storeFavNumber(uint256 _FavoriteNumber) public {
        MyFavoriteNumber = _FavoriteNumber;
    }

    /**
     * @notice Returns the stored favorite number.
     */
    function retreiveFavNumber() public view returns (uint256) {
        return MyFavoriteNumber;
    }

    /**
     * @param _name is the name of the person to store
     * @param _favoriteNumber is the favorite number of the person to store
     * @notice adds(stores) the name of the person and his favoriteNumber to listOfPeople array
     * @notice maps the person's name to his favorite number
     */
    function storePerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_name, _favoriteNumber));
        nameToFavNumber[_name] = _favoriteNumber;
    }

    // getter functions

    function getListOfPeopleLength() public view returns (uint256) {
        return listOfPeople.length;
    }
}
