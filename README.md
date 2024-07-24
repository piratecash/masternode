# Automatic Deployment of a Masternode in Docker

1. **Purchase 10001 PIRATE**, for example on PancakeSwap: [PancakeSwap](https://pancakeswap.finance/swap?inputCurrency=0x55d398326f99059fF775485246999027B3197955&outputCurrency=0xaFCC12e4040615E7Afe9fb4330eB3D9120acAC05)

2. **Exchange your tokens** for native coins via [@piratecash_bot](https://t.me/piratecash_bot) if you already have the tokens.

3. **Launch a node** on a hosting service, for example, Vultr: [Vultr](https://m.do.co/c/043f3ef15305) (using this link, you will receive a bonus on your account).

4. **Access the server via SSH.**

5. **Clone the repository:** [https://github.com/piratecash/masternode](https://github.com/piratecash/masternode)

6. **Generate a BLS key** in PirateCash:
    ```bash
    bls generate
    ```
    Insert the `secret` value into `masternodeblsprivkey=xxx` in the file `/home/pirate/.piratecore/piratecash.conf' (in the docker) or /opt/node/piratecash/piratecash.conf on host system.

7. **Run the script** `./install_masternode.sh` for automatic setup.

8. **Restart Docker.**

9. **Activate the masternode** via PirateCash Core. For more details, visit: [Masternode Activation](https://p.cash/en/site/masternode)


## Donate

**Stand with us and support!**

Indeed, we have been working hard ever since we launched PirateCash. Still, we sincerely believe in our idea and keep up with the world, gaining experience and skills on the way to a better future. We are quite optimistic about our project and we are ready to work our heads off! However, we could never be where we are now without you, and our team needs you like never before.

**Donation Addresses**

PirateCash: `PWb32EauXNUQm8rD6XFCtaaTn7vCesPDHN`

Cosanta: `CGefSFXEjBEZA6gmXWaxNa35STfv8ZTWeR`

Bitcoin: `3G5fwc9PP9Lcb1y3RAYGzoQZs5enJkmdxN`

Bitcoin Cash: `qr4f0pkvx86vv6cuae48nj83txqhwyt2fgadd9smxg`

BNB Smart Chain: `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

PIRATE (BEP20): `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

Polygon: `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

Avalanche: `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

Gnosis: `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

Fantom: `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

Arbitrum: `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

Optimism: `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

ECASH: `ecash:qrzcal2fmm6vumxp3g2jndk0fepmt2racya9lc4yxy`

Solana: `CefzHT5zCUncm3yhTLck9bCRYkbjHrKToT1GpPUyqCMa`

BNB Beacon Chain: `bnb132w7sndlwn340jgqff2m9m4nsddx3hga55nx3l`

USDT (BEP20): `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

Litecoin: `MNbHsci3A8u6UiqjBMMckXzfPrLjeMxdRC`

DASH: `XcpUrR8LkohMNB9TfJaC97id6boUhRU3wk`

DOGE: `D5PpSeZAGghckLtep1vMwxoAZaGYmx5cv6`

Ethereum: `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

USDT (ERC-20): `0x52be29951B0D10d5eFa48D58363a25fE5Cc097e9`

TONCOIN: `UQCYTBH7n8OnQ6BgOfdkNRWF7socLJb9U-JMRcoz3UpL_0V6`

TRX: `TAaYtFBxJztC5pG1zMapvUFSfEyJLSLJM5`

USDT (TRC-20): `TAaYtFBxJztC5pG1zMapvUFSfEyJLSLJM5`

Solana: `CefzHT5zCUncm3yhTLck9bCRYkbjHrKToT1GpPUyqCMa`

GIO: `GRHo2CpQhkEcFivJJYk1kaSGiVjeZaMQNs`

XEC (ECASH): `ecash:qrzcal2fmm6vumxp3g2jndk0fepmt2racya9lc4yxy`

zCash: `t1MKoU27aZ6yQW7uBiCFqihATVhgfGiEYyz`

zCash: `zs1hwyqs4mfrynq0ysjmhv8wuau5zam0gwpx8ujfv8epgyufkmmsp6t7cfk9y0th7qyx7fsc5azm08`
