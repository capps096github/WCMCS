//
import {getFirestore} from "firebase-admin/firestore";
import * as logger from "firebase-functions/logger";

import express = require("express");
import {Section, sectionConverter} from "../models/section";

// Initialize Cloud Firestore and get a reference to the service
const db = getFirestore();

export const getTapStatus =
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
          const sectionReference =
                    db.collection("sections")
                      .doc(section)
                      .withConverter(sectionConverter);

          // get the controller value from this
          //    section and return it in the response
          const sectionDocSnapshot = await sectionReference.get();

          // check if the document exists
          if (sectionDocSnapshot.exists) {
            const section: Section = sectionDocSnapshot.data() as Section;

            // send a response json to the client
            const responseBody = {
              status: "success",
              controller: section.controller,
              message:
                            `Controller value for section 
                            ${section.label} is ${section.controller}`,
            };

            // log the response
            logger.info(`Response: ${JSON.stringify(responseBody)}`,
              {structuredData: true});

            // send a 200 success response to the client
            response.status(200)
              .send(responseBody);
          } else {
            // send a 404 response to the client
            const responseBody = {
              status: "error",
              message: `Section ${section} not found`,
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
