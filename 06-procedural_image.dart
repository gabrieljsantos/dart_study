import 'dart:math';
import 'dart:io';
import 'package:image/image.dart';

class Ponto{
  int x ;
  int y ;
  int corR ;
  int corG ;
  int corB ;
  double passo ;
  double fase ;

  Ponto(this.x,this.y,this.corR,this.corG,this.corB,this.passo,this.fase);

  void atualizar(int rederType) {
    switch (rederType) {
      case 1:
        corR = ((cos((x * passo) + fase)* 127 + 128).toInt());
        corG = ((sin((x * passo) + fase)* 127 + 128).toInt());
        corB = ((cos(((x+y) * passo) + fase)* 127 + 128).toInt());
      break;
      case 2:
        corR = ((sin((x + y) * passo + fase) * 127 + 128).toInt());
        corG = ((cos((x * 0.5 + y * 0.5) * passo + fase) * 127 + 128).toInt());
        corB = ((sin((x - y) * passo * 2 + fase) * 127 + 128).toInt());
      break;
      case 3:
        corR = ((sin((x + y) * passo + fase) * 127 + 128).toInt());
        corG = ((cos((x * 0.5 + y * 0.5) + fase) * 127 + 128).toInt());
        corB = ((sin((x - y) + fase) * 127 + 128).toInt());
      break;
      case 4:
        corR = ((sin(sqrt(pow(x - 250,2) + pow(y - 250,2)) * 0.03) * 127 + 128).toInt());
        corG = ((cos(sqrt(pow(x - 250,2) + pow(y - 250,2)) * 0.045 - fase) * 127 + 128).toInt());
        corB = ((sin((x - 250) * 0.5 + (y - 250) * 0.5) * 0.06 * 2) * 127 + 128).toInt();
      break;
      case 5:
        corR = ((sin(sqrt(pow(x - 250,2)) * 0.03) * 127 + 128).toInt());
        corG = ((cos(sqrt(pow(x - 250,2) + pow(y - 250,2)) * 0.045 - fase) * 127 + 128).toInt());
        corB = ((sin((x - 250) * 0.5 + (y - 250) * 0.5) * 0.06 * 2) * 127 + 128).toInt();
      break;
    }
  
  }

}
void main(){
  int largura = 500;
  int altura = 500;
  double passo = 0.1;
  double fase = 0;
  List<List<Ponto>> pixel = [];
  Image imagem = Image(width: largura,height: altura);

  for(int i = 0; i < altura; i++){
    List<Ponto> linha = [];   // cria uma lista vazia para representar a linha atual da imagem
    for(int j = 0; j < largura;j++){
      
      Ponto p = Ponto(i, j, 0, 0, 0, passo, fase);
      p.atualizar(5);
      linha.add(p);
      //passo += 1;
    }
    pixel.add(linha);
  }
  for (int y = 0; y < altura; y++) {
    for (int x = 0; x < largura; x++) {
      Ponto p = pixel[y][x];
      imagem.setPixelRgb(x, y, p.corR, p.corG, p.corB);
    }

  }
  File('saida.png').writeAsBytesSync(encodePng(imagem));
}