// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SkiRaceOnChain {
    uint8 public constant TRACK_LENGTH = 30;
    uint8 public constant MAX_PLAYERS = 4;

    address[] public players;
    mapping(address => uint8) public positions;
    mapping(address => bool) public hasJoined;
    mapping(address => bool) public hasFinished;

    bool public raceStarted;
    address public winner;

    event PlayerJoined(address indexed player);
    event PlayerMoved(address indexed player, uint8 newPosition);
    event RaceStarted();
    event RaceFinished(address indexed winner);

    modifier onlyPlayer() {
        require(hasJoined[msg.sender], "Not a registered player");
        _;
    }

    function joinRace() external {
        require(!raceStarted, "Race already started");
        require(!hasJoined[msg.sender], "Already joined");
        require(players.length < MAX_PLAYERS, "Race is full");

        players.push(msg.sender);
        hasJoined[msg.sender] = true;
        positions[msg.sender] = 0;

        emit PlayerJoined(msg.sender);
    }

    function startRace() external {
        require(!raceStarted, "Race already started");
        require(players.length > 1, "Not enough players");

        raceStarted = true;
        emit RaceStarted();
    }

    function move(uint8 steps) external onlyPlayer {
        require(raceStarted, "Race not started");
        require(steps >= 1 && steps <= 3, "Invalid move (must be 1-3)");
        require(!hasFinished[msg.sender], "You already finished");

        positions[msg.sender] += steps;
        emit PlayerMoved(msg.sender, positions[msg.sender]);

        if (positions[msg.sender] >= TRACK_LENGTH) {
            hasFinished[msg.sender] = true;
            if (winner == address(0)) {
                winner = msg.sender;
                emit RaceFinished(winner);
            }
        }
    }

    function getPlayerCount() external view returns (uint256) {
        return players.length;
    }

    function getTrack() external view returns (address[] memory, uint8[] memory) {
        uint8[] memory pos = new uint8[](players.length);
        for (uint i = 0; i < players.length; i++) {
            pos[i] = positions[players[i]];
        }
        return (players, pos);
    }
}
