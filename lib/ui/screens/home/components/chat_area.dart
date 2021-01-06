import 'package:chatter_box/model/message.dart';
import 'package:chatter_box/providers/data_provider.dart';
import 'package:chatter_box/ui/common/loader.dart';
import 'package:chatter_box/utils/constants.dart';
import 'package:chatter_box/utils/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatArea extends StatefulWidget {
  ChatArea({Key key}) : super(key: key);
  final store = FirebaseFirestore.instance.collection('chat_messages');

  @override
  _ChatAreaState createState() => _ChatAreaState();
}

class _ChatAreaState extends State<ChatArea> {
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          message.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          message.sender,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.kAccentShade,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Text(
                          message.sender,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          message.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message..',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              if (_messageController.text.length > 0) {
                await widget.store.add({
                  'user_id':
                      Provider.of<DataProvider>(context, listen: false).userId,
                  'time_stamp': Timestamp.now().millisecondsSinceEpoch,
                  'time': new DateFormat("dd-MM-yyyy hh:mm:ss")
                      .format(DateTime.now()),
                  'message': _messageController.text,
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String prevUserId;

    return Column(
      children: <Widget>[
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Chatter box welcomes you ! \n Please follow community guidelines",
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: widget.store.orderBy('time_stamp').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.docs.isEmpty) {
                  return Center(child: Text('No messages to display'));
                }
                return ListView.builder(
                  reverse: false,
                  padding: EdgeInsets.all(20),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = snapshot.data.docs[index].data();
                    final bool isMe = data['user_id'] ==
                        Provider.of<DataProvider>(context, listen: false)
                            .userId;
                    final bool isSameUser = prevUserId == data['user_id'];
                    prevUserId = data['user_id'];
                    final Message message = Message(
                        sender: data['user_id'],
                        text: data['message'],
                        time: data['time']);
                    return _chatBubble(message, isMe, isSameUser);
                  },
                );
              }

              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              return Center(
                child: Loader(
                  color1: AppColors.kPrimaryColor,
                  color2: AppColors.kAccentShade,
                  color3: AppColors.kPrimaryColor,
                ),
              );
            },
          ),
        ),
        _sendMessageArea(),
      ],
    );
  }
}
