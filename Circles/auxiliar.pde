class Circle {
  
  int code; // Código de color
  float y;  // Diámetro máximo del círculo
  float outY; // Diámetro del círculo exterior
  int startFrame; // frameCount al comienzo del dibujo
  
  public Circle(int code, float y, int startFrame) {
    this.code=code;
    this.y = y;
    this.outY = y; 
    this.startFrame = startFrame; 
  }
  public void setCode(int codeNew){
    this.code=codeNew;
  }
  public int getStartFrame(){
    return startFrame;
  }
  
  void draw() {
    if (frameCount < startFrame) return;
    stroke(code);
    noFill();
    ellipse(0, 0, outY*2, outY*2); 
    
    offset += 0.01;
    rotate(PI/4);
    ellipse(0, 0, width/4 + noise(offset) * mouseX/2, outY*2); 
    
    noStroke();
    outY -= outY / (y/2);
    if (frameCount%y == 200) outY = y;
 }
    
}