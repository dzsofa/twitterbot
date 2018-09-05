void setup() {

  color[] colors = {#1a535c, #4ecdc4, #f7fff7, #ff6b6b, #ffe66d};

  size(640, 360);
  for (int i = 0; i < 60; i++) {
    int index = int(random(colors.length));
    float x = random(width);
    float y = random(height);
    float radius = random(20, 80);
    float npoints = random(3, 12);
    noStroke();
    fill(colors[index], 95);
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
