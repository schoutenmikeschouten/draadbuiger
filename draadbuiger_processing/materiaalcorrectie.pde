void materiaalcorrectie(){
  int r = 9;
  float manueel = 0.5;
  input = (round(float(split[1])*100))/100;
  float terugvoeren = -(round((((r/(tan(radians((180-input)/2))))-(atan((r/(tan(radians((180-input)/2))))/r)*(r+manueel)))*2)*100))/100;
  los();
  String gcodecommand = "g91 g21 g1 f"+ fvoeren + " y"+ terugvoeren +"\n";
  println(gcodecommand);
  port.write(gcodecommand);
  wachten();
  vast();
}


//int radius = 9;
//int buighoek = 90;
//int zoom = 8;



//void setup(){
// size(600,600);
//}

//void draw(){
  
   


//float rad = radians((180-buighoek)/2);
  
//    noFill();
//  ellipse((150+(radius*zoom)), 200, (radius*zoom*2),(radius*zoom*2));
  
//  line(150,200,(150+(radius*zoom)),200);
  
  
//  line(150,200,150,200-((radius/(tan(rad)))*zoom));
  
//  println("aanliggende zijde:");
//  println(radius/(tan(rad)));
//  float a = radius/(tan(rad));
  
//  println(degrees(atan(a/radius)));
//  println(atan(a/radius));
//  println(atan(a/radius)*(radius-1));
//  float b = atan(a/radius)*(radius-1);
  
//  println((a-b)*2);
//  println(((radius/(tan(radians((180-buighoek)/2))))-(atan((radius/(tan(radians((180-buighoek)/2))))/radius)*(radius-1)))*2);
//}
