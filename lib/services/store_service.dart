import 'package:app_auth_firebase/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class StoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String message, String senderId, String senderEmail) async {

    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: senderId,
      senderEmail: senderEmail,
      message: message,
      timestamp: timestamp,
    );

    await _firebaseFirestore.collection("messages").add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages() {
    return _firebaseFirestore
        .collection("messages")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}