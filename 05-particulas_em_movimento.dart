import 'dart:math';

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

  void aplicarForca(Vetor2D forca) {
    aceleracao.x = forca.x / massa;
    aceleracao.y = forca.y / massa;
  }

  void atualizar(double dt) {
    velocidade.incrementar(aceleracao.x*dt, aceleracao.y*dt);
    posicao.incrementar(velocidade.x*dt, velocidade.y*dt);
  }

}

void main (){
  Particula bola = Particula(Vetor2D(0,0),Vetor2D(0,0),Vetor2D(0,0), 1.0 );
  bola.velocidade.y = 10;
  Vetor2D forca = Vetor2D(0, -3);
  for (int i = 0; i < 100; i++){
    print(bola.posicao.y);
    bola.aplicarForca(forca);
    bola.atualizar(0.1);
  }
  

}