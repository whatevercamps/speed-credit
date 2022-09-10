<template>
	<div class="transactions">
		<div class="flex flex-row justify-between">
			<h3>Last Transaction</h3>
			<a class="text-purple-400">View All</a>
		</div>
		<div class="no-transactions flex flex-col justify-center items-center">
			<img  src="/assets/no-message.png" />
			<span class="text-gray-400">No transactions yet</span>
		</div>
	</div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
	name: 'Transactions',
})
</script>

<style scoped>
.transactions {
	margin: 26px;
}

.no-transactions {
	margin-top: 50px;
}
</style>