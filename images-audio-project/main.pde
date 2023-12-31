
import netP5.*;
import oscP5.*;

ArrayList<Circle> circles; //Definimos un array de objeto círculo
ArrayList<Triang> triangles; //Definimos un array de objeto círculo
ArrayList<Square> squares; //Definimos un array de objeto círculo
int [][] colors; //Definimos una matriz de colores para las paletas
int palette; //Elemento random de tipo entero para escoger la paleta de colores
float offset = 0.0; //Argumento del noise en la creación de la elipse
float notes;

void setup() {  //Metodo setup para definir la configuración inicial del proyecto
  fullScreen(); //Pantalla completa
  noStroke(); //Sin borde
  frameRate(120); //Tasa de actualización de los frames. 120 fps
  
  OscP5 oscP5 = new OscP5(this, 11111); // Variable para conexión osc con PureData
    
  background(0); //fondo color negro
  
  colors = new int[10][4]; //Definimos el objeto matriz colors de tamaño 10x4
  //Todas las paletas de colores
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
  
  colors[4][0] = #F4FF61;
  colors[4][1] = #A8FF3E;
  colors[4][2] = #32FF6A;
  colors[4][3] = #27AA80;
  
  colors[5][0] = #F806CC;
  colors[5][1] = #A91079;
  colors[5][2] = #570A57;
  colors[5][3] = #2E0249;
  
  colors[6][0] = #F806CC;
  colors[6][1] = #A91079;
  colors[6][2] = #570A57;
  colors[6][3] = #2E0249;
  
  colors[7][0] = #4B2D9F;
  colors[7][1] = #EE51B1;
  colors[7][2] = #E3C515;
  colors[7][3] = #2C5D37;
  
  colors[8][0] = #F7FD04;
  colors[8][1] = #F9B208;
  colors[8][2] = #F98404;
  colors[8][3] = #FC5404;
  
  colors[9][0] = #000000;
  colors[9][1] = #165E00;
  colors[9][2] = #FFDD00;
  colors[9][3] = #FF0000;
   
  palette = (int)random(10); 
  
  //Se instancian las 4 elipses, cada uno variando su startFrame de 0 a 600 con diferencia de 200
  circles = new ArrayList<Circle>();
  circles.add(new Circle(colors[palette][0],900.0, 0)); 
  circles.add(new Circle(colors[palette][1],900.0, 200));
  circles.add(new Circle(colors[palette][2],900.0, 400));
  circles.add(new Circle(colors[palette][3],900.0, 600)); 
  
  palette = (int)random(10); 
  triangles = new ArrayList<Triang>();
  triangles.add(new Triang(colors[palette][0],0, 300, 300, 300, 150, 0,100));
  triangles.add(new Triang(colors[palette][1],0, 300, 300, 300, 150, 0,200));
  triangles.add(new Triang(colors[palette][2],0, 300, 300, 300, 150, 0,300));
  triangles.add(new Triang(colors[palette][3],0, 300, 300, 300, 150, 0,400));
  
  palette = (int)random(10); 
  squares = new ArrayList<Square>();
  squares.add(new Square(colors[palette][0],width/2, height/2, 100, 100));
  squares.add(new Square(colors[palette][1],width/2, height/2, 200, 200));
  squares.add(new Square(colors[palette][2],width/2, height/2, 300, 300));
  squares.add(new Square(colors[palette][3],width/2, height/2, 400, 400));

}

/* Incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage oscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+oscMessage.addrPattern());
  //println(" typetag: "+oscMessage.typetag());
  if(oscMessage.checkAddrPattern("/notes")) {
    notes = oscMessage.get(0).floatValue();
    println(notes);
    
  }
  
  /*if(oscMessage.checkAddrPattern("/metro")){
    x = map(oscMessage.get(0).floatValue(), 0, 100, 20, width);
  } else if(oscMessage.checkAddrPattern("/metro1000")){
    y = map(oscMessage.get(1).floatValue(), 0, 100, 20, width);
  } */
}

void draw() {
  fill(0, 7); //El primer argumento es el color del fondo, y el segundo es el grado de opacidad
  rect(0, 0, width*2, height*2); //Crea un rectángulo en cada aparición de una elípse para hacerla más visible
 
  translate(width/2, height/2); //Centra los círculos
  
  for (int j=0;j<4; j++){
    circles.get(j).draw(); //Ejecuta el draw de cada círculo
    triangles.get(j).draw(); //Ejecuta el draw de cada triangulo
    squares.get(j).draw();
    }
    
  if (frameCount % 600 == 0 || mousePressed == true){ 
      palette = (int)random(10);
      circles.get(0).setCode(colors[palette][0]);
      circles.get(1).setCode(colors[palette][1]);
      circles.get(2).setCode(colors[palette][2]);
      circles.get(3).setCode(colors[palette][3]);
      palette = (int)random(10); 
      triangles.get(0).setCode(colors[palette][0]);
      triangles.get(1).setCode(colors[palette][1]);
      triangles.get(2).setCode(colors[palette][2]);
      triangles.get(3).setCode(colors[palette][3]);
      palette = (int)random(10); 
      squares.get(0).setCode(colors[palette][0]);
      squares.get(1).setCode(colors[palette][1]);
      squares.get(2).setCode(colors[palette][2]);
      squares.get(3).setCode(colors[palette][3]);
  }
    
    circles.get(0).setOutY(notes*10);
    circles.get(1).setOutY(notes*10);
    circles.get(2).setOutY(notes*10);
    circles.get(3).setOutY(notes*10);
      
    circles.get(0).setOutY_Ellipse(notes*10);
    circles.get(1).setOutY_Ellipse(notes*10);
    circles.get(2).setOutY_Ellipse(notes*10);
    circles.get(3).setOutY_Ellipse(notes*10);
    
    triangles.get(0).setX(notes);
    triangles.get(1).setX(notes);
    triangles.get(2).setX(notes);
    triangles.get(3).setX(notes);
    
    triangles.get(0).setY(notes);
    triangles.get(1).setY(notes);
    triangles.get(2).setY(notes);
    triangles.get(3).setY(notes);
    
    triangles.get(0).setZ(notes);
    triangles.get(1).setZ(notes);
    triangles.get(2).setZ(notes);
    triangles.get(3).setZ(notes);
    
    squares.get(0).setWh(notes);
    squares.get(1).setWh(notes+15);
    squares.get(2).setWh(notes+30);
    squares.get(3).setWh(notes+45);
    
  if (key == ENTER) exit(); // Se termina la ejecución del programa al presionar la tecla enter
}
