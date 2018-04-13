float k = 50;
float x0 = -6*k;
float y0 = 0.0;

void setup(){
  size(600, 600);
  background(255);
  translate(height/2, width/2);
  line(0, -height/2, 0, height/2);
  line(-width/2, 0, width/2, 0);
  line(-width/2, height/2, width/2, -height/2);
  //drawing func, just to do it quicklier
  drawFunc();
  //line(-width/2, height/2 - k, 0, -k);
  //line(0, -k, width/2, height/2-k);
  for(float x = -300; x < 300; x += 1){
    x0 = x;
    y0 = 0;
    switch(SpiderDiagram()){
      case 1: stroke(255, 128,0);
              break;
      case 2: stroke(0,100,200,10);
              break;
      default: stroke(0);
              break;
    }
    strokeWeight(7);
    point(x, 0);
  }
}

int SpiderDiagram(){
  int n = 100;  
  stroke(0,0,255);
  ArrayList<PVector> list = new ArrayList<PVector>();
  for(int i = 0; i < n; i++){
    PVector v = new PVector(x0,y0);
    //print(v);
    if(list.size()!=0 && list.get(list.size() - 1).dist(v) < 1){
        println("Притягивается к неподвижной точке");
        return 1;
    }
    if(list.contains(v)){
        println("Периодическая орбита");
        return 2;
    }
    list.add(v);
    float y = func(x0);
    //line(x0, -y0, x0, -y);
    //line(x0, -y, y, -y);
    x0 = y;
    y0 = y;
  }
  println("Расходится");
  return 0;
}

float func(float x){
  //return k*sin((x*x)/k/k-77);//
  //return -4*abs(x-1/2*k)+2*k;//
  return -abs(x) + 1*k;
}

void drawFunc(){
  stroke(255,0,0);
  //strokeWeight(3);
  for(float x = -width/2; x <= width/2; x+=0.01){
    point(x, -func(x));
  }
}