<template>
  <div class="credit-card card bg-base-100 shadow-xl">
    <div class="card-body">
      <h2 v-if="account.loaded" class="text-xl text-white ">{{account.name}}</h2>
			<h2 v-else class="text-xl text-white ">Guest</h2>
      <div class="flex flex-row justify-between my-1">
				<span class="text-white">Available</span>
				<span v-if="account.loaded" class="text-white">${{account.loan}}</span>
				<span v-else class="text-white">$0</span>
			</div>
			<div class="flex flex-row justify-between">
				<span class="text-white">Used Balance</span>
				<span class="text-white">$0</span>
			</div>
			<div class="flex flex-row justify-between my1">
				<span class="text-white">Credit score</span>
				<span v-if="account.loaded" class="text-white">{{account.score}}</span>
				<span v-else class="text-white">0</span>
			</div>
    </div>
  </div>
</template>

<script lang="ts">
import { useAccountStore } from "@/stores/accountStore";
import { defineComponent } from "vue";

export default defineComponent({
  name: "CreditCard",
	data() {
		return {
			account: useAccountStore()
		};
	},
});
</script>

<style scoped>
.credit-card {
	margin: 26px;
	border-radius: 50px;
	background-color: #1B2337;
	min-height: 199px;
}
</style>