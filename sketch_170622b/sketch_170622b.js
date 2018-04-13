var txt = loadText().toLowerCase();
var ngrms = {};

function setup() {
  noCanvas();
  loadNGrams(3, txt, 1);
  genText("the", 3);
}

function genText(ini, n){
  var gen = ini;
  var index = gen.length;
  var poss;
  while(poss = ngrms[gen.substring(index - n, index)]){
    gen += random(poss);
    index++;
  }
  console.log(gen);
}

function loadNGrams(n, text, m){
  for(var i = 0; i <= text.length - n - m; i++){
    var cur = text.substring(i, i + n);
    var next = text.substring(i + n, i + n + m);
    if(ngrms[cur]){
      ngrms[cur].push(next);
    } else {
      ngrms[cur] = [next];
    }
  }
}

function loadText(){
  return "On the color wheel, you can choose a color from the Hue Ring and adjust the color from the Saturation/ Value Triangle. The top of the triangle represents the highest value (white), and the bottom of the triangle represents the lowest value (black). Saturation levels increase from left to right. Dragging to the right, or clicking on the right, produces purer colors within the predominant hue. Dragging to the left, or clicking on the left, reduces the color saturation and produces muddier or grayer colors. You can move the color wheel in the application window by dragging it to a new location.";
}
