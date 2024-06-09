import '../../../app_exporter.dart';
import '../data/water_db_refence.dart';

/// A service for interacting with the Calcut Cloud Database
class SectionService {
  /// ? ---- Sections Database Service ----
  ///This function uploads the user to cloud under the []
  static Future<String> uploadSection(Section section) async {
    // message
    var message = '';
    await sectionDatabaseRef
        .doc(section.collection)
        .get()
        .then((cloudSection) async {
      if (cloudSection.exists) {
        //user exists then just return
        message = 'Section already exists, Try another name';
      } else {
        await sectionDatabaseRef
            .doc(section.collection)
            .set(
              section,
              SetOptions(merge: true),
            )
            .then((_) => printer('Section uploaded successfully'));

        message = 'Section uploaded successfully';
      }
    });

    return message;
  }

  /// update the controller value of a section
  /// this updates the controller value of a section
  /// to open or close the section
  /// 1 for open and 0 for closed
  static Future<void> updateControllerValue({
    required Section section,
    required int newValue,
  }) async {
    // if section is open, close it
    // if section is closed, open it
    // final controller = section.isOpen ? 0 : 1;

    // print the controller value
    printer('Controller Value: $newValue');

    await sectionDatabaseRef.doc(section.collection).update({
      'controller': newValue,
    }).then(
      (_) => printer('Section controller updated successfully'),
    );
  }

  /// delete a scetion
  static Future<void> deleteSection(Section section) async {
    // make an api call to delete the section
    const deleteEndPoint = 'https://waterapi-i6mmg3netq-uc.a.run.app/delete';

    /// Create an instance of Dio
    final dio = Dio();

    // Define the an empty response of type PayResponse
    var response = Response<dynamic>(
      requestOptions: RequestOptions(path: deleteEndPoint),
    );

    try {
      printer('Calling API');
      // Make the POST request
      response = await dio.get(
        deleteEndPoint,
        queryParameters: {
          'section': section.collection,
        },
      );

      printer('Response: ${response.data}');

      /// when all is set, return a response
      // check if the response is a success
      if (response.statusCode == 200) {
        // get the response data
        final responseData = response.data as Map<String, dynamic>;

        printer('Response: $responseData');

        // return a PayResponse
        // return VerifiedResponse.fromMap(
        //   responseData,
        // );
      } else {
        // return an error response
        printer('Error Response: $response');

        // return VerifiedResponse.error(response.toString());
      }
    } on DioException catch (e) {
      // response
      final resp = e.response;

      // print the response
      printer('Error $e Response: $resp');
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (resp != null) {
        printer(resp.data);
        printer(resp.headers);
        printer(resp.requestOptions);
        printer(resp.statusCode);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        printer(e.requestOptions);
        printer(e.message);
      }
      // return an error response
      printer('Error Occured: ${e.message}');

      // return VerifiedResponse.error(e.message);
    }
  }
}
