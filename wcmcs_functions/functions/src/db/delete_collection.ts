//
import {getFirestore} from "firebase-admin/firestore";
import * as logger from "firebase-functions/logger";

import express = require("express");

// Initialize Cloud Firestore and get a reference to the service
const db = getFirestore();

export const deleteSection =
  async (request: express.Request, response: express.Response) => {
    try {
      // * request means the request object
      // that is provided by the express server
      // * when a user makes a request to the endpoint
      // first get the payload from the request body

      // get the section name from the query parameter
      const section: string = request.query.section as string;

      // check if the section is not empty
      if (!section) {
        response.status(400).send("Missing required field: section");
      } else {
        // Create a reference to the collection
        const sectionReference = db.collection("sections").doc(section);

        /*
                // get all the subcollections of the section
                const collections = await sectionReference.listCollections();

                // https://cloud.google.com/nodejs/docs/reference/firestore/latest/firestore/firestore#_google_cloud_firestore_Firestore_recursiveDelete_member_1_
                     // loop through the subcollections and delete them
                collections.forEach((collection) => {
                  console.log("Found subcollection with id:", collection.id);
                  collection.doc().delete();
                });

                // * delete the section
                sectionReference.delete().then(() => {
                  response.status(200).send("Section deleted successfully");
                });
         */

        // Recursively delete a reference and log the references of failures.
        const MAX_RETRY_ATTEMPTS = 5; // Replace 3 with the desired value

        const bulkWriter = db.bulkWriter();
        bulkWriter
          .onWriteError((error) => {
            if (
              error.failedAttempts < MAX_RETRY_ATTEMPTS
            ) {
              return true;
            } else {
              console.log("Failed write at document: ", error.documentRef.path);
              return false;
            }
          });

        // Recursively delete the document
        await db.recursiveDelete(sectionReference, bulkWriter).then(() => {
          response.status(200).send(`Section ${section} deleted successfully`);
        });
      }
    } catch (error) {
      logger.error(error);
      response.status(500).send("Error deleting collection: " + error);
    }
  };
