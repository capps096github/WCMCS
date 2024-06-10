
import { RequestBody } from "../models/request_body";

import express = require("express");
import { uploadWaterData } from "./uploader";

/// API call to upload water flow data
export const uploadWaterFlowData =
  async (request: express.Request, response: express.Response) => {
    try {
      // first get the payload from the request body
      const body = request.body;

      // request body as json
      const requestBody: RequestBody = JSON.parse(JSON.stringify(body));

      // log the request body
      console.info(`Flow Request body: ${JSON.stringify(requestBody)}`);

      // Validation (optional)
      if (!body) {
        response.status(400)
          .send("Missing required fields: value and timestamp");
      } else {

        uploadWaterData(requestBody, response);
      }
    } catch (error) {
      console.error(error);
      response.status(500).send("Error uploading water flow data");
    }
  };
