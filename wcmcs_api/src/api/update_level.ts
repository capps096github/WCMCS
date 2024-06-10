
import axios from "axios";
import { WaterLevelRequestBody } from "../models/request_body";
import express = require("express");

const apiEndpoint = "https://waterapi-i6mmg3netq-uc.a.run.app/update_level";


/// API call to upload water flow data
export const updateTankWaterLevel =
    async (request: express.Request, response: express.Response) => {
        try {
            // first get the payload from the request body
            const body = request.body;

            // request body as json
            const requestBody: WaterLevelRequestBody = JSON.parse(JSON.stringify(body));

            // log the request body
            console.info(`Request body: ${JSON.stringify(requestBody)}`);

            // Validation (optional)
            if (!body) {
                response.status(400)
                    .send("Missing required fields: value and timestamp");
            } else {

                updateWaterLevel(requestBody, response);
            }
        } catch (error) {
            console.error(error);
            response.status(500).send("Error uploading water flow data");
        }
    };


/**
 *  upload water
 * called to verify the transaction and upload it to cloud
 * @param {WaterLevelRequestBody} request - the value
 * @param {express.Response} response - the express response
 */
export async function
    updateWaterLevel(request: WaterLevelRequestBody, response: express.Response) {

    // get the payload from the request body
    const payload = request;
    const payloadJson = JSON.stringify(payload);

    // log the request body
    console.info(`API Request Payload: ${payloadJson}`,
        { structuredData: true });


    // check if we have the body and headers
    if (!payload) {
        response.status(400).end("Invalid request body");
    } else {
        // log that we are making an API call
        console.log(`Making API request for Payload: ${payloadJson}`,
            { structuredData: true });


        //* make an API call with a post request to the endpoint
        await axios.post(apiEndpoint, payloadJson, {
            headers: {
                "content-type": "application/json",
                "Access-Control-Allow-Origin": "*",
            },
        })
            .then(async function (axResponse) {
                // response Json
                const responseBody = axResponse.data;

                // log the response
                console.log(responseBody);

                // handle success
                if (responseBody.status === "success") {
                    // log that the water Level Update was successful
                    console.info("Success! Water Level Update initiated");

                    // send back a json as response to this endpoint
                    response.status(200).send(responseBody);
                } else {
                    // Inform the customer their payment was unsuccessful
                    // and then log the error
                    console.info(
                        `Water Level Update Fail: ${responseBody}`,
                        { structuredData: true });

                    response.status(400)
                        .end(`Water Level Update failed: ${responseBody.message}`);
                }
            })
            .catch(function (error) {
                if (error.isAxiosError && error.response.status === 401) {
                    console.error(`Unauthorized request: ${error}`);
                    response.status(401).send({ error: "Invalid API Call" });
                    // More specific error message
                } else {
                    console.error(`Error Initiating Uploading: ${error}`);
                    response.status(500).send({ error: "Upload failed" });
                }
            });
    }
};

