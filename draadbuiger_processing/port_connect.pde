import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;
import processing.serial.*;

//buttonfunctions
boolean portfunctionbutton = false;
boolean portfunctioncheck = false;

Serial port = null;

boolean streaming = false;
String[] gcode;
int i = 0;
String s;
String str1;

void openSerialPort() {
  if (portname == null) return;
  println(portname);
  if (port != null) port.stop();
  port = new Serial(this, portname, 115200);  
  port.bufferUntil('\n');
}

void serialEvent(Serial p) {
  s = p.readString();
  //println("grbl; " + s);
  String[] list = splitTokens(s, "<,>");
  str1 = list[0];
  String str2 = "Idle";
  if (str1.equals(str2) == true)
  {
    println("things are idle");  
    done = true;
  }
}

void portfunction() {
  if (!portfunctioncheck) {
    openSerialPort();
    println("opening serialport");
    for (a= 0; a < 1; a++) {
      if (!done) {
        port.write("?");
        delay(50);
        a--;
      }

      if (done) {
        portfunctioncheck = true;
      }
    }
  }
}

void wachten() {
  println("wachten"); 
  done = false;
  for (a= 0; a < 1; a++) {

    if (!done) {   
      //println("not idle");
      delay(50);
      port.write("?");
      a--;
    } else {
      delay(50);
      println("done \n");
      done = true;
    }
  }
}
