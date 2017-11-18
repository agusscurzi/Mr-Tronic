import processing.serial.*;

int end = 10;    // el cierre en ASCII de la linea enviada
String serial;   // declaramos 'serial' como cadena de caracteres
Serial myPort; 
int sensor1, sensor2, sensor3, sensor4, sensor5;
String puerto;
void setupSerial() {
  println(Serial.list());
  puerto="COM19";
  myPort = new Serial(this, puerto, 9600);
  myPort.bufferUntil('\n');
  myPort.clear();
  serial = myPort.readStringUntil(end); // función que lee la cadena fabricada desde Arduino
  serial = null; // inicialmente, la variable serial estará vacía
}
void drawSerial() {
  println("sensor1--> ", sensor1, "sensor2--> ", sensor2, "sensor3---> ", sensor3);

 int valor1 = 123;
  int valor2 = 17;
  byte out[] = new byte[2];
  out[0] = byte(valor1);
  out[1] = byte(valor2);
  myPort.write(out);
}

void serialEvent(Serial myPort) {
  String dato = myPort.readStringUntil('\n');
  dato = trim(dato); // limpia datos incorectos
  int sensors[] = int(split(dato, ',')); //separa los datos separados por una ","
  //println(sensors.length); // imprime cuantos sensores estan entrando
  for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
    //print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
  }
  if (sensors.length > 1) {//  0 es el primer dato despues separado por una "," el segundo y asi
    sensor1 = sensors[0];
    sensor2 = sensors[1];
    sensor3 = sensors[2];
    /*sensor4 = sensors[3];
     sensor5 = sensors[4];*/
  }
}