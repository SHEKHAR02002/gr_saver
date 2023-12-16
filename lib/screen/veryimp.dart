import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gr_saver/Provider/gridview.dart';
import 'package:gr_saver/Provider/mediaquery.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class VeryImportant extends StatefulWidget {
  const VeryImportant({super.key});

  @override
  State<VeryImportant> createState() => _VeryImportantState();
}

class _VeryImportantState extends State<VeryImportant> {
  List<String> itemList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
  ];
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "GR Saver",
          style: GoogleFonts.italianno(
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: .5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.help,
              size: 24,
              color: Colors.blue.shade300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              CupertinoIcons.ellipsis_vertical,
              size: 20,
              color: Colors.blue.shade300,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8)),
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    hintText: "Search",
                    suffixIcon:
                        const Icon(CupertinoIcons.search, color: Colors.blue),
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
                controller: search,
                onFieldSubmitted: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "${AppLocalizations.of(context)!.veryimportat} GR",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  letterSpacing: .5,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                height: SizeConfig.blockSizeVertical! * 70,
                child: GridViewExample(items: itemList))
          ],
        ),
      ),
      floatingActionButton: const Icon(
        Icons.add_circle_rounded,
        color: Colors.blue,
        size: 65,
      ),
    );
  }
}
