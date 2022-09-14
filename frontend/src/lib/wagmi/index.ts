import { getDefaultProvider } from "ethers";
import { createClient } from "wagmi";
import { CoinbaseWalletConnector } from "wagmi/connectors/coinbaseWallet";
import { InjectedConnector } from "wagmi/connectors/injected";
import { WalletConnectConnector } from "wagmi/connectors/walletConnect";

const ALCHEMY_KEY = process.env.ALCHEMY_KEY;

export const wagmiClient = createClient({
  autoConnect: true,
  provider: getDefaultProvider(),
});

export const connectors = {
  injected: new InjectedConnector(),
  walletConnect: new WalletConnectConnector({
    options: {
      qrcode: true,
    },
  }),
  coinbaseWallet: new CoinbaseWalletConnector({
    options: {
      appName: "wagmi.sh",
      jsonRpcUrl: `https://eth-mainnet.alchemyapi.io/v2/${ALCHEMY_KEY}`,
    },
  }),
};
