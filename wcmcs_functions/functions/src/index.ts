//
import {onRequest} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";

// Express JS dependencies
import express = require("express");

// Add cors middleware to dependencies
// https://expressjs.com/en/resources/middleware/cors.html
import cors = require("cors");
import {currentDate} from "./db/current_date";
import {uploadWaterFlowData} from "./db/upload";
import {uploadTestWaterFlowData} from "./db/water_upload_test";
import {deleteSection} from "./db/delete_collection";

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
  response.status(500).send({error: error.message});
});

//* use cors middleware
// when deaclared like this it will be applied to all routes
// else if you want to apply it to a specific route then
//  you can add it to that route
app.use(cors(corsOptions));

//* parse incoming JSON data
app.use(express.json({type: "application/json"}));

// ! ------------------ Routes ------------------
// Define Express routes
app.get("/date", currentDate);


// in this endpoint, you pass in a parameter as the section name
// and it deletes it with all its subcollections
app.get("/delete", deleteSection);

// * a get endpoint for getting the user id currently logged in user
// app.get("/user", getUserId);

app.post("/hello", async (request, response) => {
  response.status(200).send("Hello World");
});

// This takes in a JSON
// {
//     "value": 20,
//     "section": "kitchen"
//     "userId": "user_id"
// }
// post endpoint for uploading water flow data
app.post("/upload", uploadWaterFlowData);

app.post("/upload_test", uploadTestWaterFlowData);

// * Add the express app to the onRequest function
/**
Docs: https://firebase.google.com/docs/functions/http-events?gen=2nd#using_existing_express_or_flask_apps
Expose Express API as a single Cloud Function:
*/
export const waterAPI = onRequest(app);

// API served on Function URL (waterAPI(us-central1)): https://waterapi-i6mmg3netq-uc.a.run.app

// Test Credentials
// cephas@test.com
// CephasTest
