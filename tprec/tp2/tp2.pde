PImage img, img1, img2, img3, img4;
PFont miFont;
int contador;
int estado;
float textMovX, textMovY;
int segundos;
boolean reset;
int x = 460;
int y = 400;
int radius = 30;

void setup() {
  size(640, 480);
  img = loadImage("GTA_1.jpg");
  img1 = loadImage("GTA_2.jpg");
  img2 = loadImage("GTA_3.jpg");
  img3 = loadImage("GTA_4.jpg");
  img4 = loadImage("GTA_5.jpg");
  miFont = loadFont("Calibri-Bold-48.vlw");

  // Estados
  textAlign(CENTER, CENTER);
  estado = 0;  // Cambiado a 0 para empezar desde el primer estado
  textMovX = 0;
  textMovY = 0;
  segundos = 10000;  // Restaurado a 10000 milisegundos (10 segundos) para cada estado

  ellipseMode(RADIUS);
}

void draw() {
  textFont(miFont);
  int diferenciaTemporal = millis() - contador;

  // Resetear variables para mover al cambiar de diapositiva
  if (reset) {
    textMovX = 0;
    textMovY = 0;
    reset = false;
  }

  background(255);  // Limpia la pantalla en cada frame

  // Diapo 1
  if (estado == 0) {
    if (textMovY < 400) {
      textMovY = textMovY + 1;
    }
    image(img, 0, 0, 640, 480);
    textSize(20);
    fill(255);
    text("Este juego llamado Grand Theft Auto o Gta \n Fue rapidamente popular entre jovenes y adultos \n por su violencia tan explicita", 320, textMovY);
  }

  // Diapo 2
  if (estado == 1) {
    if (textMovY < 400) {
      textMovY = textMovY + 1;
    }
    image(img1, 0, 0, 640, 480);
    textSize(15);
    fill(255);
    text("Aqui no existen cosas imposibles\n Aunque todo tiene consecuencia \n puedes realizar acciones contra la ley pero seras buscado por la policia \n Desde matar, robar, consumir estupefacientes, etc.", 320, textMovY);
  }

  // Diapositiva 3
  if (estado == 2) {
    if (textMovY < 400) {
      textMovY = textMovY + 1;
    }
    image(img2, 0, 0, 640, 480);
    textSize(15);
    fill(255);
    text("Esta protagonizado por tres personajes principales \n Michael, Trevor, Franklin \n un millonario, un gangster y un alcoholico.", 320, textMovY);
  }

  // Diapositiva 4
  if (estado == 3) {
    if (textMovY < 400) {
      textMovY = textMovY + 1;
    }
    image(img3, 0, 0, 640, 480);
    textSize(15);
    fill(255);
    text("Tuvo una mejoria de graficos avismal para su epoca \n los detalles de los graficos fueron una locura para los jugadores en comparaciones a otros juegos \n Implementando tambien la primera persona en modo de juego, cosa poco comun  \n Asi se destaco rapidamente en el mercado.", 320, textMovY);
  }

  // Diapositiva 5
  if (estado == 4) {
    if (textMovY < 400) {
      textMovY = textMovY + 1;
    }
    image(img4, 0, 0, 640, 480);
    textSize(25);
    fill(255);
    text("FIN \n\n\n gracias por mirar \n\n\n\n profesor Matias Jauregui Lorda \n comisión 2\n Pluchino Maxwell Victoria 95499/1", 320, textMovY);

    // Botón para resetear
    float d = dist(mouseX, mouseY, x, y);
    fill(d < radius ? 100 : 200);  // Si d es menor que radio, 100 si no 200
    ellipse(x, y, radius, radius);
    noStroke();
  }

  // Cambio de diapositiva
  if (diferenciaTemporal >= segundos) {
    estado = (estado + 1) % 5;  // Volver al estado 0 después del último estado
    contador = millis();
    reset = true;
  }
}

// Botón
void mousePressed() {
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) {
    estado = 0;
    contador = millis();
    reset = true;
  }
}
