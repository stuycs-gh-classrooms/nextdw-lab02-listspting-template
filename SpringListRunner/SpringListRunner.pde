/* ===================================
SpringListDriver (No Work Goes Here)

This program will work similarly to SpringArrayDriver,
but it will use a linked list of OrbNodes instead of
an array. This driver file is complete, all your work should
be done in the OrbList class. When working, the program can
be controlled as follows:

Keyboard commands:
  1: Create a new list of orbs in a line.
  2: Create a new list of random orbs.
  =: add a new node to the front of the list
  -: remove the node at the front
  SPACE: Toggle moving on/off
  g: Toggle earth gravity on/off

Mouse Commands:
  mousePressed: if the mouse is over an
    orb, remove it from the list.
=================================== */


int NUM_ORBS = 8;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float GRAVITY = 1;

int SPRING_LENGTH = 75;
float  SPRING_K = 0.005;

boolean moving;
boolean earthGravity;
FixedOrb earth;

OrbList slinky;

void setup() {
  size(600, 600);

  earth = new FixedOrb(width/2, height * 200, 1, 20000);

  slinky = new OrbList();
  slinky.populate(NUM_ORBS, true);

  moving = false;
  earthGravity = false;
}//setup

void draw() {
  background(255);
  displayMode();

  slinky.display();

  if (moving) {

    slinky.applySprings(SPRING_LENGTH, SPRING_K);

    if (earthGravity) {
      slinky.applyGravity(earth, GRAVITY);
    }
    slinky.run();
  }//moving

  //saveFrame("data/####-orbnode.png");
}//draw

void mousePressed() {
  OrbNode selected = slinky.getSelected(mouseX, mouseY);
  if (selected != null) {
    slinky.removeNode(selected);
  }
}//mousePressed

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'g') {
    earthGravity = !earthGravity;
  }
  if (key == '=') {
    slinky.addFront(new OrbNode());
  }
  if (key == '-') {
    slinky.removeFront();
  }
  if (key == '1') {
    slinky.populate(NUM_ORBS, true);
  }
  if (key == '2') {
    slinky.populate(NUM_ORBS, false);
  }
}//keyPressed



void displayMode() {
  //initial setup
  color c;
  textAlign(LEFT, TOP);
  textSize(15);
  noStroke();
  //red or green boxes
  c = moving ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(0, 0, 53, 20);
  c = earthGravity ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(60, 0, 101, 20);

  stroke(0);
  fill(0);
  text("MOVING", 1, 3);
  text("EARTH GRAVITY", 61, 3);

}//displayMode
