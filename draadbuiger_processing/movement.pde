float input = 0;
int fvoeren = 20000;
int fbuigen = 3000;

void start() {  
  laag();
  vast();
}

void voeren() {

  input = (round(float(split[1])*100))/100;
  println(input);
  los();
  String gcodecommand = "g91 g21 g1 f"+ fvoeren + " y"+ input +"\n";
  println(gcodecommand);
  port.write(gcodecommand);
  wachten();
  vast();
}



void buigen() {
  int zijwaards = -45;
  int lossen = -30;

  materiaalcorrectie();
  buigcorrectie();  

  println("simpel buigen");
  if (input < 0) {
    println("input is negatief");
    zijwaards = zijwaards * -1;
    lossen = lossen * -1;
  }
  println("g90 g21 g1 f"+ fbuigen + " z" + zijwaards + "\n");
  port.write("g90 g21 g1 f"+ fbuigen + " z" + zijwaards + "\n");
  wachten();

  hoog();

  float temp = input;
  println("g90 g21 g1 f"+ fbuigen + " z" + temp + "\n");
  port.write("g90 g21 g1 f"+ fbuigen + " z" + temp + "\n");
  wachten();

if(input>25){
  println("g90 g21 g1 f"+ fbuigen + " z0 \n");
  port.write("g90 g21 g1 f"+ fbuigen + " z0 \n");
  wachten();

  laag();
}
else{
  float temp2 = input +lossen;
  println("g90 g21 g1 f"+ fbuigen + " z " + temp2 + "\n");
  port.write("g90 g21 g1 f"+ fbuigen + " z " + temp2 + "\n");
  wachten();
  
  laag();
  
  println("g90 g21 g1 f"+ fbuigen + " z0 \n");
  port.write("g90 g21 g1 f"+ fbuigen + " z0 \n");
  wachten();
}
}




void draaien() {
  int fdraaien = 4000;
  input = (round(float(split[1])*100))/100;
  println(input);

  String gcodecommand = "g91 g21 g1 f"+ fdraaien + " x"+ input +"\n";
  println(gcodecommand);
  port.write(gcodecommand);
  wachten();
}
