import 'package:TodoList/assets/colors/colors.dart';
import 'package:TodoList/assets/fonts/fonts.dart';
import 'package:TodoList/pages/main_structure_page.dart';
import 'package:TodoList/services/todolist_services.dart';
import 'package:TodoList/widgets/customcontainer.dart';
import 'package:TodoList/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final int index;
  DetailPage(this.index);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainStructure(
      Column(
        children: [
          HeaderWidget(true, FaIcon(FontAwesomeIcons.chevronLeft)),
          CustomContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 100,
                ),
                Text(
                  Get.find<TodoListService>()
                      .todolistContent[widget.index]
                      .title
                      .toUpperCase(),
                  style: titleFont(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 100,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'STATUS:',
                style: titleFont(),
                textAlign: TextAlign.center,
              ),
              Text(
                'UNAVAILABLE!',
                style: titleFont(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Get.find<TodoListService>().isEditing
              ? CustomContainer(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * .40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NOTES',
                        style: titleFont(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        controller: controller,
                        maxLines: 12,
                        decoration: InputDecoration(
                          hintText: Get.find<TodoListService>()
                              .todolistContent[widget.index]
                              .description,
                          labelStyle: bodyFont(fontSize: 16),
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            Get.find<TodoListService>()
                                .todolistContent[widget.index]
                                .date,
                            style: titleFont(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FaIcon(
                            FontAwesomeIcons.solidClock,
                            color: alarmColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : CustomContainer(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * .40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NOTES',
                        style: titleFont(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        Get.find<TodoListService>()
                            .todolistContent[widget.index]
                            .description
                            .toUpperCase(),
                        style: bodyFont(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            Get.find<TodoListService>()
                                .todolistContent[widget.index]
                                .date,
                            style: titleFont(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FaIcon(
                            FontAwesomeIcons.solidClock,
                            color: alarmColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () async {
                  controller.text.isEmpty
                      ? print('No value')
                      : await Get.find<TodoListService>().updateData(
                          Get.find<TodoListService>()
                              .todolistContent[widget.index]
                              .id,
                          controller.text);
                  Get.find<TodoListService>().isEditing = false;
                  setState(() {});
                },
                child: Text(
                  'Save',
                  style: titleFont(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: greenColor),
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    Get.find<TodoListService>().isEditing = true;
                  });
                },
                child: Text(
                  'Edit',
                  style: titleFont(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: skyColor,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  await Get.find<TodoListService>().deleteData(
                      '${Get.find<TodoListService>().todolistContent[widget.index].id}');

                  Get.back();
                  setState(() {});
                },
                child: Text(
                  'Delete',
                  style: titleFont(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: redColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'LEGENDS',
                    style: titleFont(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.checkDouble,
                    color: greenColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'COMPLETE',
                    style: titleFont(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.exclamationCircle,
                    color: redColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'MISSING',
                    style: titleFont(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.spinner,
                    color: skyColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'IN PROGRESS',
                    style: titleFont(fontSize: 16),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
