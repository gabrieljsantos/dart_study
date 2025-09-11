import 'dart:math'

class Vetor2D{
  double x;
  double y;

  Vetor2D(this.x,this.y);

  void incrementar(double x1, double y1){
    x += x1;
    y += y1;
  }

  double magnitude(){
    return (sqrt(pow(x,2)+pow(y,2)));
  }
  
  void limitar(double max){
    double magLimite = magnitude();
    if (magLimite > max){
        double fator = max / magLimite;
        x *= fator;
        y *= fator;
    }
  }
}

class Particula {
  Vetor2D posicao;
  Vetor2D velocidade;
  Vetor2D aceleracao;
  double massa;

  Particula(this.posicao, this.velocidade, this.aceleracao, this.massa);

  metodos...

}