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
    Insert the `secret` value into `masternodeblsprivkey=xxx` in the file `/home/pirate/.piratecore/piratecash.conf`. (in docker)

7. **Run the script** `./install_masternode.sh` for automatic setup.

8. **Restart Docker.**

9. **Activate the masternode** via PirateCash Core. For more details, visit: [Masternode Activation](https://p.cash/en/site/masternode)

