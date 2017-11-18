int sensor1=A0,sensor2=A1,sensor3=A2;
int numLeds = 5;
int ledPines[] = { 2, 4, 6, 5, 13 };    
int valorActual = 0;
int cantValores[] = {0,0};
void setup() {
Serial.begin(9600);
  for (int pin = 0; pin < numLeds; pin++)  {
    pinMode(ledPines[pin], OUTPUT);      
  }
}

void loop() { 
  
   if (Serial.available())    { 
    int valorEntante = Serial.read();
    cantValores[valorActual] = valorEntante;
   valorActual++;
    if(valorActual > 1){
      valorActual = 0;
      for (int pin = 0; pin < numLeds; pin++) {
       digitalWrite(ledPines[13],HIGH);      
  }
   }
   
   }

  
  // ENVIO por serial
  Serial.print(sensor1);                 
  Serial.print(",");
  Serial.print(sensor2);                 
  Serial.print(",");
  Serial.println(sensor3);    
delay(100); //para no sobrecargar de datos

}

