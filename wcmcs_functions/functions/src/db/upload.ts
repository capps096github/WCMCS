
// get firestore
// The Firebase Admin SDK to access Firestore.
import { initializeApp } from "firebase-admin/app";
import { getFirestore, Timestamp } from "firebase-admin/firestore";
import * as logger from "firebase-functions/logger";
import { currentDate } from "./current_date";


import express = require("express");


// Initialize the app with a service account, granting admin privileges
initializeApp();

// Initialize Cloud Firestore and get a reference to the service
const db = getFirestore();

// date
const date = currentDate();


/// API call to upload water flow data
export const uploadWaterFlowData =
    async (request: express.Request, response: express.Response) => {
        try {
            // get value from the request body
            // as a double value
            const value: number = request.body.value as number;
            // get section name
            const sectionName: string = request.body.sectionName as string;

            // Validation (optional)
            if (!value) {
                response.status(400).send('Missing required fields: value and timestamp');
            }

            uploadWaterData(value, sectionName);

            response.status(200).send('Water flow data uploaded successfully');

        } catch (error) {
            logger.error(error);
            response.status(500).send('Error uploading water flow data');
        }
    };


// upload water functio
export async function uploadWaterData(value: number, sectionName: string): Promise<void> {

    // Prepare data for Firestore
    const waterFlowData = {
        value,
        uploaded_on: Timestamp.now(),
    };

    // get section name
    const waterFlowCollection = `sections/${sectionName}/${date}`;


    // Write data to Firestore
    const upload = await db.collection(waterFlowCollection).add(waterFlowData).then(() => {
        logger.info(
            `Water uploaded: ${value} at ${date} to ${waterFlowCollection}`,
            { structuredData: true });
    });

    return upload;
}