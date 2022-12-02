PImage img;
void setup(){
  size(800,800);

img = loadImage("1.jpeg");
img.resize(800,800);
image(img, 0, 0);
smooth(100);

}
void draw(){
  loadPixels();
  img.loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red  (img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue (img.pixels[loc]);

      // We calculate a multiplier ranging from 0.0 to 8.0 based on mouseX position. 
      // That multiplier changes the RGB value of each pixel.      
      float adjustBrightness = map(mouseX, 0, width, 0, 8); 
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      // The RGB values are constrained between 0 and 255 before being set as a new color.      
      r = constrain(r, 0, 255); 
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();
  int i=3;
  for(int x =1600; x >=0; x-=7)
  {
      int r = (int)(random(1,255));
      int g = (int)(random(1,255));
      int b = (int)(random(1,255));

      stroke(0);
      noFill();
      strokeWeight(2.7);
      ellipse(400, 400, x, x);
  }
}
