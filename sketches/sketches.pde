void setup() {
  size(640, 360);
  for (int i = 0; i < 80; i++) {

    float x = random(width);
    float y = random(height);
    float r = random(100, 255);
    float g = random (100, 255);
    float b = random (100, 255);
    float radius = random(20, 100);
    float npoints = random(5, 10);
    noStroke();
    fill(r, g, b, 95);
    polygon(x, y, radius, int (npoints));
  }
  save("output.png");
  exit();
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
