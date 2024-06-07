
// get firestore
// The Firebase Admin SDK to access Firestore.
import { initializeApp } from "firebase-admin/app";
import { getFirestore, Timestamp } from "firebase-admin/firestore";
import { currentDate } from "./formated_time";


import express = require("express");

import admin = require("firebase-admin");

// location of the service account key
const serviceAccount = require("E:/Cephas School/Semester 2/Final Year Project/WCMCS/wcmcs_api/secrets/service_key.json");

// Initialize the app with a service account, granting admin privileges
initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

// Initialize Cloud Firestore and get a reference to the service
const db = getFirestore();

// water flow collection
// section name
const sectionName = "kitchen";

// date
const date = currentDate();

// sections/{section_name}/{date}/{document_id}
const waterFlowCollection = `sections/${sectionName}/${date}`;
// const waterFlowCollection = `sections/kitchen/${date}`;

export const uploadWaterFlowData =
    async (request: express.Request, response: express.Response): Promise<void> => {
        try {
            // get value from the request body
            // as a double value
            const value: number = request.body.value as number;


            // Validation (optional)
            if (!value) {
                response.status(400).send('Missing required fields: value and timestamp');
            }

            // Prepare data for Firestore
            const waterFlowData = {
                value,
                uploaded_on: Timestamp.now(),
            };

            // Write data to Firestore
            const upload = await db.collection(waterFlowCollection).add(waterFlowData).then(() => {
                console.info(
                    `Water uploaded: ${value} at ${date} to ${waterFlowCollection}`,
                    { structuredData: true });
            });

            response.status(200).send('Water flow data uploaded successfully');

            // return the upload
            return upload;
            
        } catch (error) {
            console.error(error);
            response.status(500).send('Error uploading water flow data');
        }
    };