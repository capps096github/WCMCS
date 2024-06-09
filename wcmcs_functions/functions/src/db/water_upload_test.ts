
// get firestore
// The Firebase Admin SDK to access Firestore.
import {getFirestore, Timestamp} from "firebase-admin/firestore";
import * as logger from "firebase-functions/logger";
import {currentDate} from "./current_date";


import express = require("express");
import {TestRequestBody} from "../models/request_body";

// Initialize Cloud Firestore and get a reference to the service
const db = getFirestore();

// date
const date = currentDate();


// / API call to upload water flow data
export const uploadTestWaterFlowData =
    async (request: express.Request, response: express.Response) => {
      try {
        // first get the payload from the request body
        const body = request.body;

        // request body as json
        const requestBody: TestRequestBody = JSON.parse(JSON.stringify(body));

        // log the request body
        logger.info(`Request body: ${JSON.stringify(requestBody)}`,
          {structuredData: true});

        // Validation (optional)
        if (!body) {
          response.status(400)
            .send("Missing required fields: value and timestamp");
        } else {
          // get value
          const value = requestBody.value;

          //* check if user id is not empty
          if (!value) {
            response.status(400).send("User not found");
          } else {
            uploadTestWaterData(value);

            response.status(200).send("Water flow data uploaded successfully");
          }
        }
      } catch (error) {
        logger.error(error);
        response.status(500).send("Error uploading water flow data");
      }
    };


/**
 *  upload water
 * called to verify the transaction and upload it to cloud
 * @param {number} value - the value
 */
export async function
uploadTestWaterData(value: number)
    : Promise<void> {
  // Prepare data for Firestore
  const waterFlowData = {
    value,
    uploaded_on: Timestamp.now(),
  };

  // get section name
  const waterFlowCollection = "test_sections";


  // Write data to Firestore
  const upload = await db
    .collection(waterFlowCollection)
    .add(waterFlowData).then(() => {
      logger.info(
        `Test Water uploaded: ${value} at ${date} to ${waterFlowCollection}`,
        {structuredData: true});
    });

  return upload;
}
