//

import {getAuth} from "firebase-admin/auth";

/**
 *  Get user id
 * called to verify the transaction and upload it to cloud
 * @param {String} email - the email
 */
export async function
getUserId( email:string): Promise<string> {
  // get user from email
  const user = await getAuth().getUserByEmail(email);

  // get user ID from Email
  const userId = user.uid;

  // return user ID
  return userId;
}
