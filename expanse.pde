import java.util.Calendar;

//Ring r;
//Ring r2;
//RingElement ring;
PVector origin;
ArrayList <RingElement> rings;

void setup() {

  size(500, 500);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(360, 0, 100);

  rings = new ArrayList<RingElement>();

  origin = new PVector(width/2, height/2);
  int seg = 10;
  int depth = 20;
  for (int i = 0; i < 10; i++) {
    //RingElement ring = new RingElement(
    //  origin,
    //  i * depth, // inner rad
    //  i == 0 ? depth : depth + i * depth, // outer rad
    //  seg, // segemtns
    //  random(PI*2),
    //  color(random(100, 200), random(20, 40), random(80, 100))
    //  );
       RingElement ring = new RingElement(
      origin,
      i * depth, // inner rad
      i == 0 ? depth : depth + i * depth, // outer rad
      seg, // segemtns
      (PI + 0.2), // rotation in radians
      110,220, // hue range
      50,80, // sat range
      90,100 // lightness range
      );
    rings.add(ring);

    seg +=7;
  }
}

void draw() {
  strokeWeight(3);
  stroke(0, 0, 100);
  for (RingElement r : rings) {
    r.draw();
  }
  noLoop();
}
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
