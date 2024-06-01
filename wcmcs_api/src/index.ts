
// Express JS dependencies
import express = require("express");

// Add cors middleware to dependencies
// https://expressjs.com/en/resources/middleware/cors.html
import cors = require("cors");
import { currentDate } from "./db/formated_time";
import { uploadWaterFlowData } from "./db/upload";
import { uploadWaterData } from "./db/test_upload";

// Create an express app
export const app = express();

// cors options
export const corsOptions = {
    origin: true,
    optionsSuccessStatus: 200,
};

//* set port to 3000 so that the server can be accessed at http://localhost:3000
// Use environment variable for port
export const port = 3000;

//* Error handling middleware (improves error handling)
app.use((error: Error, request: express.Request,
    response: express.Response, next: express.NextFunction) => {
    // log the request
    console.error(`Express Error Middleware (Error): ${error}`);
    console.error(`Express Error Middleware (Request): ${request}`);
    console.error(`Express Error Middleware (Next): ${next}`);
    response.status(500).send({ error: error.message });
});

//* use cors middleware
// when deaclared like this it will be applied to all routes
// else if you want to apply it to a specific route then
//  you can add it to that route
app.use(cors(corsOptions));

//* parse incoming JSON data
app.use(express.json({ type: "application/json" }));

// ! ------------------ Routes ------------------
// Define Express routes
app.get('/', currentDate);

// test upload get endpoint that will be used to test the uploadWaterData function
app.get('/test-upload', (request: express.Request, response: express.Response) => {
    console.log('Test upload endpoint');

    uploadWaterData(20, response);
});

// post endpoint for uploading water flow data
app.post('/water-flow', uploadWaterFlowData);

// Start Express server
app.listen(port, () => {
    // Callback function when server is successfully started
    console.log(`Server started at http://localhost:${port}`);
});

// Export Express app
export default app;