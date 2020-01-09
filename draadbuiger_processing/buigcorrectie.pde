//float correctien10 = 1.55;
float correctien10 = 1.65;
float correctien20 = 1.78;
float correctien30 = 1.78;
float correctien40 = 1.76;
float correctien50 = 1.74;
float correctien60 = 1.74;
float correctien70 = 1.74;
float correctien80 = 1.72;
float correctien90 = 1.68;

float correctie10 = 1.55;
float correctie20 = 1.76;
float correctie30 = 1.81;
float correctie40 = 1.79;
float correctie50 = 1.77;
float correctie60 = 1.74;
float correctie70 = 1.70;
float correctie80 = 1.67;
float correctie90 = 1.64;b

void buigcorrectie() {

    if (input<=-90) {
    println(input); 
    println(correctien90);
    input = input * correctien90;
    input = (round(input*100))/100;
    println(" correctie: " + input);
    }
  else if (input<=-80) {
    println(input); 
    println(correctien80);
    println(correctie80 + (((correctie90 - correctie80)/10)*(round(input))));
        //input = input * (correctie80 + (((correctie90 - correctie80)/10)*(round(input))));
    input = input * correctien80;
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=-70) {
    println(input);
    println(correctien70);
        //input = input * (correctie70 + (((correctie80 - correctie70)/10)*(round(input))));
    input = input * correctien70;    
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=-60) {
    println(input);
    println(correctien60);
        //input = input * (correctie60 + (((correctie70 - correctie60)/10)*(round(input))));
    input = input * correctien60;
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=-50) {
    println(input);
    println(correctien50);
        //input = input * (correctie50 + (((correctie60 - correctie50)/10)*(round(input))));
    input = input * correctien50;
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=-40) {
    println(input);
    println(correctien40);
        //input = input * (correctie40 + (((correctie50 - correctie40)/10)*(round(input))));
    input = input * correctien40;
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=-30) {
    println(input);
    println(correctien30);
    //input = input * (correctie30 + (((correctie40 - correctie30)/10)*(round(input)))); 
    input = input * correctien30;
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=-20) {
    println(input);
    println(correctien20);
        //input = input * (correctie20 + (((correctie30 - correctie20)/10)*(round(input))));
    input = input * correctien20;
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=-10) {
    println(input);
    println(correctien10);
        //input = input * (correctie10 + (((correctie20 - correctie10)/10)*(round(input))));
    input = input * correctien10;
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=0) {
    println(input);
    println(correctien10);
    input = input * correctien10;
    input = (round(input*100))/100;
    println(" correctie: " + input);
    
  } else if (input<=10) {
    println(input); 
    println(correctie10);
    input = input * correctie10;
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=20) {
    println(input);
    println(correctie20);
    input = input * (correctie10 + (((correctie20 - correctie10)/10)*(round(input - 10))));    
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=30) {
    println(input);
    println(correctie30);
    input = input * (correctie20 + (((correctie30 - correctie20)/10)*(round(input - 20))));
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=40) {
    println(input);
    println(correctie40);
    input = input * (correctie30 + (((correctie30 - correctie40)/10)*(round(input - 30))));
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=50) {
    println(input);
    println(correctie50);
    input = input * (correctie40 + (((correctie40 - correctie30)/10)*(round(input - 40))));
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=60) {
    println(input);
    println(correctie60);
    input = input * (correctie50 + (((correctie50 - correctie40)/10)*(round(input - 50))));
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=70) {
    println(input);
    println(correctie70);
    input = input * (correctie60 + (((correctie60 - correctie50)/10)*(round(input - 60))));
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=80) {
    println(input);
    println(correctie80);
    input = input * (correctie70 + (((correctie70 - correctie60)/10)*(round(input - 70))));
    input = (round(input*100))/100;
    println(" correctie: " + input);
  } else if (input<=90) {
    println(input);
    println(correctie90);
    input = input * (correctie80 + (((correctie80 - correctie70)/10)*(round(input - 80))));
    input = (round(input*100))/100;
    println(" correctie: " + input);
  }
}
