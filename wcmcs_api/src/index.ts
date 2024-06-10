
// Express JS dependencies
import express = require("express");

// Add cors middleware to dependencies
// https://expressjs.com/en/resources/middleware/cors.html
import cors = require("cors");
import { uploadWaterFlowData } from "./api/water_upload";
import { getTapStatus } from "./api/tap_status";
import { updateTankWaterLevel } from "./api/update_level";

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
// * upload
// This takes in a JSON
// {
//     "value": 20,
//     "email": "email"
//     "userId": "user_id"
// }
// * Uploads Values to Cloud
app.post("/upload", uploadWaterFlowData);

// * update_level
// This takes in a JSON
// {
//     "height": 20,
//     "email": "email"
// }
// * Uploads Values to Cloud
app.post("/update_level", updateTankWaterLevel);

// * tap_status
// This takes in a query parameter as the section name
// and returns the controller value for that section
// in the response
app.get("/tap_status", getTapStatus);


// ? ------------ Test Routes ------------
app.get("/hello", async (request, response) => {
  // get value from the request body
  // as a double value
  // const value: number = request.body.value as number;
  const value = request.body.value;


  response.status(200).send(`Yoo World ${value}`);
});

//  for testing
app.post("/test", uploadWaterFlowData);


// Start Express server
app.listen(port, () => {
  // Callback function when server is successfully started
  console.log(`Server started at http://localhost:${port}`);
});

// Export Express app
export default app;
