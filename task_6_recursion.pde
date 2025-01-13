/*
   Animated snowflake with twinkling stars on a dark blue background.
   This sketch creates a snowflake that changes its structure as you move your mouse.
   
   Instruction:
   The recursion adjusts with the horizontal mouse movement, while the branch 
   length changes with the vertical movement.
   
*/

// Global variables
int maxDepth;    // Controls how deep the recursion goes; changes with mouseX
float branchLen; // Adjusts the length of the snowflake branches; changes with mouseY
float angleMod;  // Animates the angle for branch splits to make it dynamic

int numStars = 100; // Total number of stars in the night sky

// Variables for stars
float[] starX = new float[numStars]; // X positions of stars
float[] starY = new float[numStars]; // Y positions of stars
float[] starBrightness = new float[numStars]; // Brightness of each star
float[] starSize = new float[numStars]; // Size of each star
boolean[] starGrowing = new boolean[numStars]; // Whether each star is growing or dimming

void setup() {
  size(640, 480);     // Canvas size
  background(10, 10, 50);  // A dark blue background (the night sky)
  frameRate(30);           // Runs at 30 frames per second for smooth animation

  // Initializingstar properties
  for (int i = 0; i < numStars; i++) {
    starX[i] = random(width);           // Random X position
    starY[i] = random(height);          // Random Y position
    starBrightness[i] = random(50, 255); // Random initial brightness
    starSize[i] = random(0.5, 2.0);     // Random size
    starGrowing[i] = random(1) > 0.5;   // Randomly deciding if the star is growing or dimming
  }
}

void draw() {
  background(10, 10, 50);  // Resetting the background in each frame

  // Updating and displaying stars
  for (int i = 0; i < numStars; i++) {
    // Updating star brightness
    if (starGrowing[i]) {
      starBrightness[i] += random(1, 3); // Brightening
      if (starBrightness[i] >= 255) {
        starBrightness[i] = 255;
        starGrowing[i] = false; // Start dimming
      }
    } else {
      starBrightness[i] -= random(1, 3); // Dim
      if (starBrightness[i] <= 50) {
        starBrightness[i] = 50;
        starGrowing[i] = true; // Start brightening
      }
    }

    // Drawing star
    noStroke();
    fill(starBrightness[i]);
    ellipse(starX[i], starY[i], starSize[i], starSize[i]);
  }

  // Mapping the mouse movement to control the snowflake's appearance
  
  maxDepth = int(map(mouseX, 0, width, 2, 7));    // MouseX changes recursion depth (2–7 levels)
  branchLen = map(mouseY, 0, height, 40, 100);       // MouseY changes branch length (40–100 pixels)


  // Adding animation to the snowflake branches with an oscillating angle
  
  angleMod = sin(frameCount * 0.05) * PI / 12;       // Smooth angle changes over time

  stroke(255);            // Setting snowflake color to white
  strokeWeight(2);        // Slightly thicker lines for better visibility
  translate(width / 2, height / 2);  // Placing the snowflake in the center of the canvas

  // Drawing six symmetrical branches to form the snowflake
  for (int i = 0; i < 6; i++) {
    pushMatrix();
    rotate(TWO_PI / 6 * i);  // Rotating each branch around the center
    drawBranch(branchLen, 0);  // Creating a recursive branch
    popMatrix();
  }
}

// This function creates each branch of the snowflake using recursion
void drawBranch(float len, int depth) {
  // Base case will be: stop drawing when the recursion depth reaches maxDepth
  if (depth == maxDepth) return;

  // Drawing the main branch
  line(0, 0, 0, -len);
  translate(0, -len);  // Moving to the tip of the branch for further splits

  // Drawing two smaller branches that split at an angle
  pushMatrix();
  rotate(PI / 6 + angleMod);       // Right split with animated angle
  drawBranch(len * 0.6, depth + 1);    // Recursion for the right branch
  popMatrix();

  pushMatrix();
  rotate(-PI / 6 - angleMod);            // Left split with animated angle
  drawBranch(len * 0.6, depth + 1);  // Recursion for the left branch
  popMatrix();
}

// Saving a screenshot of the frame when the mouse is pressed
void mousePressed() {
  save("task_6_recursion.tif");  
}
