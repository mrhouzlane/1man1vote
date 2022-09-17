const hre = require("hardhat");

async function main() {

  [owner, addr1, addr2, addr3, ...addrs] = await hre.ethers.getSigners();


  t = ["0xA071F1BC494507aeF4bc5038B8922641c320d486", "0x8Cb9C0b4060Ec96E73e2d4f63D1E4b72f2499c7F" ]

  const Snapshot = await hre.ethers.getContractFactory("Snapshot");
  const snapshot= await Snapshot.deploy("1MAN1VOTE", "1M1V", t);
  await snapshot.deployed();


  console.log("snapshot deployed to", snapshot.address)
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});