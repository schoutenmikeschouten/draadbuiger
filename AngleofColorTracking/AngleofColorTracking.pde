/**
 * MultipleColorTracking
 * Select 4 colors to track them separately
 *
 * It uses the OpenCV for Processing library by Greg Borenstein
 * https://github.com/atduskgreg/opencv-processing
 *
 * @author: Jordi Tost (@jorditost)
 * @url: https://github.com/jorditost/ImageFiltering/tree/master/MultipleColorTracking
 *
 * University of Applied Sciences Potsdam, 2014
 *
 * Instructions:
 * Press one numerical key [1-4] and click on one color to track it
 */

import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencv;
PImage src;
ArrayList<Contour> contours;
ArrayList<Line> lines;

// <1> Set the range of Hue values for our filter
//ArrayList<Integer> colors;
int maxColors = 4;
int[] hues;
int[] colors;
int rangeWidth = 10;

int[] angles = new int[181];
int[] anglesII = new int[181];

PImage[] outputs;

int colorToChange = 1;

int totalangle = 0;



void setup() {
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, video.width, video.height);
  contours = new ArrayList<Contour>();

  size(830, 480, P2D);

  // Array for detection colors
  colors = new int[maxColors];
  hues = new int[maxColors];

  outputs = new PImage[maxColors];
  setanglestozero();
  video.start();
}

void draw() {

  background(150);

  if (video.available()) {
    video.read();
  }

  // <2> Load the new frame of our movie in to OpenCV
  opencv.loadImage(video);

  // Tell OpenCV to use color information
  opencv.useColor();
  src = opencv.getSnapshot();

  // <3> Tell OpenCV to work in HSV color space.
  opencv.useColor(HSB);

  detectColors();

  // Show images
  image(src, 0, 0);
  for (int i=0; i<outputs.length; i++) {
    if (outputs[i] != null) {
      image(outputs[i], width-src.width/4, i*src.height/4, src.width/4, src.height/4);

      noStroke();
      fill(colors[i]);
      rect(src.width, i*src.height/4, 30, src.height/4);
    }
  }

  // Print text if new color expected
  textSize(20);
  stroke(255);
  fill(255);

  if (colorToChange > -1) {
    text("click to change color " + colorToChange, 10, 25);
  } else {
    text("press key [1-4] to select color", 10, 25);
  }

  displaylines();
}


void detectColors() {

  for (int i=0; i<hues.length; i++) {

    if (hues[i] <= 0) continue;

    opencv.loadImage(src);
    opencv.useColor(HSB);

    // <4> Copy the Hue channel of our image into 
    //     the gray channel, which we process.
    opencv.setGray(opencv.getH().clone());

    int hueToDetect = hues[i];
    //println("index " + i + " - hue to detect: " + hueToDetect);

    // <5> Filter the image based on the range of 
    //     hue values that match the object we want to track.
    opencv.inRange(hueToDetect-rangeWidth/2, hueToDetect+rangeWidth/2);

    //opencv.dilate();
    opencv.erode();

    // TO DO:
    // Add here some image filtering to detect blobs better

    // <6> Save the processed image for reference.
    outputs[i] = opencv.getSnapshot();
  }

  // <7> Find contours in our range image.
  //     Passing 'true' sorts them by descending area.
  if (outputs[0] != null) {

    opencv.loadImage(outputs[0]);
    contours = opencv.findContours(true, true);

    // Find lines with Hough line detection
    // Arguments are: threshold, minLengthLength, maxLineGap
    lines = opencv.findLines(200, 200, 20);
  }
}

void displaylines() {
  strokeWeight(3);
  totalangle = 0;
  if (lines!=null) {
    for (Line line : lines) {
      // lines include angle in radians, measured in double precision
      // so we can select out vertical and horizontal lines
      // They also include "start" and "end" PVectors with the position
      stroke(0, 122, 0);
      line(line.start.x, line.start.y, line.end.x, line.end.y);
      int angle = (int)degrees(((float)line.angle+HALF_PI));
      if (angle < -179) {
        angle = angle + 180;
      }
      if (angle < 0) {
        angle = angle + 180;
      }
      totalangle = totalangle + angle;      
      angles[angle] = angles[angle] +1;
    }



    float max = (max(angles));
    for (int i = 0; i < 180; i = i+1) {
      if (max == angles[i]) {
        //println("angle =" + i); //angle of mostley measured angle
      }
    }
    if (totalangle !=0) {
      println(totalangle/lines.size()); //angle of average
    }
  }
  setanglestozero();
}


void setanglestozero() {
  for (int i = 0; i < 180; i = i+1) {
    angles[i] = 0;
  }
}



void mousePressed() {
  color c = get(mouseX, mouseY);
  println("r: " + red(c) + " g: " + green(c) + " b: " + blue(c));

  int hue = int(map(hue(c), 0, 255, 0, 180));

  colors[colorToChange-1] = c;
  hues[colorToChange-1] = hue;

  println("value: " + hue);
}
