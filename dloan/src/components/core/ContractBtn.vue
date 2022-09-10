<template>
	<button v-if="wallet.connected" @click="contract">
		la wea fome doofomash
	</button>
</template>
+
<script lang="ts">
import { defineComponent } from 'vue'
import { useWeb3Store } from '../../stores/web3Store';
import Web3 from 'web3';
import scoreJson from '../../jsons/Score.json';


export default defineComponent({
	name: 'ContractBtn',
	data() {
		return {
			wallet: useWeb3Store()
		}
	},
	methods: {
		async contract() {
			const web3 = new Web3('https://polygon-mumbai.g.alchemy.com/v2/B5OE0RCL18RM_yZ10vVaH6M_FR9y5IKr')
			const contract = new web3.eth.Contract(scoreJson as any, '0x53C22aCC41CBF9eb9b9Ec6FFB06a2f4be8d0d106');
			const accounts = await web3.eth.getAccounts();
			const result = await contract.methods.setScore().call({ from: accounts[0] });
			console.log(result);
			}
		}
	}
)
</script>