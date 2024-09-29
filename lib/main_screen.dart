import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jarvis_assistent/Models/message_model.dart';
import 'package:jarvis_assistent/Themes/themes.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final _textInputController = TextEditingController();
  final _scrollController = ScrollController();
  final _messages = <MessageModel>[];

  void scrollDown() {
    Future.delayed(const Duration(milliseconds: 200), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: Text(
          'Jarvis Assistent',
          style:
              TextStyle(color: AppTheme.textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Container(
            padding: const EdgeInsets.all(10),
            color: AppTheme.primaryColor,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _messages.length,
                        itemBuilder: (_, int index) {
                          return Row(
                            children: [
                              if (_messages[index].messageFrom ==
                                  MessageFrom.USER)
                                const Spacer(),
                              Container(
                                  margin: const EdgeInsets.all(12),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: AppTheme.secondaryColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    _messages[index].message,
                                    style: TextStyle(
                                        color: AppTheme.textColor,
                                        fontSize: 20),
                                  )),
                            ],
                          );
                        })),
                TextField(
                  style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.textColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                  maxLines: 4,
                  minLines: 1,
                  controller: _textInputController,
                  decoration: InputDecoration(
                      hintText: 'Digite sua pergunta',
                      hintStyle: TextStyle(color: AppTheme.textColor),
                      enabledBorder: AppTheme.outlineInputBorder,
                      fillColor: AppTheme.appBarColor,
                      focusedBorder: AppTheme.outlineInputBorder,
                      filled: true,
                      suffixIcon: IconButton(
                          onPressed: () async {
                            if (_textInputController.text.isNotEmpty) {
                              final prompt = _textInputController.text;

                              setState(() {
                                _messages.add(MessageModel(
                                    message: prompt,
                                    messageFrom: MessageFrom.USER));

                                _textInputController.text = "";
                                scrollDown();
                              });

                              setState(() {
                                _messages.add(MessageModel(
                                    message: 'Resposta padrao',
                                    messageFrom: MessageFrom.IA));
                                scrollDown();
                              });
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: AppTheme.textColor,
                          ))),
                ),
              ],
            )),
      ),
    );
  }
}
