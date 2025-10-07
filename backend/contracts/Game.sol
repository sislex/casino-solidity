// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Game {
    struct GameOptions {
        string id;
    }

    GameOptions[] private gameData;

    constructor(string memory _initialId) {
        gameData.push(GameOptions(_initialId));
    }

    function getGameData() public view returns (GameOptions[] memory) {
        return gameData;
    }

    function addGame(string memory _id) public {
        gameData.push(GameOptions(_id));
    }

    function updateGame(uint index, string memory _newId) public {
        require(index < gameData.length, "Index out of bounds");
        gameData[index].id = _newId;
    }

    function getGameData() public view returns (
        string memory,
        string[] memory,
        string[] memory,
        uint256[] memory,
        bool[] memory
    ) {
        uint length = gameData.players.length;

        string[] memory ids = new string[](length);
        string[] memory wallets = new string[](length);
        uint256[] memory amounts = new uint256[](length);
        bool[] memory readyFlags = new bool[](length);

        for (uint i = 0; i < length; i++) {
            Player storage player = gameData.players[i];
            ids[i] = player.id;
            wallets[i] = player.wallet;
            amounts[i] = player.amount;
            readyFlags[i] = player.ready;
        }

        return (gameData.id, ids, wallets, amounts, readyFlags);
    }

}
