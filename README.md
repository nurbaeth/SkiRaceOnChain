# ⛷️ SkiRaceOnChain

**SkiRaceOnChain** is a fun, fully on-chain winter racing game built with Solidity. Players compete in a ski race by taking turns and moving across a snowy track. First to reach the finish line wins — no tokens, no betting, just pure snow-fueled competition!

---

## ❄️ Features

- 🎮 Turn-based ski race game
- 🧊 Fully on-chain logic and state
- 👫 Up to 4 players per race
- 🚫 No tokens, no gas prizes — just for fun
- ✅ Simple mechanics (move 1–3 steps per turn)
- 🏁 Winner is recorded on-chain

---

## 📦 Smart Contract Overview

- `joinRace()`: Register as a racer
- `startRace()`: Start the race when ready
- `move(steps)`: Move forward (1–3 steps) 
- `winner`: Address of the player who won
- `getTrack()`: View positions of all racers

---

## 🛠️ Tech Stack

- [Solidity](https://soliditylang.org/)
- [Hardhat](https://hardhat.org/) (recommended for testing)
- EVM-compatible networks

---

## 🚀 Getting Started

```bash
git clone https://github.com/your-username/SkiRaceOnChain.git
cd SkiRaceOnChain
npm install
npx hardhat compile
