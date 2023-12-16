import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gr_saver/Provider/firbasefunction.dart';

class UploadPopup extends StatefulWidget {
  final String type;
  const UploadPopup({super.key, required this.type});

  @override
  State<UploadPopup> createState() => _UploadPopupState();
}

class _UploadPopupState extends State<UploadPopup> {
  PlatformFile? pickedFile;
  TextEditingController grname = TextEditingController();

  selctfile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Upload GR",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const SizedBox(height: 28),
              TextField(
                decoration: const InputDecoration(
                    counterText: "",
                    hintText: "Name of GR",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF010101)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF010101))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF010101)))),
                controller: grname,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: selctfile,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    pickedFile != null ? pickedFile!.name : "Select Image",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF010101)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (pickedFile!.path != null && grname.text.isNotEmpty) {
                    uploaddocment(
                            type: widget.type,
                            grname: grname.text,
                            pathb: pickedFile!.path)
                        .whenComplete(() {
                      Navigator.pop(context);
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    backgroundColor: Colors.blue),
                child: const Text(
                  "Upload GR",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
