import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gr_saver/Provider/mediaquery.dart';
import 'package:gr_saver/controller/controller.dart';
import 'package:gr_saver/screen/lowimp.dart';
import 'package:gr_saver/screen/midimp.dart';
import 'package:gr_saver/screen/veryimp.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

enum Language { english, marathi }

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
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
          Consumer<LanguageChangeController>(
            builder: (context, provider, child) {
              return PopupMenuButton(
                  icon: Icon(
                    CupertinoIcons.ellipsis_vertical,
                    size: 24,
                    color: Colors.blue.shade300,
                  ),
                  onSelected: (Language item) {
                    if (Language.english.name == item.name) {
                      print('English');
                      provider.changeLanguage(const Locale('en'));
                      // .whenComplete(() => setState(() {}));
                    } else {
                      print('Marathi');
                      provider.changeLanguage(const Locale('mr'));
                      // .whenComplete(() => setState(() {}));
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Language>>[
                        const PopupMenuItem(
                            value: Language.english, child: Text('English')),
                        const PopupMenuItem(
                            value: Language.marathi, child: Text('Marathi'))
                      ]);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                        child: const VeryImportant())),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: SizeConfig.blockSizeVertical! * 20,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/background1.jpg')),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent.shade100),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.doc_checkmark,
                          size: SizeConfig.blockSizeVertical! * 8,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${AppLocalizations.of(context)!.veryimportat} GR",
                          // "",
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
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            size: 30,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                        child: const Important())),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: SizeConfig.blockSizeVertical! * 20,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/background2.jpg')),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent.shade100),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.doc_append,
                          size: SizeConfig.blockSizeVertical! * 8,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${AppLocalizations.of(context)!.important} GR",
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
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            size: 30,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                        child: const LowImportant())),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: SizeConfig.blockSizeVertical! * 20,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/background3.jpg')),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent.shade100),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.doc_fill,
                          size: SizeConfig.blockSizeVertical! * 8,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${AppLocalizations.of(context)!.lowimportat} GR",
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
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            size: 30,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
