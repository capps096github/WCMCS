
import axios from "axios";

// this one checks the controller value (int) of a given section
//  and then returns it in the response as a json
// {"controller": value}

import express = require("express");
import { ResponseBody } from "../models/response_body";

const tapStatusEndpoint = "https://waterapi-i6mmg3netq-uc.a.run.app/tap_status";

/**
 *  upload water
 * called to verify the transaction and upload it to cloud
 * @param {express.Request} request - the value
 * @param {express.Response} response - the express response
 */
export async function
    getTapStatus(request: express.Request, response: express.Response) {

    try {
        // get the section name from the query parameter
        const section: string = request.query.section as string;

        // check if the section is not empty
        if (!section) {
            response.status(400).send("Missing required field: section");
        } else {

            // make an API call
            await axios.get(tapStatusEndpoint, {
                params: {
                    section: section,
                },
                headers: {
                    "content-type": "application/json",
                    "Access-Control-Allow-Origin": "*",
                },
            }).then(async function (axResponse) {
                // response Json
                const data = axResponse.data;


                // request body as json
                const responseBody: ResponseBody = JSON.parse(JSON.stringify(data));

                // log the request body
                console.info(`Response body: ${JSON.stringify(responseBody)}`);


                // log the response
                console.log(responseBody);

                // handle success
                if (responseBody.status === "success") {
                    // get controller value
                    const controllerValue = responseBody.controller;

                    // log that the request was successful
                    console.info(`Success! Tap Status: ${controllerValue}`);

                    // send back a json as response to this endpoint
                    response.status(200).send(`${controllerValue}`);
                } else {
                    // Inform the customer their payment was unsuccessful
                    // and then log the error
                    console.log(
                        `Request Fail: ${responseBody}`,
                        { structuredData: true });

                    response.status(400)
                        .end(`Request failed: ${responseBody.message}`);
                }
            })
                .catch(function (error) {
                    console.error(`Error Getting  (${section}) Tap status: ${error}`);
                    response.status(500).send("Internal server error");
                });
        }
    } catch (error) {
        console.error(error);
        response.status(500).send(`Error Getting Section Tap status`);
    }

}