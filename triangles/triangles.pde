void setup() {
  size(730, 700);

  float nrOfTriangles = random(3, 10);
  triangleDraw(int(nrOfTriangles), 35, 60, 660);

  save("output.png");
  exit();
}

void triangleDraw(int n, double x, double y, double size) {
  if (n == 0) {
    return;
  }
  double x0 = x;
  double y0 = y;
  double x1 = x0 + size;
  double y1 = y0;
  double x2 = x0 + size / 2;
  double y2 = y0 + (Math.sqrt(3)) * size / 2;

  //drawing initial big triangle
  line((int) x0, (int) y0, (int) x1, (int) y1);
  line((int) x0, (int) y0, (int) x2, (int) y2);
  line((int) x1, (int) y1, (int) x2, (int) y2);

  int r = 255 - (int) (Math.random() * 255);
  int g = 255 - (int) (Math.random() * 255);
  int b = 255 - (int) (Math.random() * 255);

  //recursing
  stroke(r, g, b);
  triangleDraw(n - 1, x0, y0, size / 2);
  stroke(r, g, b);
  triangleDraw(n - 1, (x0 + x1) / 2, (y0 + y1) / 2, size / 2);
  stroke(r, g, b);
  triangleDraw(n - 1, (x0 + x2) / 2, (y0 + y2) / 2, size / 2);
}
