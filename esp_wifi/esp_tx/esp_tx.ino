/*
    This sketch sends a string to a TCP server, and prints a one-line response.
    You must run a TCP server in your local network.
    For example, on Linux you can use this command: nc -v -l 3000
*/

#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <SoftwareSerial.h>

#ifndef STASSID
#define STASSID "Etest"
#define STAPSK "thereisnospoon"
#endif

const char* ssid = STASSID;
const char* password = STAPSK;

const char* host = "192.168.4.1";
const uint16_t port = 80;


ESP8266WiFiMulti WiFiMulti;
SoftwareSerial mySerial(D5, D6);



void setup() {
  Serial.begin(115200);
  mySerial.begin(115200);
  // We start by connecting to a WiFi network
  WiFi.mode(WIFI_STA);
  WiFiMulti.addAP(ssid, password);

  Serial.println();
  Serial.println();
  Serial.print("Wait for WiFi... ");

  while (WiFiMulti.run() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  delay(500);
}


void loop() {
  if (mySerial.available())
  {
    int t, h, p, l_v, l_g;
    String mess = mySerial.readStringUntil('\n');
    if (sscanf(mess.c_str(), "T%d|H%d|P%d|L_V%d|L_G%d", &t, &h, &p, &l_v, &l_g) == 5)
    {
      WiFiClient client;
      if (client.connect(host, port))
      {
        String to_send = "GET /data?t=" + String(t) + "&h=" + String(h) + "&p=" + String(p) + "&l_v=" + String(l_v) + "&l_g=" + String(l_g)+ " HTTP/1.1\r\n";
        to_send +=   "Host: " + String(host) + "\r\n";
        to_send += "Connection: close\r\n\r\n";
        client.print(to_send);
        Serial.println("Data sent!");
      }
      else
      {
        Serial.println("Connection failed");
      }
    }
    

  }

}
