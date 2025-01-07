// Hogwarts Timekeepe
// Clock animation inspired by Harry Potter. You can interact with using your mouse.
// Background: Dark Red (#5F021F)
// Text color: Gold (#FFD700)

int clockRadius = 200; // Initial clock radius
float fastNeedleSpeed = 0.05; // Speed for fast needle
float slowNeedleSpeed = 0.01; // Speed for slow needle
color bgColor = color(95, 2, 31); // Gryffindor maroon background
color needleColor = color(255, 150, 50); // Color of the needles
color tickColor = color(200, 200, 250); // Color of the ticks
color scarColor = color(255, 215, 0); // Harry Potter lightning scar color (gold)

void setup() {
  size(640, 480); // Setting up the drawing area
  smooth(); // Enabling anti-aliasing for smoother drawing
}

void draw() {
  background(bgColor); // Filling background with current color

  // Draw Wizard's Clock label
  fill(255, 215, 0); // Gold color
  textAlign(CENTER, TOP);
  textSize(32);
  text("Hogwarts Timekeeper", width / 2, 30);

  translate(width / 2, height / 2); // Moving origin to the center of the window

  // Restrict clock radius to a reasonable range
  clockRadius = constrain(int(map(mouseX, 0, width, 150, 250)), 150, 250);

  // Updating needle speed based on mouse movement
  fastNeedleSpeed = map(mouseY, 0, height, 0.02, 0.1); // Speed changes with Y

  // Drawing clock face
  stroke(tickColor);
  noFill();
  strokeWeight(2);
  ellipse(0, 0, clockRadius * 2, clockRadius * 2); // Outer circle

  // Drawing hour ticks
  for (int i = 0; i < 12; i++) {
    float angle = radians(30 * i); // Converting 30° increments to radians
    float x1 = cos(angle) * (clockRadius - 10);
    float y1 = sin(angle) * (clockRadius - 10);
    float x2 = cos(angle) * clockRadius;
    float y2 = sin(angle) * clockRadius;
    line(x1, y1, x2, y2); // Drawing tick from inner to outer radius
  }

  // Drawing needles
  float fastNeedleAngle = frameCount * fastNeedleSpeed; // Fast needle angle
  float slowNeedleAngle = frameCount * slowNeedleSpeed; // Slow needle angle

  stroke(needleColor);

  // Fast needle (faster)
  pushMatrix();
  rotate(fastNeedleAngle); // Rotating with frame count
  strokeWeight(3);
  line(0, 0, clockRadius - 40, 0); // Needle length
  popMatrix();

  // Slow needle (slower)
  pushMatrix();
  rotate(slowNeedleAngle); // Rotating slower
  strokeWeight(6);
  line(0, 0, clockRadius - 70, 0); // Needle length
  popMatrix();

  // Drawing eyes with glasses
  drawEyesWithGlasses(fastNeedleAngle);

  // Drawing Harry Potter lightning scar
  drawLightningScar();
}

void drawEyesWithGlasses(float needleAngle) {
  // Eye positions relative to the clock center
  float eyeOffsetX = clockRadius / 3;
  float eyeOffsetY = -clockRadius / 4;

  // Calculate eye ball positions based on needle angle
  float eyeBallOffset = 10; // Range of eyeball movement
  float eyeBallX = cos(needleAngle) * eyeBallOffset;
  float eyeBallY = sin(needleAngle) * eyeBallOffset;

  // Glasses frame
  noFill();
  stroke(255); // White glasses frame
  strokeWeight(2);
  ellipse(-eyeOffsetX, eyeOffsetY, 50, 50); // Left glasses
  ellipse(eyeOffsetX, eyeOffsetY, 50, 50); // Right glasses
  line(-eyeOffsetX + 25, eyeOffsetY, eyeOffsetX - 25, eyeOffsetY); // Bridge

  // Draw left eye
  fill(255); // White of the eye
  noStroke();
  ellipse(-eyeOffsetX, eyeOffsetY, 40, 40); // Eye shape
  fill(0); // Pupil
  ellipse(-eyeOffsetX + eyeBallX, eyeOffsetY + eyeBallY, 15, 15); // Pupil position

  // Draw right eye
  fill(255); // White of the eye
  ellipse(eyeOffsetX, eyeOffsetY, 40, 40); // Eye shape
  fill(0); // Pupil
  ellipse(eyeOffsetX + eyeBallX, eyeOffsetY + eyeBallY, 15, 15); // Pupil position
}

void drawLightningScar() {
  // Adjust the starting position of the scar to be above the eyes
  float scarX = -clockRadius / 3; // Scar starts above the left eye
  float scarY = -clockRadius / 1.8; // Scar is placed above the eyes, closer to the forehead
  float scarSize = 20; // Size of the zigzag scar

  stroke(scarColor);
  strokeWeight(4);
  noFill();

  // Lightning scar zigzag path
  beginShape();
  vertex(scarX, scarY);
  vertex(scarX + scarSize / 2, scarY + scarSize / 2);
  vertex(scarX, scarY + scarSize);
  vertex(scarX + scarSize / 2, scarY + scarSize * 1.5);
  endShape();
  
  save("task_4_clock.tif"); 
}

 
