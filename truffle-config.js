require("babel-register");
require("babel-polyfill");

module.exports = {
  networks: {
    development: {
      // using WSL2 I had to use ganache-cli
      // turn that on first, then turn on ganache GUI
      // was able to connect that way
      host: "127.0.0.1",
      port: "8545",
      network_id: "*", // match any network
    },
  },
  contracts_directory: "./src/contracts",
  contracts_build_directory: "./src/truffle_abis",
  compilers: {
    solc: {
      version: "^0.5.0",
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
