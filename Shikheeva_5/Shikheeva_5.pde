void setup(){
  float curx = 68.0/95.0;
  int n = 8;
  String s[] = new String[n];
  for(int i = 0; i < n; i++)
    s[i]="";
  float f[] = new float[n];
  for(int i = 0; i < n; i++){
    PVector v = findImage(curx);
    for(int j = 0; j <= i; j++){
       s[j] = (int) v.x + s[j];
    }
    f[i] = v.y;
    curx = v.y;
  }
  for(int i = 0; i < n; i++){
    println(s[i],"\t",f[i]);
  }
}

PVector findImage(float x){
  PVector result = new PVector(0,0);
  if(x == 0.4){
    print("Опачки");
  }
  if(x < 0.4){
    result.set(1, revf1(x));
  } else {
    result.set(2, revf2(x));
  }
  return result;
}

float revf1(float x){
  return 5 * x / 2;
}

float revf2(float x){
  return 5 * (x - 0.4) / 3;
}