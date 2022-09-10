<template>
  <div>
    <div :class="showModal ? 'main-app-blur' : ''">
      <AppBar/>
      <CreditCard/>
      <Transactions/>
      <ConnectBtn v-if="!wallet.connected" @try-connect-wallet="toggleModal"/>
    </div>
    <Modal
      :show-modal="showModal"
      :is-loading="isLoading"
      @toggle-modal="toggleModal"
      @connect-wallet="connectWallet"
      v-if="showModal"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Modal from "@/components/core/Modal.vue";
import AppBar from "@/components/core/AppBar.vue";
import CreditCard from "@/components/CreditCard.vue";
import Transactions from "@/components/Transactions.vue";
import { useWeb3Store } from "@/stores/web3Store";
import ConnectBtn from "../components/core/ConnectBtn.vue";
import loanJson from "@/jsons/Score.json";
import Web3 from "web3";
import { useAccountStore } from "@/stores/accountStore";

export default defineComponent({
  name: "HomeView",
  data() {
    return {
      showModal: false,
      isLoading: false,
      wallet: useWeb3Store(),
      account: useAccountStore(),
    };
  },
  methods: {
    toggleModal() {
      this.showModal = !this.showModal;
    },
    goToMetamask() {
      window.open("https://metamask.io/", "_blank");
    },
    async loadLoan() {
      if (this.wallet.connected) {
        const web3 = new Web3('https://polygon-mumbai.g.alchemy.com/v2/B5OE0RCL18RM_yZ10vVaH6M_FR9y5IKr')
        const contract = new web3.eth.Contract(loanJson as any, '0x40d0aB710430ccAa2c716A366E8469Bd5D7CEB28');
        const accounts = await web3.eth.getAccounts();
        await contract.methods.requestLoan(700000000).call({from: accounts[0]});
        await contract.methods.getLoan().call({from: accounts[0]});
      }
    },
    connectWallet() {
      this.isLoading = true;
      if (window.ethereum) {
        window.ethereum
          .request({ method: "eth_requestAccounts" })
          .then((accounts: any) => {
            this.wallet.connect(window.ethereum);
            setTimeout(() => {
              this.$data.account.load("Juan", 826, 70000000);
              this.isLoading = false;
              this.showModal = false;
            }, 5000)
          });
      } else {
        alert("Please install MetaMask");
      }
    },
  },
  components: { Modal, AppBar, CreditCard, Transactions, ConnectBtn },
});
</script>

<style>
.main-app-blur {
  filter: blur(5px);
  -webkit-filter: blur(5px);
}
</style>

