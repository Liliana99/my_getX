// Example 1 folding cell inside [Container]
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../controllers.dart/main_controller.dart';

class FoldingCell extends GetView<MainController> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SimpleFoldingCell.create(
            frontWidget: _buildFrontWidget(index),
            innerWidget: _buildInnerWidget(index),
            cellSize: Size(Get.width, 125),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 10,
            onOpen: () => print('$index cell opened'),
            onClose: () => print('$index cell closed'),
          );
        },
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: Color(0xFFffcd3c),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "GETX ",
                        style: GoogleFonts.satisfy(
                          color: Color(0xFF2e282a),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      controller.buildSubTitle(index),
                      style: GoogleFonts.manrope(
                        color: Colors.red,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: TextButton(
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
                  child: Text(
                    "OPEN",
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(80, 40),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildInnerWidget(int index) {
    MainController mainController = Get.find();

    return Builder(
      builder: (context) {
        return Container(
          color: Colors.purple[200],
          padding: EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  controller.buildTitleDetail(index),
                  style: GoogleFonts.aldrich(
                    color: Color(0xFF2e282a),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    controller.pressSelected(index);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mainController.buildTextDetail(index),
                        style: GoogleFonts.aldrich(
                          color: Color(0xFF2e282a),
                          fontSize: 32.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: TextButton(
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
                  child: Text(
                    "Close",
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(80, 40),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
