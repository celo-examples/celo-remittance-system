const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    local: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    alfajores: {
      provider: function() {
        return new HDWalletProvider(
          "across guitar decorate orient prize kind tilt test kick protect inside swamp transfer absorb finger shove ignore galaxy smooth year dynamic case move cargo",
          "https://alfajores-forno.celo-testnet.org"
        )
      },
      network_id: 44787,
      gas: 10000000
    },
    celo: {
      provider: function() {
        return new HDWalletProvider(
          "across guitar decorate orient prize kind tilt test kick protect inside swamp transfer absorb finger shove ignore galaxy smooth year dynamic case move cargo",
          "https://forno.celo.org"
        )
      },
      network_id: 42220,
      gas: 10000000
    }
  },
  compilers: {
    solc: {
      version: "0.8.7",
      settings: {
        optimizer: {
          enabled: false,
          runs: 200
        },
        evmVersion: "istanbul"
      }
    }
  }
};
