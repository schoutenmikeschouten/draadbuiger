import processing.io.*;
import processing.serial.*;
import controlP5.*;

String portname = "/dev/ttyACM0"; // linux
//String portname = "COM4"; //windows
String code;
String tekst;
String[] split;
String[] future;
int f;
int a = 0;
int g = 0;
boolean start = false;
boolean done = false;
boolean [] keys = new boolean [128];

void setup() {
  size(400, 500);
  GPIO.pinMode(5, GPIO.OUTPUT);
  GPIO.pinMode(6, GPIO.OUTPUT); 
  GPIO.pinMode(7, GPIO.INPUT); 
  front();
}

void draw() {  

  portfunction();
  if (portfunctioncheck) {
    if (start) {      
      parsen();
      start = false;
      println("Task is done");
    }
  }
}
