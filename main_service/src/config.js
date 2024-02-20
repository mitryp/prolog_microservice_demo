export function buildConfig() {
    return {
        // server properties
        host: process.env.HOST,
        port: process.env.PORT,

        // advice service properties
        adviceServiceHost: process.env.ADVICE_SERVICE_HOST,
        adviceServicePort: process.env.ADVICE_SERVICE_PORT,
    };
}