
// get firestore
// The Firebase Admin SDK to access Firestore.
import {initializeApp} from "firebase-admin/app";
import {getFirestore, Timestamp} from "firebase-admin/firestore";
import * as logger from "firebase-functions/logger";
import {currentDate} from "./current_date";


import express = require("express");
import {RequestBody} from "../models/request_body";
import {getUserId} from "../auth/user";


// Initialize the app with a service account, granting admin privileges
initializeApp();

// Initialize Cloud Firestore and get a reference to the service
const db = getFirestore();

// date
const date = currentDate();


// / API call to upload water flow data
export const uploadWaterFlowData =
  async (request: express.Request, response: express.Response) => {
    try {
      // first get the payload from the request body
      const body = request.body;

      // request body as json
      const requestBody: RequestBody = JSON.parse(JSON.stringify(body));

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
        // get section name
        // convert section to lowercase and remove
        //   any spaces and replace them with _
        const section = requestBody.section.toLowerCase().replace(" ", "_");
        // get email
        const email = requestBody.email;
        // get user id
        const userId = await getUserId(email);

        //* check if user id is not empty
        if (!userId) {
          response.status(400).send("User not found");
        } else {
          uploadWaterData(value, section, userId, response);
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
 * @param {String} sectionName - the section name
 * @param {String} userId - the user id
 * @param {express.Response} response - express response
 */
export async function
uploadWaterData(value: number,
  sectionName: string,
  userId: string,
  response: express.Response,
)
  : Promise<void> {
  // Prepare data for Firestore
  const newSection = {
    label: sectionName,
    userId: userId,
    uploaded_on: Timestamp.now(),
  };

  // confirm that this section belongs to this user
  //  if its user id property is the same as the userId
  //  passed in the request
  //  if not, return an error
  //  if it does, proceed to upload the data
  //  if the section does not exist, create it with the newSection
  const section = await db.collection("sections").doc(sectionName).get();


  // * if this section exists
  if (section.exists) {
    // ! check if the user id is the same as the user id passed
    //  in the request
    if (section.get("userId") !== userId) {
      // send a response json to the client
      const responseBody = {
        status: "failed",
        message:
          `Section ${sectionName} does not belong to user ${userId}`,
      };

      // log the response
      logger.error(`Response: ${JSON.stringify(responseBody)}`,
        {structuredData: true});

      response.status(400).send(responseBody);
    } else {
      //* upload the data if the user is the same
      uploadWaterDataToFirestore(value, sectionName, response);
    }
  } else {
    // * if this section does not exist
    // create the section
    db.collection("sections").doc(sectionName).set(newSection).then(() => {
      // upload the data
      uploadWaterDataToFirestore(value, sectionName, response);
    });
  }
}

/**
 *  upload water
 * called to verify the transaction and upload it to cloud
 * @param {number} value - the value
 * @param {String} sectionName - the section name
 * @param {express.Response} response - express response
 */
export async function
uploadWaterDataToFirestore(value: number,
  sectionName: string,
  response: express.Response,
)
  : Promise<void> {
  // Prepare data for Firestore
  const waterFlowData = {
    value,
    uploaded_on: Timestamp.now(),
    // userId: userId,
  };

  // get section name
  const waterFlowCollection = `sections/${sectionName}/${date}`;

  // Write data to Firestore
  const upload = await db
    .collection(waterFlowCollection)
    .add(waterFlowData).then(() => {
      logger.info(
        `Water uploaded: ${value} at
         ${date} to ${waterFlowCollection}`,
        {structuredData: true});
    }).then(() => {
      // send a response json to the client
      const responseBody = {
        status: "success",
        message:
          `Water uploaded: ${value} at ${date} to ${waterFlowCollection}`,
      };

      // log the response
      logger.info(`Response: ${JSON.stringify(responseBody)}`,
        {structuredData: true});

      response.status(200)
        .send(responseBody);
    });

  return upload;
}
