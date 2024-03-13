class OrbNode extends Orb {

  OrbNode next;
  OrbNode previous;

  OrbNode() {
    super();
    next = null;
    previous = null;
  }//constructor

  OrbNode (int x, int y, int s, float m, OrbNode n, OrbNode p) {
    super(x, y, s, m);
    next = n;
    previous = p;
  }//constructor

  OrbNode(OrbNode n, OrbNode p) {
    super();
    next = n;
    previous = p;
  }//constructor

  void applySprings(int springLength, float springK) {
    if (next != null) {
      PVector s = this.getSpring(next, springLength, springK);
      this.applyForce(s);
    }//there's a next
    if (previous != null) {
      PVector s = this.getSpring(previous, springLength, springK);
      this.applyForce(s);
    }//there's a previous
  }//applySprings

  void display() {
    if (next != null) {
      float d = this.position.dist(next.position);
      if (d < SPRING_LENGTH) {
        stroke(0, 255, 0);
      }
      else if (d > SPRING_LENGTH) {
        stroke(255, 0, 0);
      }
      else {
        stroke(0);
      }
      line(this.position.x, this.position.y, next.position.x, next.position.y);
    }//spring line
    stroke(0);
    super.display();
  }//display();

}// OrbNode
