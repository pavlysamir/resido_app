import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/utils/widgets/custom_form_field.dart';
import 'package:resido_app/features/chat/presentation/managers/cubit/chat_cubit.dart';
import 'package:resido_app/features/chat/presentation/widgets/chat_send_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<MessageModel> messages= [];
    final controller = ScrollController();
    var messageController = TextEditingController();

    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // if (state is SendContactUsSuccess) {
        //   SettingsCubit.get(context).getContactUsMessage();
        // }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "chat",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            body:
                // state is GetContactUsSuccess || state is SendContactUsSuccess
                //     ?
                Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    itemCount: 5,
                    // SettingsCubit.get(context).messages.length,
                    itemBuilder: (context, index) {
                      return const ChatSendBubble(
                        message: 'Heloo',
                        // SettingsCubit.get(context)
                        //     .messages[index]
                        //     .message,
                      );
                      // if (SettingsCubit.get(context)
                      //         .messages[index]
                      //         .replyMessage ==
                      //     null) {
                      //   return ChatSendBubble(
                      //     message: SettingsCubit.get(context)
                      //         .messages[index]
                      //         .message,
                      //   );
                      // } else {
                      //   return ChatReceiveBubble(
                      //     message: SettingsCubit.get(context)
                      //         .messages[index]
                      //         .replyMessage!,
                      //   );
                      // }
                    },
                    shrinkWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomFormField(
                      controller: messageController,
                      validationMassage: (value) {},
                      hintText: 'send',
                      suffixIcon: IconButton(
                          onPressed: () async {
                            // await SettingsCubit.get(context)
                            //     .sendContactUsMessage(
                            //         message: messageController.text,
                            //         email: getIt
                            //             .get<CashHelperSharedPreferences>()
                            //             .getData(key: ApiKey.email));
                            messageController.clear();
                          },
                          icon: const Icon(Icons.send)),
                      textInputType: TextInputType.name),
                ),
              ],
            )
            // : const Center(
            //     child: CircularProgressIndicator(
            //     color: kPrimaryKey,
            //   )),
            );
      },
    );
  }
}
