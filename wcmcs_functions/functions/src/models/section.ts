//

import {Timestamp, WithFieldValue, FirestoreDataConverter}
  from "firebase-admin/firestore";

export interface Section {
    label: string;
    controller: number;
    userId: string;
    uploaded_on: Timestamp;
}


// / converter for the section to and from firestore
const sectionConverter:
    FirestoreDataConverter<Section> = {
      toFirestore(section: WithFieldValue<Section>):
        FirebaseFirestore.DocumentData {
        return {
          label: section.label,
          controller: section.controller,
          userId: section.userId,
          uploaded_on: section.uploaded_on,
        };
      },
      fromFirestore(
        snapshot: FirebaseFirestore.QueryDocumentSnapshot
      ): Section {
        const data = snapshot.data() as Section | undefined;
        if (!data) {
          throw new Error("Unable to convert document data to Section");
        }
        return data;
      },
    };

export {sectionConverter};
