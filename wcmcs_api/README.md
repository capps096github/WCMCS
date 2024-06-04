# In package.json

We set `main` to be `build/index.js` so that when we publish the package, it will be the entry point for the package. This is the file that will be executed when the package is imported.

Scripts under `scripts` are used to run commands. For example, `start` is used to run the server, `build` is used to build the project, and `test` is used to run tests. We can run these scripts using `npm run <script-name>`. For example, to run the server, we can use `npm run start`.

Sample Docs can be found on:

- [https://mahmoud-kassem.medium.com/how-to-build-an-api-with-node-js-express-and-typescript-2024-extended-part-1-6-f65df183dbc5](https://mahmoud-kassem.medium.com/how-to-build-an-api-with-node-js-express-and-typescript-2024-extended-part-1-6-f65df183dbc5)

Install body parser for requests

    ```bash 
    npm install body-parser
    ```

## To run the server

    ```bash
    npm run start
    ```
