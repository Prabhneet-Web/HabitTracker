import 'package:flutter/material.dart';
import 'package:habit_tracker/util/colors.dart';
import 'package:intl/intl.dart';

class NewTasks extends StatefulWidget {
  const NewTasks({
    Key? key,
    required this.addTk,
  }) : super(key: key);

  final Function addTk;

  @override
  State<NewTasks> createState() => _NewTasksState();
}

class _NewTasksState extends State<NewTasks> {
  final TextEditingController _titleController = TextEditingController();
  DateTime selectedDate = DateTime(00, 00, 0000);

  void _submitData() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || selectedDate == DateTime(00, 00, 0000)) return;
    widget.addTk(enteredTitle, selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 6)))
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        selectedDate = pickedDate;
      });
    }); //Then allows us to provide a function which is executed once the future resolves to a value
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(25),
    );
    return SingleChildScrollView(
      child: Card(
        color: mobileBackgroundColor,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  10), // This adds the padding to the bottom when the keyboard is opened
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  onSubmitted: (_) => _submitData(),
                  controller: _titleController,
                  decoration: InputDecoration(
                      hintText: "Enter the title",
                      labelText: "Title",
                      labelStyle: TextStyle(color: Colors.grey.shade400),
                      enabledBorder: inputBorder,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: iconColor),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20)),
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedDate == DateTime(00, 00, 000)
                          ? "No Date Chosen!"
                          : "Picked Date:- ${DateFormat.yMd().format(selectedDate)}"),
                      const SizedBox(width: 10),
                      TextButton(
                        child: const Text(
                          "Choose Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: primaryColor),
                        ),
                        onPressed: _presentDatePicker,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, right: 14),
                child: MaterialButton(
                  onPressed: _submitData,
                  color: iconColor,
                  child: const Text("Add Task"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
