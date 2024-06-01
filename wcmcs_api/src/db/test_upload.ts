import express = require("express");

const url = `http://localhost:3000/water-flow`; // Replace with your server URL

// Function to upload water flow data
export async function uploadWaterData(value: number, res: express.Response) {
  const data = { value };

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    });

    if (response.ok) {

      console.log('Water flow data uploaded successfully');
      res.send('Water flow data uploaded successfully');
    } else {
      res.send({ Error: `Error uploading water flow data:', ${await response.text()}` });
    }
  } catch (error) {
    res.send(`Error: $error`);
  }
}
