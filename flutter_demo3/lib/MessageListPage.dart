import 'package:flutter/material.dart';
import 'package:flutter_demo3/AddMessagePage.dart';

class MessageList extends StatefulWidget {
  // 先忽略这里的参数 key，后面我们就会看到他的作用了
  MessageList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageListWidget();
  }
}

class Message {
  final String content;
  final String timestamp;

  Message(this.content, this.timestamp);
}

class MessageListWidget extends State<MessageList> {
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MessageBindListView(messages);
  }

  @override
  void initState() {
    super.initState();
  }

  void addMessage(Message msg) {
    setState(() {
      messages.add(msg);
    });
  }
}

class ItemView extends StatelessWidget {
  final Message message;

  ItemView(this.message);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[Text(message.content), Text(message.timestamp)],
    );
  }
}

class MessageBindListView extends StatelessWidget {
  final List<Message> messages;

  MessageBindListView(this.messages);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ItemView(messages[index]);
        });
  }
}

class MessageListPage extends StatelessWidget {
  final messageListKey =
      GlobalKey<MessageListWidget>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Message List Page"),
        ),
        body: MessageList(key: messageListKey),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // push 一个新的 route 到 Navigator 管理的栈中，以此来打开一个页面
            final result = await Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddMessageScreen()));
            if (result is Message) {
              debugPrint("result=${result.content} ${result.timestamp}");
              messageListKey.currentState.addMessage(result);
            }
          },
          tooltip: 'Add message',
          child: Icon(Icons.add),
        ));
  }
}
