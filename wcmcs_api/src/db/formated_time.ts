import { Timestamp } from "firebase-admin/firestore";

// a function to get todays date and format it as
// todays date in format dd-mm-yyyy eg. 27-05-2024
// String todaysDate = "27-06-2024";
export function currentDate(): string {
    const timestamp = Timestamp.now();
    const date = timestamp.toDate();

    // get the day, month and year
    const day = date.getDate();
    const month = date.getMonth() + 1;
    const year = date.getFullYear();

    // format the date
    const todaysDate = `${day}-${month}-${year}`;
    // return the formatted date
    return todaysDate;
};
