// http printer
void httprint(int httpResponseCode)
{
  // switch case to print response code
  // if -1, then connection error
  // if 200, then connection success
  // if 404, then endpoint not found
  String message;

  switch (httpResponseCode)
  {
  case -1:
    message = "Connection failed";
    break;
  case 200:
    message = "HTTP Success";
    break;
  case 404:
    message = "HTTP Not found";
    break;
  case 500:
    message = "Error uploading water flow data";
    break;
  default:
    message = "HTTP Error";
    break;
  }

  // print error code and message
  Serial.print("HTTP Response code: ");
  Serial.print(httpResponseCode);
  Serial.print("(");
  Serial.print(message);
  Serial.println(")");
}

// Informational (100-199)
// Successful (200-299)
// Redirection (300-399)
// Client Error (400-499)
// Server Error (500-599)