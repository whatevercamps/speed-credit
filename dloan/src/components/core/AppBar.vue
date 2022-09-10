<template>
  <div class="flex flex-row justify-between mt-4 mx-8 items-center">
    <span v-if="account.loaded" class="text-2xl font-bold"> Welcome, {{ account.name }}!</span>
    <span v-else class="text-2xl font-bold"> Welcome, Guest!</span>
    <div class="avatar online">
      <div class="w-14 rounded-full">
        <img src="https://placeimg.com/192/192/people" />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { useAccountStore } from "@/stores/accountStore";
import { defineComponent } from "vue";
import { useWeb3Store } from "../../stores/web3Store";

export default defineComponent({
  name: "ContractBtn",
  props: {
    name: {
      type: String,
      default: "",
    },
  },
  data() {
    return {
      wallet: useWeb3Store(),
      account: useAccountStore()
    };
  },
  methods: {
    logout() {
      this.wallet.disconnect();
    },
  },
});
</script>
