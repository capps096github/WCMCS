// 
import {onRequest} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";

// Express JS dependencies
import express = require("express");

// Add cors middleware to dependencies
// https://expressjs.com/en/resources/middleware/cors.html
import cors = require("cors");
import { currentDate } from "./db/current_date";
import { uploadWaterFlowData, uploadWaterData } from "./db/upload";

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
    logger.error(`Express Error Middleware (Error): ${error}`);
    logger.error(`Express Error Middleware (Request): ${request}`);
    logger.error(`Express Error Middleware (Next): ${next}`);
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
app.get('/date', currentDate);

// test upload get endpoint that will be used to test the uploadWaterData function
app.get('/test', (request: express.Request, response: express.Response) => {
    console.log('Test upload endpoint');
    
    uploadWaterData(20, "kitchen");
    uploadWaterData(30,"garden");
    uploadWaterData(22.6,"washroom");
    console.log('Completed Test upload endpoint');
});

// This takes in a JSON
// {
//     "value": 20,
//     "sectionName": "kitchen"
// }
// post endpoint for uploading water flow data
app.post('/upload', uploadWaterFlowData);

// * Add the express app to the onRequest function
/**
Docs: https://firebase.google.com/docs/functions/http-events?gen=2nd#using_existing_express_or_flask_apps
Expose Express API as a single Cloud Function:
*/
export const waterAPI = onRequest(app);
