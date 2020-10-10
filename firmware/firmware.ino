#include "Arduino.h"
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <WiFiManager.h>
#include <Adafruit_NeoPixel.h>

#include <uri/UriBraces.h>


#define LED_PIN D1
#define LED_COUNT 3

ESP8266WebServer server(80);
Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_RGB + NEO_KHZ800);

const char* hostname = "neopixel-control";
int brightness = 0;
bool is_on = false;

void health() {
    server.send(200, "text/plain", "ok");
}

void metrics() {
    String message = "# HELP esp8266_up Is this host up\n";
    message += "# HELP esp8266_up gauge\n";
    message += "esp8266_up 1\n";
    server.send(200, "text/plain", message);
}

void on() {
    is_on = true;
    setPixelBrightness(brightness);
    server.send(200, "text/plain", "ok");
}

void off() {
    is_on = false;
    setPixelBrightness(brightness);
    server.send(200, "text/plain", "ok");
}

void status() {
  server.send(200, "text/plain", is_on ? "1" : "0");
}

void get_brightness() {
  server.send(200, "text/plain", String(brightness));
}

void set_brightness() {
  int desiredBrightness = server.pathArg(0).toInt();
  setPixelBrightness(desiredBrightness);
  get_brightness();
}

void routing() {
    server.on("/", HTTP_GET, []() {
        server.send(200, F("text/html"),
            F("Welcome to the REST Web Server"));
    });
    server.on(F("/health"), HTTP_GET, health);
    server.on(F("/metrics"), HTTP_GET, metrics);
    server.on(F("/on"), HTTP_GET, on);
    server.on(F("/off"), HTTP_GET, off);
    server.on(F("/status"), HTTP_GET, status);
    server.on(F("/brightness"), HTTP_GET, get_brightness);
    server.on(UriBraces("/brightness/{}"), HTTP_GET, set_brightness);
}

void handleNotFound() {
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i = 0; i < server.args(); i++) {
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
}

void setupPixels() {
  strip.begin();
  strip.show();
}

void setPixelBrightness(int newBrightness) {
  if (brightness != newBrightness) {
    brightness = newBrightness;
    if (brightness > 100) brightness = 100;
    if (brightness < 0) brightness = 0;
    is_on = brightness > 0;
  }
  Serial.print("On ");
  Serial.print(is_on ? "yes" : "no");
  Serial.print(" brightness: ");
  Serial.print(brightness);
}

void setPixelColorFromBrightness() {
  int color = 0;
  if (is_on) {
    color = int(float(brightness) / 100.0 * 255.0);
    if (color > 255) color = 255;
    if (color < 0) color = 0;
  }
  Serial.print(" color: ");
  Serial.println(color);
  strip.fill(strip.Color(color, color, color));
  strip.show();
}
 
void setup(void) {
  Serial.begin(115200);

  WiFiManager wifiManager;
  wifiManager.setHostname(hostname);
  wifiManager.autoConnect();

  Serial.print("IP address: ");
  Serial.print("Hostname: ");
 
  if (MDNS.begin(hostname)) {
  }

  routing();
  server.onNotFound(handleNotFound);
  server.begin();
  

  MDNS.addService("http", "tcp", 80);

  setupPixels();
}
 
void loop(void) {
  MDNS.update();
  server.handleClient();
}
