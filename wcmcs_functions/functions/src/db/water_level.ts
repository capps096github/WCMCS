//
import {getFirestore} from "firebase-admin/firestore";
import * as logger from "firebase-functions/logger";
import {getUserId} from "../auth/user";
// import {tankConverter} from "../models/tank";

import express = require("express");
import {WaterLevelRequestBody} from "../models/request_body";

// Initialize Cloud Firestore and get a reference to the service
const db = getFirestore();

// takes query params as email and height
export const updateWaterLevel =
    async (request: express.Request, response: express.Response) => {
      try {
        // * request means the request object
        // that is provided by the express server
        // * when a user makes a request to the endpoint
        // first get the payload from the request body
        // WaterLevelRequestBody is the type of the request body
        const body = request.body;

        // request body as json
        const requestBody:
                WaterLevelRequestBody =
                JSON.parse(JSON.stringify(body));

        // log the request body
        logger.info(`Request body: ${JSON.stringify(requestBody)}`,
          {structuredData: true});

        // check if the email is not empty
        if (!body) {
          response.status(400).send("Missing required field: email or height");
        } else {
          // get the email and height from the request body
          const email = requestBody.email;

          // get the height from the request body
          const heightOfWaterFlown = requestBody.height;

          // get the user id from the email
          const userId = await getUserId(email);

          // Create a reference to the collection
          const tankReference =
                    db.collection("tanks")
                      .doc(userId);
                      // .withConverter(tankConverter);

          // get the controller value from this
          //    section and return it in the response
          const tankDocSnapshot = await tankReference.get();

          // check if the document exists
          if (tankDocSnapshot.exists) {
            // update the water level
            await tankReference.update(
              {height: heightOfWaterFlown}
            ).then(() => {
              // response body
              const responseBody = {
                status: "success",
                message: "Water level updated successfully",
              };

              // log the response
              logger.info(`Response: ${JSON.stringify(responseBody)}`,
                {structuredData: true});

              // send a 200 response to the client
              response.status(200).send(responseBody);
            });
          } else {
            // send a 404 response to the client
            const responseBody = {
              status: "error",
              message: "Tank not found",
            };
            // log the response
            logger.info(`Response: ${JSON.stringify(responseBody)}`,
              {structuredData: true});

            // send a 404 response to the client
            response.status(404).send(responseBody);
          }
        }
      } catch (error) {
        logger.error(error);
        response.status(500).send("Error deleting collection: " + error);
      }
    };
