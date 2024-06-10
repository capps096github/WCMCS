

// ..addAll({'radius': radius})
// ..addAll({'height': height})
// ..addAll({'type': tankType})
// ..addAll({'length': length})
// ..addAll({'width': width})
// ..addAll({'heightOfWaterFlown': heightOfWaterFlown})
// ..addAll({'userId': userId});

import { FirestoreDataConverter, WithFieldValue } from "firebase-admin/firestore";

export interface Tank {
    radius: number;
    height: number;
    type: string;
    length: number;
    width: number;
    heightOfWaterFlown: number;
    userId: string;
}

// tank convertor
export const tankConverter: FirestoreDataConverter<Tank> = {
    toFirestore(tank: WithFieldValue<Tank>): FirebaseFirestore.DocumentData {
        return {
            radius: tank.radius,
            height: tank.height,
            type: tank.type,
            length: tank.length,
            width: tank.width,
            heightOfWaterFlown: tank.heightOfWaterFlown,
            userId: tank.userId
        };
    },
    fromFirestore(snapshot: FirebaseFirestore.QueryDocumentSnapshot): Tank {
        const data = snapshot.data() as Tank | undefined;
        if (!data) {
            throw new Error("Unable to convert document data to Tank");
        }
        return data;
    },
};
