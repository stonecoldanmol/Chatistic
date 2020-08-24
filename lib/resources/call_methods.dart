import 'package:chatistic/constants/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CallMethods
{
  final CollectionReference callCollection = Firestore.instance.collection(CALL_COLLECTION);

  Stream<DocumentSnapshot> callStream({String uid}) => callCollection.document(uid).snapshots();
}