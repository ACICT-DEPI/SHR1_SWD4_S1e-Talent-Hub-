import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talent_hub/features/chat/data/repo/send_message_repo.dart';
import '../../../data/models/message_model.dart';
part 'send_text_state.dart';

class SendTextCubit extends Cubit<SendTextState> {
  SendTextCubit(this.sendMessageRepo) : super(SendTextInitial());
  final SendMessageRepo sendMessageRepo;
  bool? flag;

  Future<void> sendTextMessage(
      {required MessageModel message, required String receivingUserId}) async {
    emit(SendTextLoading());
    flag = await sendMessageRepo.sendTextMessage(
        message: message, receivingUserId: receivingUserId);
    if (flag!) {
      emit(SendTextSuccess());
    } else {
      emit(SendTextFailure(message: "Failed to send message"));
    }
  }
}
