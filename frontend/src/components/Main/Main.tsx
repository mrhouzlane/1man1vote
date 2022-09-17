import { CheckCircleIcon } from "@chakra-ui/icons";
import { Box, Button, Link, Stack, useToast } from "@chakra-ui/react";
import { ethers } from "ethers";
import React from "react";
import { useSigner } from "wagmi";

import config from "../../../config.json";
import { abi } from "../../lib/ABI";
import { ConnectWalletWrapper } from "../ConnectWalletWrapper";

export const Main: React.FC = () => {
  const { data: signer } = useSigner();
  const toast = useToast();

  // TODO: Change contractAddress and ABI
  const contractAddress = "0xaBC6b6bcd17c0fca4c8AE5964E6D4130Aa0B39D1";

  const main = async () => {
    if (!signer) return;
    const contract = new ethers.Contract(contractAddress, abi, signer);

    // TODO: Change function name
    const transaction = await contract.balanceAt("0x839B878873998F02cE2f5c6D78d1B0842e58F192", 1663374888);
    if (!transaction) return;
    toast({
      render: () => (
        <Box color="white" p={3} bg={"green"} rounded={"md"}>
          <CheckCircleIcon mr="2" />
          Please wait for confirmation for Balance Request Tx:{" "}
          <Link
            textDecoration={"underline"}
            fontSize="sm"
            isExternal
            href={`https://goerli.etherscan.io/tx/${transaction.hash}`}
            maxWidth={80}
            noOfLines={1}
          >
            {transaction.hash}
          </Link>
        </Box>
      ),
      isClosable: true,
      duration: 10000,
    });
    console.log("main logic start...");
  };

  return (
    <Box
      boxShadow={"base"}
      borderRadius="2xl"
      p="4"
      backgroundColor={config.styles.background.color.main}
    >
      <Stack spacing="4">
        <ConnectWalletWrapper>
          <Button
            w="full"
            variant={config.styles.button.variant}
            rounded={config.styles.button.rounded}
            size={config.styles.button.size}
            fontSize={config.styles.button.fontSize}
            color={config.styles.text.color.primary}
            onClick={main}
          >
            balanceAt
          </Button>
        </ConnectWalletWrapper>
      </Stack>
    </Box>
  );
};
