void laag(){
  println("laag");
  GPIO.digitalWrite(6, GPIO.HIGH);
  delay(50);
}

void hoog(){
    println("hoog");
  GPIO.digitalWrite(6, GPIO.LOW);
    delay(50);
}

void vast(){
    println("vast");
  GPIO.digitalWrite(5, GPIO.HIGH);
    delay(50);
}

void los(){
    println("los");
  GPIO.digitalWrite(5, GPIO.LOW);
    delay(50);  
}
