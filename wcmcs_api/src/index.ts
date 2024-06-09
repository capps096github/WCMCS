
// Express JS dependencies
import express = require("express");

// Add cors middleware to dependencies
// https://expressjs.com/en/resources/middleware/cors.html
import cors = require("cors");
import { uploadWaterFlowData } from "./api/water_upload";

// Create an express app
export const app = express();

// cors options
export const corsOptions = {
  origin: true,
  optionsSuccessStatus: 200,
};

//* set port to 3000 so that the server can be accessed at http://localhost:3000
// Use environment variable for port
export const port = 3500;

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
app.post("/hello", async (request, response) => {
  // get value from the request body
  // as a double value
  // const value: number = request.body.value as number;
  const value = request.body.value;


  response.status(200).send(`Yoo World ${value}`);
});

// This takes in a JSON
// {
//     "value": 20,
//     "sectionName": "kitchen"
//     "userId": "user_id"
// }
app.post("/test", uploadWaterFlowData);
app.post("/upload", uploadWaterFlowData);

// * Add the express app to the onRequest function
/**
Docs: https://firebase.google.com/docs/functions/http-events?gen=2nd#using_existing_express_or_flask_apps
Expose Express API as a single Cloud Function:
*/
// export const waterAPI = onRequest(app);

// API served on Function URL (waterAPI(us-central1)): https://waterapi-i6mmg3netq-uc.a.run.app

// Test Credentials
// cephas@test.com
// CephasTest


// Start Express server
app.listen(port, () => {
  // Callback function when server is successfully started
  console.log(`Server started at http://localhost:${port}`);
});

// Export Express app
export default app;
