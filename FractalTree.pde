private double fractionLength = .78;
private int smallestBranch = 10;
private double branchAngle = 0.4;
public void setup()
{
  size(640, 480);
  frameRate(10);
}

public void draw()
{
  background(233,195,198);
  line(320, 480, 320, 380);
  drawBranches(320, 380, 100, 3*Math.PI/2);
}

public void drawBranches(int x, int y, double branchLength, double angle)
{
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x-10);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x+10);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  if (branchLength > 100);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
  int diam = 0;
  float r = 255;
  noFill();
  while (diam < 30) {
    strokeWeight(2);
    stroke((int)(Math.random()*256)+150, (int)(Math.random()*256)+100, (int)(Math.random()*256)+50);
    diam++;
    r-=255/30.0;
  }
}
