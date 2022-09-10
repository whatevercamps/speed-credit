<template>
  <div>
    <div
      v-if="showModal"
      class="cm-modal overflow-x-hidden overflow-y-auto fixed inset-0 z-50 outline-none focus:outline-none justify-center items-center flex"
    >
      <div
        class="border-0 rounded-3xl shadow-lg relative flex flex-col w-full bg-white outline-none focus:outline-none"
      >
        <div class="flex justify-center">
          <h1 class="text-xl font-bold mb-4 mt-6">Connect Wallet</h1>
        </div>
        <button
          v-if="!isLoading"
          @click="connectWallet"
          class="flex flex-col items-center"
        >
          <img class="h-32" src="/assets/Metamask-icon.png" />
          <h2 class="font-bold">Metamask</h2>
        </button>
        <div v-if="isLoading" class="flex flex-col items-center mt-20">
          <div class="lds-roller">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
          </div>
        </div>
        <a href="https://metamask.io/" class="mt-24 text-center text-xs pb-1"
          >Haven’t got a crypto wallet yet?</a
        >
        <button
          @click="goToMetamask"
          class="btn rounded-xl w-60 m-auto mb-4 font-bold"
        >
          Learn How to Connect
        </button>
      </div>
    </div>
    <div v-if="showModal" class="back-blur opacity-25 fixed inset-0 z-40 bg-black"></div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "Modal",
  props: {
    showModal: {
      type: Boolean,
      default: true,
    },
    isLoading: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    toogleModal() {
      this.$emit("toogleModal");
    },
    goToMetamask() {
      window.open("https://metamask.io/", "_blank");
    },
    connectWallet() {
      this.$emit("connectWallet");
    },
  },
});
</script>

<style scoped>
.cm-modal {
  min-height: 644px;
  max-width: 350px;
  margin: auto;
}

@media screen and (max-width: 768px) {
  .cm-modal {
    margin: 25px;
  }
}

.lds-roller {
  display: inline-block;
  position: relative;
  width: 64px;
  height: 64px;
}
.lds-roller div {
  animation: lds-roller 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
  transform-origin: 32px 32px;
}
.lds-roller div:after {
  content: " ";
  display: block;
  position: absolute;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: rgb(57, 58, 67);
  margin: -3px 0 0 -3px;
}
.lds-roller div:nth-child(1) {
  animation-delay: -0.036s;
}
.lds-roller div:nth-child(1):after {
  top: 50px;
  left: 50px;
}
.lds-roller div:nth-child(2) {
  animation-delay: -0.072s;
}
.lds-roller div:nth-child(2):after {
  top: 54px;
  left: 45px;
}
.lds-roller div:nth-child(3) {
  animation-delay: -0.108s;
}
.lds-roller div:nth-child(3):after {
  top: 57px;
  left: 39px;
}
.lds-roller div:nth-child(4) {
  animation-delay: -0.144s;
}
.lds-roller div:nth-child(4):after {
  top: 58px;
  left: 32px;
}
.lds-roller div:nth-child(5) {
  animation-delay: -0.18s;
}
.lds-roller div:nth-child(5):after {
  top: 57px;
  left: 25px;
}
.lds-roller div:nth-child(6) {
  animation-delay: -0.216s;
}
.lds-roller div:nth-child(6):after {
  top: 54px;
  left: 19px;
}
.lds-roller div:nth-child(7) {
  animation-delay: -0.252s;
}
.lds-roller div:nth-child(7):after {
  top: 50px;
  left: 14px;
}
.lds-roller div:nth-child(8) {
  animation-delay: -0.288s;
}
.lds-roller div:nth-child(8):after {
  top: 45px;
  left: 10px;
}
@keyframes lds-roller {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
