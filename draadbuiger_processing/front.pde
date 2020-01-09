ControlP5 cp5;

void front() {
  background(200);

  cp5 = new ControlP5(this);

  cp5.addButton("draaien_L")
    .setPosition(60, 20)
    .setSize(90, 90)
    ;
  cp5.addButton("draaien_R")
    .setPosition(250, 20)
    .setSize(90, 90)
    ;

  cp5.addButton("buigen_L")
    .setPosition(60, 140)
    .setSize(100, 50)
    ;
  cp5.addButton("buigen_R")
    .setPosition(240, 140)
    .setSize(100, 50)
    ;

  cp5.addButton("heen")
    .setPosition(175, 20)
    .setSize(50, 100)
    ;
  cp5.addButton("terug")
    .setPosition(175, 210)
    .setSize(50, 100)
    ;

  cp5.addButton("begin")
    .setPosition(60, 220)
    .setSize(90, 90)
    ;
  cp5.addButton("home")
    .setPosition(250, 220)
    .setSize(90, 90)
    ;
}
public void draaien_L() {
port.write("g91 g1 f1000 x-10 \n");
}
public void draaien_R() {
port.write("g91 g1 f1000 x10 \n");
}
public void buigen_L() {
port.write("g91 g1 f1000 z1 \n");
}
public void buigen_R() {
port.write("g91 g1 f1000 z-1 \n");
}
public void heen() {
  los();
port.write("g91 g1 f2000 y100 \n");
wachten();
vast();
}
public void terug() {
  los();
  port.write("g91 g1 f1000 y-10 \n");
  wachten();
  vast();
}
public void begin() {
start = true;
port.write("?");
}
public void home() {
port.write("g92 x0 y0 z0 \n");
port.write("?");
}
