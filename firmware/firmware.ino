#include "Arduino.h"
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266HTTPUpdateServer.h>
#include <ESP8266mDNS.h>
#include <WiFiManager.h>
#include <Adafruit_NeoPixel.h>

#include <uri/UriBraces.h>

// D1=GPIO5
// D2=GPIO4
#define LED_PIN D1
#define LED_COUNT 60
#define RELAY_PIN D2
#define REFRESH_INTERVAL_MS 1000

typedef struct status
{
  bool on;
  int brightness;
} Status;

WiFiManager wifiManager;
ESP8266WebServer server(80);
ESP8266HTTPUpdateServer updater;
Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_RGB + NEO_KHZ800);

Status currentStatus = {false, 0};

unsigned long lastRefreshTime = 0;

const char *hostname = "neopixel-control";

void health()
{
  server.send(200, "text/plain", "ok");
}

void metrics()
{
  String message = "# HELP esp8266_up Is this host up\n";
  message += "# HELP esp8266_up gauge\n";
  message += "esp8266_up 1\n";
  server.send(200, "text/plain", message);
}

void on()
{
  togglePower(true);
  server.send(200, "text/plain", "ok");
}

void off()
{
  togglePower(false);
  server.send(200, "text/plain", "ok");
}

void status()
{
  server.send(200, "text/plain", currentStatus.on ? "1" : "0");
}

void get_brightness()
{
  server.send(200, "text/plain", String(currentStatus.brightness));
}

void set_brightness()
{
  int desiredBrightness = server.pathArg(0).toInt();
  setDesiredBrightness(desiredBrightness);
  get_brightness();
}

void reset()
{
  server.send(200, "text/plain", "All network settings reset. Please reboot and reconfigure.");
  wifiManager.resetSettings();
}

void routing()
{
  server.on("/", HTTP_GET, []() {
    server.send(200, F("text/plain"),
                F("Neopixel network controller"));
  });
  server.on(F("/health"), HTTP_GET, health);
  server.on(F("/metrics"), HTTP_GET, metrics);
  server.on(F("/on"), HTTP_GET, on);
  server.on(F("/off"), HTTP_GET, off);
  server.on(F("/status"), HTTP_GET, status);
  server.on(F("/brightness"), HTTP_GET, get_brightness);
  server.on(UriBraces("/brightness/{}"), HTTP_GET, set_brightness);
  server.on(F("/reset"), HTTP_DELETE, reset);
}

void handleNotFound()
{
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i = 0; i < server.args(); i++)
  {
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
}

void setupPixels()
{
  strip.begin();
  strip.show();
}

void setupRelay()
{
  pinMode(RELAY_PIN, OUTPUT);
  digitalWrite(RELAY_PIN, LOW);
}

void togglePower(bool on)
{
  Status newStatus = {on, currentStatus.brightness};
  if (newStatus.on && newStatus.brightness == 0)
  {
    newStatus.brightness = 1;
  }
  updateStatus(newStatus);
}

void setDesiredBrightness(int newBrightness)
{
  Status newStatus = {currentStatus.on, currentStatus.brightness};

  if (newStatus.brightness != newBrightness)
  {
    newStatus.brightness = newBrightness;
    if (newStatus.brightness > 100)
    {
      newStatus.brightness = 100;
    }
    if (newStatus.brightness < 0)
    {
      newStatus.brightness = 0;
    }
    newStatus.on = newStatus.brightness > 0;
  }
  updateStatus(newStatus);
}

void updateStatus(Status newStatus)
{
  Serial.print("From: On ");
  Serial.print(currentStatus.on ? "yes" : "no");
  Serial.print(" brightness: ");
  Serial.print(currentStatus.brightness);
  Serial.print("To: On ");
  Serial.print(newStatus.on ? "yes" : "no");
  Serial.print(" brightness: ");
  Serial.println(newStatus.brightness);

  if (!currentStatus.on && newStatus.on)
  {
    power_relay_on();
  }

  if (currentStatus.on && !newStatus.on)
  {
    power_relay_off();
  }
  else
  {
    setPixelColorFromBrightness(newStatus.brightness);
  }

  currentStatus = newStatus;
}

void power_relay_on()
{
  digitalWrite(RELAY_PIN, HIGH);
}

void power_relay_off()
{
  digitalWrite(RELAY_PIN, LOW);
}

void setPixelColorFromBrightness(int brightness)
{
  int color = int(float(brightness) / 100.0 * 255.0);
  if (color > 255)
  {
    color = 255;
  }
  if (color < 0)
  {
    color = 0;
  }
  strip.fill(strip.Color(color, color, color));
  strip.show();
}

void setup(void)
{
  Serial.begin(115200);

  WiFi.mode(WIFI_STA);
  wifiManager.setHostname(hostname);
  wifiManager.autoConnect();

  if (MDNS.begin(hostname))
  {
  }

  routing();
  server.onNotFound(handleNotFound);
  updater.setup(&server);
  server.begin();

  MDNS.addService("http", "tcp", 80);

  setupPixels();
  setupRelay();
}

void loop(void)
{
  MDNS.update();
  server.handleClient();

  unsigned long currentTime = millis();
  if (currentTime - lastRefreshTime >= REFRESH_INTERVAL_MS)
  {
    lastRefreshTime = currentTime;
    updateStatus(currentStatus);
  }
}
