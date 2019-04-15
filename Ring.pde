class Ring {
  ArrayList<PVector> points;
  PVector origin;
  float radius;
  int segments;
  float jitter;

  Ring(PVector _origin, float _radius, int _segments) {
    this.points = new ArrayList<PVector>();
    this.origin = _origin;
    this.radius = _radius;
    this.segments = _segments;
    this.jitter = 5;

    setup();
  }
  Ring(PVector _origin, float _radius, int _segments, float _jitter) {
    this.points = new ArrayList<PVector>();
    this.origin = _origin;
    this.radius = _radius;
    this.segments = _segments;
    this.jitter = _jitter;

    this.setup();
  }
  private void setup() {
    float step = (PI*2) / this.segments;
    float angle = step;
    for (int i = 0; i < this.segments; i++) {
      float x =  sin(angle) * this.radius + random(-this.jitter, this.jitter);
      float y =  cos(angle) * this.radius + random(-this.jitter, this.jitter);
      this.points.add(new PVector(x, y));
      //println(angle);
      angle += step;
    }
  }
  void draw() {
    for (PVector p : this.points) {
      point(p.x, p.y);
    }
  }
  Ring copy() {
    Ring r = new Ring(this.origin, this.radius, this.segments);
    return r;
  }
}
