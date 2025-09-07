import 'dart:math';

class Circulo {
  double raio;
  Circulo(this.raio);

  double calcularArea() => 3.14 * raio * raio;
  double calcularPerimetro() => 2 * 3.14 * raio;
}

void main() {
  var random = Random();
  var circulos = List.generate(5, (_) => Circulo(random.nextDouble() * 10));

  for (var circulo in circulos) {
    print("Círculo de raio = ${circulo.raio}");
    print("Área = ${circulo.calcularArea()}");
    print("Perímetro = ${circulo.calcularPerimetro()}");
    print(""); // linha em branco para separar os círculos
  }
}
