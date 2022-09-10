import { defineStore } from "pinia";

export const useAccountStore = defineStore('account', {
	state: () => ({
		loaded: false,
		name: '',
		score: 0,
		loan: 0
	}
	),
	actions: {
		load(name: string, score: number, loan: number) {
			this.name = name;
			this.score = score;
			this.loan = loan;
			this.loaded = true;
		}
	}
});