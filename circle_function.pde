
float s = 100; //scale factor

void setup() {
  size(700, 500);
  background(255);
  stroke(100);
  translate(width/2, height/2);
  graph();
}

void draw() {
  if (keyPressed) {
    translate(width/2, height/2);
    if (keyCode == UP || keyCode == RIGHT) {
      s *= 1.2;
      graph();
    } else if (keyCode == DOWN || keyCode == LEFT) {
      s /= 1.2;
      graph();
    }
  }
}

void graph() {
  background(255);
  grid();
  stroke(0, 0, 255);
  point(0, 0);
  for (float i = 0; i < 2*PI; i += PI/(s*180)) {
    float f = abs(function(i));
    float x = s*f*cos(i);
    float y = s*f*sin(i);
    if (x < width/2 && x > -width/2 && y < height/2 && y > -height/2) {
      point(x, y);
    }
  }
  stroke(100);
}

void grid() {
  for (int i = (int)((sqrt((width*width)+(height*height))/s)); i > 0; i--) {
    ellipse(0, 0, i*s, i*s);
  }
  for (float i = 0; i < 2*PI; i+=PI/6) {
    line(0, 0, (width*cos(i))/(2*abs(cos(i))), (width*tan(i))/2);
  }
  for (float i = 0; i < 2*PI; i+=PI/4) {
    line(0, 0, (width*cos(i))/(2*abs(cos(i))), (width*tan(i))/2);
  }
  stroke(255, 0, 0);
  line(0, height/2, 0, -height/2);
  line(-width/2, 0, width/2, 0);
  stroke(100);
}

float function(float x) {
  return 5*cos(3*x/2);
}