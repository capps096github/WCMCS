// *

// get value from the request body PARAMS
// this is the request POST format
// {
//     value: 20
//     section: "kitchen"
//     email:"test@wcmcs.com"
// }
export interface RequestBody {
    value: number;
    email: string;
    section: string;
}


export interface WaterLevelRequestBody {
    email: string;
    height: number;
}

export interface TestRequestBody {
    value: number;
}
