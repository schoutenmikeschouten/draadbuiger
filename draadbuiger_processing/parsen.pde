void parsen() {
  String[] gcode = loadStrings("draadbuiger.txt");


  for (int i=0; i < gcode.length; i++) {

    split = splitTokens(gcode[i]);
    
    if (split[0].equals("S") == true) {
      println("START GCODE");
      start();
    }

    if (split[0].equals("V") == true) {
      println("VOEREN");
      voeren();
    }

    if (split[0].equals("B") == true) {
      println("BUIGEN");
      buigen();
    }

    if (split[0].equals("D") == true) {
      println("DRAAIEN");
      draaien();
    }
  }
}
