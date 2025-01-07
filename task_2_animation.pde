// 

int turtleX = 0;       // X position of the animated "turtle"
int turtleY = 240;     // Y position (constant for left-to-right movement)

void setup() {
    size(640, 480);      
}

void draw() {
    // Background
    fill(81, 126, 75);   // Color code #517E4B (RGB)
    noStroke();
    rect(0, 0.19, 91.43, 343.61);

    fill(66, 105, 60);   // Color code #42693C (RGB)
    noStroke();
    rect(91.43, 0.19, 91.43, 343.61);

    fill(81, 126, 75);
    noStroke();
    rect(182.86, 0.19, 91.43, 343.61);

    fill(66, 105, 60); 
    noStroke();
    rect(274.29, 0.19, 91.43, 343.61);

    fill(81, 126, 75);  
    noStroke();
    rect(365.71, 0.19, 91.43, 343.61);

    fill(66, 105, 60); 
    noStroke();
    rect(457.14, 0.19, 91.43, 343.61);

    fill(81, 126, 75);  
    noStroke();
    rect(548.57, 0.19, 91.43, 343.61);

    // Floor
    fill(52, 90, 46);  // Color code #345A2E (RGB)
    noStroke();
    rect(0, 342, 640, 138);

    fill(44, 81, 39); // Shadow color code #2C5127 (RGB)
    noStroke(); 
    ellipse(430, 365, 149, 36);

    // Apple , leaf
    stroke(0);         
    strokeWeight(3);  
    line(500, 100, 450, 200);
   
    fill(115, 149, 52); // #739534 (RGB)
    noStroke(); 
    ellipse(485, 200, 72, 20); 
    
    
    fill(238, 44, 35); // Color code #EE2C23 (RGB)
    noStroke(); 
    ellipse(400, 270, 180, 180); 

    // Drawing the "turtle"
    drawAnimatedTurtle(turtleX, turtleY);
  
    // Moving the "turtle" 
    turtleX += 3; // animation speed 
  
    // When the "turtle" goes off the right edge, back to the left
    if (turtleX > width) {
        turtleX = -60; // smooth transition
    }
}

void drawAnimatedTurtle(int x, int y) {
    // Turtle body
    fill(250, 178, 197);  
    noStroke();
    rect(x, y, 195, 40, 50); // x and y for the position

    // Eyes
    fill(255);  
    noStroke();
    ellipse(x + 170, y + 13, 12, 12); // Position for x and y
    ellipse(x + 170, y + 28, 12, 12); 

    // Pupils
    fill(0);  
    noStroke();
    ellipse(x + 170, y + 13, 8, 8); 
    ellipse(x + 170, y + 28, 8, 8);

    // Lines of segment
    stroke(220, 100, 130);  // Dark pink segment lines
    strokeWeight(2);
    for (int i = 0; i < 9; i++) {
        float lineX = x + 16 + i * 16; 
        line(lineX, y, lineX, y + 39); 
    }
    
save("task_2_animation_2.png"); 
}
