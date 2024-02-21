// © Dmytro Popov

import { AdviceInterface } from "./advice.js";
import { buildConfig } from './config.js';
import express from 'express';

function bootstrap() {
    const { host, port, adviceServiceHost, adviceServicePort } = buildConfig();

    const app = express();
    app.use(express.json());

    const adviceInterface = new AdviceInterface(
        `http://${adviceServiceHost}:${adviceServicePort}`
    );

    app.get(
        '/options',
        (_, res) => adviceInterface.getOptions()
            .then((options) => res.json(options))
    );

    app.post(
        '/advice',
        async (req, res) => {
            // must be {interests: string[], skills: string[]}
            const userInfo = req.body;

            if (!userInfo
                || !userInfo.interests
                || !userInfo.skills
                || userInfo.interests.length == 0
                || userInfo.skills.length == 0) {
                res.status(400).send({
                    status: 400,
                    message: 'Bad request',
                });
                return;
            }

            const { professions } = await adviceInterface.getAdvice(userInfo);

            res.json({
                suggestions: professions,
            });
        }
    );

    app.listen(port, host, () =>
        console.log(`Server running on ${host}:${port}`));
}

bootstrap();
