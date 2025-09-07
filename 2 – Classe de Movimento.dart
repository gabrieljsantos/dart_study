class Movimento {
  double tempo;
  double distancia;

  Movimento(this.tempo, this.distancia);

  double calcularVelocidade() {
    if (tempo == 0) {
      throw Exception("O tempo não pode ser zero.");
    }
    return distancia / tempo;
  }
}

void main() {
  var movimento_object = Movimento(0.1, 100.0);
  double velocidade = movimento_object.calcularVelocidade();
  print("A velocidade é ${velocidade} m/s");
}
