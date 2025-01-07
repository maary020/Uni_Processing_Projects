/*
 About my work: It shows a night scene with ocean waves, 
 a moon reflecting in the water,and stars in the sky.*/

size(640,480);
background(32, 68, 120);  // Dark blue background #204478 (RGB)};

/*stars in the sky*/
noStroke();  // for removing outline of the circle
ellipse(604, 149, 3, 3);
noStroke();  
ellipse(578, 52, 3, 3);
noStroke();  
ellipse(491, 123, 3, 3);
noStroke();  
ellipse(466, 32, 3, 3);
noStroke();  
ellipse(372, 69, 3, 3);
noStroke();  
ellipse(302, 108, 3, 3);
noStroke();  
ellipse(216, 42, 3, 3);
noStroke();  
ellipse(132, 111, 3, 3);
noStroke();  
ellipse(55, 34, 3, 3);
noStroke();  
ellipse(42, 118, 3, 3);
noStroke();  
ellipse(27, 256, 3, 3);
noStroke();  
ellipse(439, 228, 3, 3);
noStroke();  
ellipse(562, 251, 3, 3);

/*layers of the moon*/
fill(135, 155, 183); // color code #879BB7 (RGB)};
noStroke();  
ellipse(200, 290, 296, 296);

fill(219, 225, 233); // color code #DBE1E9 (RGB)};
noStroke();  
ellipse(200, 290, 243, 243);

fill(255); // color code #FFFFFF (RGB)};
noStroke(); 
ellipse(200, 300, 198, 198);

/*waves*/
fill(8, 27, 57);   // color code #183259 (RGB)};
rect(0, 417, 640, 63);
fill(10, 37, 79);    // color code #0A254F (RGB)};
rect(0, 354, 640, 63);
fill(24, 50, 89);   // color code #406FA3 (RGB)};
rect(0, 291, 640, 63);


save("task_01_ocean_and_sky.png"); 
