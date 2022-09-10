import { defineStore } from "pinia";

export const useWeb3Store = defineStore('web3', {
	state: () => ({
		connected: false,
		provider: null
	}),
	actions: {
		connect(provider: any) {
			this.connected = true;
			this.provider = provider;
		},
		disconnect() {
			this.connected = false;
			this.provider = null;
		}
	}
});