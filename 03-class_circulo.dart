class Circulo {
  double raio;

  Circulo(this.raio);

  double calcularArea() {
    return 3.14 * raio * raio;
  }
}

void main(List<String> args) {
  var circulo_object = Circulo(2);
  print("${circulo_object}");
  print(circulo_object);
  print(circulo_object.raio);
  // então quando crio uma variavel do tipo da classe Circulo, e chamo ela de circulo_object
  // altomaticamente, a partir do construtor Circulo, eu consigo atribuir o valor do raio
  // como se fosse um dicionario, depois como o "paramentro" da atribição foi raio. logo se eu chamo o
  // o objeto circulo_object.raio, ele me retorna o valor 2 que foi atribuido
  // e depois eu consigo chamar o metodo CalcularArea, passando o valor do raio
  double area = circulo_object.calcularArea();
  print("A área do círculo é ${area} m²");
}
