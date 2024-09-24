import 'dart:io';
import '../../../features/chat/data/models/message_model.dart';
import '../../helpers/upload_file_to_firebase_storage.dart';
import '../../models/user_model.dart';

Future<String> sendFileMessage(
    {required MessageModel message,
    required File file,
    required UserModel receivingUser}) async {
  final fileUrl = await uploadFileToFirebaseStorage(
    path:
        'chats/${message.messageType.type}/${message.senderId}/${message.receiverId} /${message.textMessageId}/${file.path.split('/').last}',
    file: file,
  );
  return fileUrl;
}
