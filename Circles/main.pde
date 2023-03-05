ArrayList<Circle> circles;
int [][] colors;
int palette;
float offset = 0.0;


void setup() {
  fullScreen();
  noStroke();
  frameRate(120);
    
  background(0);
  
  colors = new int[4][4];
  colors[0][0] = #30E3DF;
  colors[0][1] = #FCE22A;
  colors[0][2] = #F94A29;
  colors[0][3] = #D61355;
  
  colors[1][0] = #3795BD;
  colors[1][1] = #2F58CD;
  colors[1][2] = #4E31AA;
  colors[1][3] = #3A1078;
  
  colors[2][0] = #FF5200;
  colors[2][1] = #FA9905;
  colors[2][2] = #F21170;
  colors[2][3] = #72147E;
  
  colors[3][0] = #AC7088;
  colors[3][1] = #DEB6AB;
  colors[3][2] = #ECCCB2;
  colors[3][3] = #F5E8C7;
  
  palette = (int)random(4);
  
  circles = new ArrayList<Circle>();
  circles.add(new Circle(colors[palette][0],900.0, 0)); 
  circles.add(new Circle(colors[palette][1],900.0, 200));
  circles.add(new Circle(colors[palette][2],900.0, 400));
  circles.add(new Circle(colors[palette][3],900.0, 600)); 
   
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
 
  pushMatrix();
  translate(width/2, height/2);
  int i=0;
  for (int j=0;j<4; j++){
    if(frameCount%600==0){
      palette = (int)random(4);
      circles.get(0).setCode(colors[palette][0]);
      circles.get(1).setCode(colors[palette][1]);
      circles.get(2).setCode(colors[palette][2]);
      circles.get(3).setCode(colors[palette][3]);
    }
    circles.get(j).draw();
    i=i+1;
  }
  popMatrix();
}