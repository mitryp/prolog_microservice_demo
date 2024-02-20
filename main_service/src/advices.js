import fetch from "node-fetch";

export class AdvicesInterface {
    address;

    constructor(address) {
        this.address = address;
    }

    /**
     * Returns all skills and interests known by the Prolog service.
     * @returns {Promise<{skills: string[], interests: string[]}>}
     */
    async getOptions() {
        const res = await fetch(`${this.address}/options`);

        return res.json();
    }

    /**
     * Takes a userInfo object and eturns the career suggestions 
     * from the Prolog service.
     * 
     * @param {{skills: string[], interests: string[]}} userInfo 
     * @returns {Promise<{professions: string[]}>}
     */
    async getAdvice(userInfo) {
        const res = await fetch(`${this.address}/careers`, {
            method: 'post',
            body: JSON.stringify(userInfo),
            headers: {'Content-Type': 'application/json'},
        });

        return res.json();
    }
}
