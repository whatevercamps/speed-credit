<template>
    <button v-if="!wallet.connected" @click="connect" class="connect-btn btn font-bold">Connect Wallet </button>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { useWeb3Store } from "../../stores/web3Store";

export default defineComponent({
  name: "ConnectBtn",
  data() {
    return {
      wallet: useWeb3Store(),
    };
  },
  methods: {
    connect() {
      this.$emit("try-connect-wallet");
    },
  },
});
</script>

<style scoped>
.connect-btn {
  position: absolute;
  bottom: 15px;
  width: calc(100% - 42px);
  margin-left: 26px;
  margin-right: 26px;
}

  
</style>
