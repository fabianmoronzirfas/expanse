class RingElement {
  Ring innerRing;
  Ring outerRing;
  float depth;
  PVector origin;
  float innerRadius;
  float outerRadius;
  float rotation;
  color c;
  float [] hueRange;
  float [] satRange ;
  float [] lightnRange ;

  int segments;


  RingElement(
    PVector _origin, 
    float _innerRadius, 
    float _outerRadius, 
    int _segments, 
    float _rotation, 
    color _c) {

    this.c = _c;
    this.origin = _origin;
    this.innerRadius = _innerRadius;
    this.outerRadius = _outerRadius;
    this.segments = _segments;
    this.rotation = _rotation;

    this.setup();
  }

  RingElement(
    PVector _origin, 
    float _innerRadius, 
    float _outerRadius, 
    int _segments, 
    float _rotation, 
    float hueMin, 
    float hueMax, 
    float satMin, 
    float satMax, 
    float lightnMin, 
    float ligthnMax
    ) {
    hueRange = new float[2];
    satRange = new float[2];
    lightnRange = new float[2];
    this.hueRange[0] = hueMin;
    this.hueRange[1] = hueMax;
    this.satRange[0] = satMin;
    this.satRange[1] =  satMax;
    this.lightnRange[0] = lightnMin;
    this.lightnRange[1] = ligthnMax;

    this.origin = _origin;
    this.innerRadius = _innerRadius;
    this.outerRadius = _outerRadius;
    this.segments = _segments;
    this.rotation = _rotation;

    this.setup();
  }

  private void setup() {
    this.depth = this.outerRadius - this.innerRadius;
    innerRing = new Ring(
      this.origin, 
      this.innerRadius, 
      this.segments
      );

    outerRing = new Ring(
      this.origin, 
      this.outerRadius, 
      this.segments
      );
  }
  void draw() {
    //innerRing.draw();
    //outerRing.draw();
    pushMatrix();
    translate(this.origin.x, this.origin.y);
    rotate(this.rotation);
    if (this.hueRange.length == 0) {
      fill(this.c);
    }

    float hs = (this.hueRange[1] - this.hueRange[0]) / this.segments; 
    float ss = (this.satRange[1] - this.satRange[0]) / this.segments;
    float bs = (this.lightnRange[1] - this.lightnRange[0]) / this.segments;
    println("hue max: " + this.hueRange[1] + "\t\thue min: " + this.hueRange[0] + "\t\thue step: " + hs);
    for (int i = 0; i < this.segments; i++) {
      if (this.hueRange.length > 0) {
        float h = this.hueRange[0] +hs * i;
        float s = this.satRange[0]+  ss * i;
        float b = this.lightnRange[0]+ bs * i;
        println("h: " + h + "\t\ts: " + s +"\t\tb: " + b);
        fill( h, s, b);
      }
      int ni = i+1 == this.segments ? 0 : i + 1;
      beginShape();
      vertex(innerRing.points.get(i).x, innerRing.points.get(i).y);
      vertex(innerRing.points.get(ni).x, innerRing.points.get(ni).y);
      vertex(outerRing.points.get(ni).x, outerRing.points.get(ni).y);
      vertex(outerRing.points.get(i).x, outerRing.points.get(i).y);
      endShape(CLOSE);
    }
    popMatrix();
  }
}

void keyPressed(){
  if(key == 's' || key == 'S'){
      String fn ="expanse-" + timestamp() + ".png"; 
      saveFrame(fn);
      println("Saved " + fn);
      
  }
}
