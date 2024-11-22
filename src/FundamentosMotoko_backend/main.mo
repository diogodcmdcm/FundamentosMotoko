import HashMap "mo:base/HashMap";
import Buffer "mo:base/Buffer";
import Bool "mo:base/Bool";
import List "mo:base/List";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Float "mo:base/Float";
import Array "mo:base/Array";
import Order "mo:base/Order";
import Iter "mo:base/Iter";
import RBTree "mo:base/RBTree";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";

//Todos os tipos primitivos deverão ser importados

// Em Motoko cada ator representa um contrato inteligente de canister 
actor FundamentosMotoko {

  // Para adicionar comentários de uma linha, use "//" (duas barras) antes do texto do comentário.

  // Para adicionar Comentários de várias linhas, use /*  para iniciar o comentario e */ para finalizar, exemplo:

  /* Comentario
     de várias 
     linhas
  */

  //##########################################################################################################################//

  /* Declaração de variáveis
     
     Ao declarar uma variavel é importante definir se a variavel será mutavel ou não. 
     Para variáveis imutaveis deve-se utilizar "let" (depois que foi declarada não será possivel alterar o seu valor). 
     Geralmente é usado para otimizar o utilização da memoria (memoria já dimensionada), entre outras finalidades.
     Para variáveis mutaveis deve-se utilizar "var" (depois que foi declarada o seu valor poderá ser alterado)  
     Controle de acesso: as variaveis são implicitamente private, não existe a possibilidade de declarar como publica, 
                         caso for necessário acessar os dados de uma variavel através de outro Canister, pode ser utilizada 
                         uma abordagem de encapsulamento com "get" e "set"
     
    Estrutura de declaração 
    
    let nome_da_variavel : tipo = valor_inicial;  (valor_inicial é opcional)  
    var nome_da_variavel : tipo = valor_inicial;  (valor_inicial é opcional)  

    As variaveis (mutáveis ou imutaveis) podem ser definidas como: 

      HEAP:   A memória heap é semelhante a memória RAM de um computador, ela não persiste e não armazena dados a longo prazo. 
              A memória heap de um Canister é removida sempre que ele é parado ou atualizado. Esta memória é usada por padrão 
              para armazenar dados como valores de variáveis, resultados de funções de forma temporária. A memória heap é 
              limitada a um máximo de 4 GiB de dados.

      STABLE: A memória stable é usada para armazenar dados de longo prazo (esta é a diferença entre ela e a memória Heap). 
              Os dados da memória stable são persistidos durante toda a vida útil do Canister, ou seja, quando um 
              Canister é parado ou atualizado, os dados armazenados nesta memória não são removidos. 
              Ela é limitada a 400 GiB. Se um Canister usar mais de 400 GiB de memória, ele ficará preso e se tornará irrecuperável.

    Resumo: a memória stable se torna importante durante as atualizações dos Canister, pois a atualização limpa a memória heap mas 
    preserva a memória stable, e também devido a quantidade de armazenamento suportada por cada um.

    Declaração:

    stable var nome_da_variavel : tipo = valor_inicial;  // Declaração de variável que irá utilizar memória Stable  
    var nome_da_variavel : tipo = valor_inicial;  // Declaração de variável que irá utilizar memória Heap  

  */
  
  //##########################################################################################################################//

  /* Motoko é uma linguagem tipada, isso implica em definir o tipo de todas as variaveis e parametros utilizados 
     no desenvolvimento do código. Os tipos primitivos são:

    Valores lógicos: Bool
    Númericos: Int, Int8, Int16, Int32, Int64, Nat, Nat8, Nat16, Nat32, Nat64 e Float
    Caracteres/Strings: Char e Text
    Sequencia de Bytes: Blob

    Detalhes dos tipos primitivos

    Bool: Valores booleanos (true ou false).
    import Bool "mo:base/Bool";
    var b : Bool = false;  

    Int: Inteiros (…​, -2, -1, 0, 1, 2, …​). Números inteiros podem ser possitivos e negativos.      
    Permite números ilimitados (até que a memória do Canister seja esgotada), porém números muito grandes podem ter
    processamento mais lento.

    import Int "mo:base/Int";
    var i : Int = 1; 
    
    Int8: é um numero inteiro de apenas 8 bit, ele pode armazenar valores de -128 até 127. 
    Necessário tomar cuidado pois utilizar valores fora do limite permitido pode ocorrer erro de execução.

    import Int8 "mo:base/Int8";
    var i8 : Int8 = 1;

    Int16: é um numero inteiro de apenas 16 bit, ele pode armazenar valores de -32.768 até 32.767. 
    Necessário tomar cuidado pois utilizar valores fora do limite permitido pode ocorrer erro de execução. 

    import Int16 "mo:base/Int16";
    var i16 : Int16 = 1;

    Int32: é um numero inteiro de 32 bit, ele pode armazenar valores de -2.147.483.648 até 2.147.483.647. 
    Necessário tomar cuidado pois utilizar valores fora do limite permitido pode ocorrer erro de execução. 

    import Int32 "mo:base/Int32";
    var i32 : Int32 = 1;

    Int64: é um numero inteiro de 64 bit, ele pode armazenar valores de -9.223.372.036.854.775.808 até 9.223.372.036.854.775.807. 
    Necessário tomar cuidado pois utilizar valores fora do limite permitido pode ocorrer erro de execução. 

    import Int64 "mo:base/Int64";
    var i64 : Int64 = 1;

    Nat: Números naturais ( 0, 1, 2, …​). Números naturais aceitam apenas números positivos. 
    Permite números ilimitados (até que a memória do Canister seja esgotada), porém números muito grandes podem ter
    processamento mais lento.

    import Nat "mo:base/Nat";
    var n : Nat = 1;
    
    Nat8: é um numero natural sem sinal de apenas 8 bit, ele pode armazenar valores de 0 até 255. 
    Necessário tomar cuidado pois utilizar valores fora do limite permitido pode ocorrer erro de execução 

    import Nat8 "mo:base/Nat8";
    var n1 : Nat8 = 1;

    Nat16: é um numero natural sem sinal de apenas 16 bit, ele pode armazenar valores de 0 até 65.535. 
    Necessário tomar cuidado pois utilizar valores fora do limite permitido pode ocorrer erro de execução 

    import Nat16 "mo:base/Nat16";
    var n2 : Nat16 = 1;

    Nat32: é um numero natural sem sinal de 32 bit, ele pode armazenar valores de 0 até 4.294.967.295. 
    Necessário tomar cuidado pois utilizar valores fora do limite permitido pode ocorrer erro de execução.

    import Nat32 "mo:base/Nat32";
    var n3 : Nat32 = 1;

    Nat64: é um numero natural sem sinal de 64 bit, ele pode armazenar valores de 0 até 18.446.744.073.709.551.615. 
    
    import Nat64 "mo:base/Nat64";
    var n4 : Nat64 = 1;

    Float: Números de ponto flutuante (número que permite casas decimais). Na documentação do Motoko não é citada a 
    quantidade limite de casas decimais.
    Existem questões relacionadas a precisão que serão discutidas em outro tópico.

    import Float "mo:base/Float";
    var f : Float = 1.1;

    Char: Caracteres de texto Unicode ( 'a', 'B', '☃'). Tabela ASCII.
    import Char "mo:base/Char";
    var t4 : Char = 'a';

    Text: utilizado para armazenar texto/string (sequências de caracteres Unicode).
    Para concatenar o texto é utilizado #
    import Text "mo:base/Text";  
    var t : Text = '';
        
    Blobs: representam sequências de bytes. Eles são imutáveis e iteráveis,
    Ele é útil para armazenar grandes dados binários como, por exemplo: imagens ou arquivos
    import Blob "mo:base/Blob";
    var bl : Blob = "\00\00\00\ff"; 

  */

  //##########################################################################################################################//
   
  /* Declaração de funções

  As funções podem ser publicas ou privadas. No caso de função publica é possivel definir ela como 
  "SHARED" (compartilhada), neste caso é possivel ter maior controle sobre a chamada externa pois, na chamada 
  será passado o objeto Principal. O Principal é um objeto que carrega algumas informações importantes sobre a 
  origem da chamada como, por exemplo, a identidade do chamador ou se é uma chamada de um anonimo,
  isso permite o controle de acesso a uma função. As funções publicas podem ser acessadas por outros Canister 
  enquanto as privadas apenas dentro do seu Actor

  As funções também podem ter como objetivo efetuar alterações/operações ou apenas consultar dados. 
  As funções com objetivo de consulta devem ser definidas como "Query". O processamento delas é mais rápido pois 
  não exigem consenso e não possuem custo de ciclos (gás reverso). As funções que irão gravar informações 
  na blockchain ou realizar outro tipo de operação que não se restringe a consulta possuem custo de ciclos e tendem
  a levar mais tempo no processamento pois necessita de consenso para serem registradas na blockchain.

  Exemplo de função public sem nenhum retorno  */
 
  public func nome_funcao() { 
      //corpo da função         
  };

  // Exemplo de função public recebendo dois parametros, porém sem nenhum retorno 

  public func nome_funcao_a(parametro1 : Text, parametro2 : Text ) {
      //corpo da função
  };

  /* Exemplo de função public recebendo dois parametros e retornando os dois concatenados
     Todas as funções public que possuem retorno "async" são implicitamente do tipo "shared", 
     no entanto não recebem diretamente o Principal. */ 

  public func concatenarTexto(parametro1 : Text, parametro2 : Text ) : async Text {
      return parametro1 # " " # parametro2;
  };

  /* Exemplo de função public e shared. O objeto Principal é recebido em msg. Este objeto é utilizado para 
  verificar se é um chamador anonimo, caso for irá retornar false, caso contrario true */
  public shared(msg) func validaAnonimo() : async Bool {
    let caller : Principal = msg.caller;

    // Verifica se o chamador é anônimo
    if (Principal.isAnonymous(caller)) {
        return false;
    };
    return true;
  };

  /* Exemplo de função do tipo Query, utilizada exclusivamente para realizar consulta de informações. 
    Funções do tipo Query podem receber parametros da mesma forma apresentada anteriormente */
  let mensagem : Text = "Mensagem de teste";

  public query func getMensagem() : async Text {
    return mensagem;
  };

  /* Exemplo de função privada. Apenas outras funções dentro do mesmo Actor terão acesso a ela. 
     Não permite chamadas externas!  */
  private func minhaFuncao(x : Nat) {
    // corpo da função
  };
 
  /* Em relação a variaveis, elas podem ter escopo de Actor onde poderão ser acessadas por qualquer função 
     ou escopo de função onde sua utilização é restrito a função, a cada chamada a função a variavel é "resetada". Exemplo:  */
  public func somar(numero1 : Nat, numero2 : Nat ) : async Nat {      
      var resultado : Nat = numero1 + numero2; // variavel com escopo de função
      return resultado;
  };

  /* Caso precisar imprimir no prompt algum valor poderá ser utilizado o comando print da biblioteca base Debug. 
     Isso é muito util para realização de testes. Para utilizar é necessário o import Debug "mo:base/Debug";  
     Exemplo:  */  
  public func subtrair(numero1 : Nat, numero2 : Nat) : async Nat {      
      var resultado : Nat = numero1 - numero2; // variavel com escopo de função
      Debug.print("O resultado da subtração foi " # Nat.toText(resultado));
      return resultado;
  };

/* ######### OPERADORES

  Operadores numéricos são usados ​​para executar operações aritméticas em tipos numéricos como Nat, Int ou Float. 
  Lista dos operadores numéricos:

  + adição
  - subtração
  * multiplicação
  / divisão
  % módulo
  ** exponenciação

*/
 
 public func adicao(numero1: Int, numero2: Int) : async Int {
    var resultado : Int = numero1 + numero2; 
    return resultado;
 };

 public func subtracao(numero1: Int, numero2: Int) : async Int {
    var resultado : Int = numero1 - numero2; 
    return resultado;
 };

 public func multiplicacao(numero1: Int, numero2: Int) : async Int {
    var resultado : Int = numero1 * numero2; 
    return resultado;
 };

 public func divisao(numero1: Float, numero2: Float) : async Float {
    var resultado : Float = 0;
    if (numero1!=0 and numero2!=0) {
      resultado := numero1 / numero2; 
    };
    return resultado;
 };

 public func modulo(numero1: Int, numero2: Int) : async Int {
    var resultado : Int = 0;
    if (numero1!=0 and numero2!=0) {
      resultado := numero1 % numero2; 
    };
    return resultado;
 };

  public func exponenciacao(base: Int, expoente: Int) : async Int {
      var resultado : Int = 0;
      if (base!=0 and expoente!=0) {
        resultado := base ** expoente; 
      };
      return resultado;
  };
 
/*
Operadores relacionais
Operadores relacionais são usados ​​para relacionar ou comparar dois valores. 
O resultado da comparação é um valor do tipo Bool.

== é igual a
!= não é igual a
<= é menor ou igual a
>= é maior ou igual a
< é menor que 
> é maior que 

*/

public func operador_igual(numero1: Int, numero2: Int) : async Bool {    
    return numero1 == numero2;
};

public func operador_diferente(numero1: Int, numero2: Int) : async Bool {    
    return numero1 != numero2;
};

public func operador_menor_igual(numero1: Int, numero2: Int) : async Bool {    
    return numero1 <= numero2;
};

public func operador_maior_igual(numero1: Int, numero2: Int) : async Bool {    
    return numero1 >= numero2;
};

public func operador_maior(numero1: Int, numero2: Int) : async Bool {    
    return numero1 < numero2;
};

public func operador_menor(numero1: Int, numero2: Int) : async Bool {    
    return numero1 > numero2;
};

/*
Operadores de atribuição
Existem muitos operadores de atribuição em Motoko. Vamos focar apenas em alguns essenciais aqui:

:= atribuição (atualização)
+= adicionar          equivalente a i := i + 1;
-= subtrair           equivalente a i := i - 1;
*= multiplicar        equivalente a i := i * 1;
/= dividir            equivalente a i := i / 1;
%= módulo             equivalente a i := i % 1;
**= exponenciação     equivalente a i := i ** 1;  

*/

/* Estruturas de Controles

  if/else
  while
  for
  switch
*/

//if else - estrutura condicional que valida o resultado da expressão como true ou false 
public func if_else(numero1 : Int, numero2 : Int) : async Text {

    var resultado : Text = "";

  	if (numero1 == numero2) {
    		resultado := "Os dois números são iguais";
   	} else if (numero1 > numero2) {
    		resultado := "O primeiro número é maior";
    } else {
        resultado := "O primeiro número é menor";
    };

    return resultado;
};

//if else - estrutura condicional que valida se o Bool é true ou false 
 public func boolean_if(b : Bool) : async Nat {

    if (b) {
      return 1;
    };

    return 0;
 };

// while - estrutura de repetição que executa o loop até que a condição especificada for true
public func while_loop(n : Nat) : async Text {

    var str : Text = "";
    var i = 0;
    
    while (i <= n){      
        i += 1;
        str := str # " Item: " # Nat.toText(i);
    };

    return str;
};

// for - estrutura de repetição que executa o loop até que o número limite seja atingido
public func for_loop(n : Nat) : async Text {

    var str : Text = "";

    for ( i in Iter.range(0, n) ){    		
        str := str # " Item: " # Nat.toText(i);
    };

    return str;
};

// for - estrutura de repetição que executa o loop até que o todos os itens do array sejam percorridos
let array : [Nat] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

public func for_loop_array() : async Text {

    var str : Text = "";

    for (i in array.keys()) {
        str := str # " Item: " # Nat.toText(i);
    };

    return str;
};

/* switch - estrutura condicional que  executa o bloco correspondente ao "case" que atender 
            a condição especificada. Para a comparação é utilizada a variavel 
            informada no switch */
public func switch_condition(n : Nat) : async Text {
        
    var op : Text = "";

    switch (n) {
        case (1) { 
          op := "Selecionada a opção 1" 
        };
        case (2) { 
          op := "Selecionada a opção 2" 
        };
        case (3) { 
          op := "Selecionada a opção 3" 
        };
        case (_) { 
          op := "Opção Inválida" 
        };
    };

    return op;
}; 

/*
operadores logicos 

and = retorna true apenas se o resultado de ambas condições for true 
or  = retorna true se o resultado de uma das condições for true 

if (condicao1 and condicao2) {
  // Este bloco será executado apenas se ambas as condições forem verdadeiras
};

if (condicao1 or condicao2) {
  // Este bloco será executado se pelo menos uma das condições for verdadeira
};

if ( (a or b) and (c or d) ) {
  // Lógica aqui
}; */

public func operador_and(cond1 : Bool, cond2: Bool) : async Text {

    var resultado : Text = "Falso";    
    if (cond1 and cond2) {
        resultado := "Verdadeiro"      
    };  

    return resultado;
};

public func operador_or(cond1 : Bool, cond2: Bool) : async Text {

    var resultado : Text = "Falso";    
    if (cond1 or cond2) {
        resultado := "Verdadeiro"      
    };  

    return resultado;
};

/************************************************************
      ESTRUTURA DE DADOS
      
*************************************************************/

//Array
//List
//Buffer
//HashMap
//RBTree

/*###################### ARRAY  #######################*/
/*
   Array é uma estrutura de dados que representa uma sequência de valores do mesmo tipo. 
   As principais características dos Arrays são:
        - Os arrays possuem tamanho fixo. Uma vez criado, o tamanho de um array não pode ser alterado.
        - Os elementos de um Array podem ser acessados através de seus índices (iniciando pelo índice 0).
        - Os arrays podem ser imutáveis ou mutávies:
              Arrays imutáveis: Uma vez criados, seus valores não podem ser alterados.
              Arrays mutáveis: Permitem a modificação dos valores após a criação.
            
              Sintaxe:
                 Arrays imutáveis são declarados como [T], onde T é o tipo dos elementos.
                 Arrays mutáveis são declarados como [var T].

Necessário o seguinte import:

import Array "mo:base/Array";
  
*/

let arrayNumerosIm : [Nat] = [1, 2, 3, 4, 5, 6, 7]; // array imutável
var arrayNumerosNat : [Nat] = []; // Se declarar com let a variavel se torna imutável
var arrayNumerosNatInit : [Nat] = [1, 2, 3, 4, 5]; // Se declarar com let a variavel se torna imutável
var arrayNumerosNat2 : [var Nat] = [var]; // Se declarar com let a variavel se torna imutável
var arrayNumerosNat3 : [var Nat] = [var 1, 2, 3, 4, 5]; // Se declarar com let a variavel se torna imutável
let a : [var Char] = Array.init<Char>(3, 'a'); //declaração de variaver mutavel mesmo utilizando let, 
                                               //indica que os itens podem ser alterados
                                               //Define um array com 3 elementos 'a'

public func add_array(n : Nat) : async [Nat] {
    arrayNumerosNat := Array.append(arrayNumerosNat, [n]);
    return arrayNumerosNat;
};

public query func get_array() : async [Nat] {
  return arrayNumerosNat;
};

public func get_size_array() : async Nat {
    return arrayNumerosNat.size();
};
 
public func sort_array() : async [Nat] {
    return Array.sort(arrayNumerosNat, Nat.compare);
};

public func remove_array(n : Nat) : async [Nat] {
    arrayNumerosNat := Array.filter<Nat>(arrayNumerosNat, func(x) { x != n });
    return arrayNumerosNat;
};

public func for_vals_array() : async Text {

    var resultado : Text = "";
    for (valor in arrayNumerosNat.vals() ){
        resultado #=  " - " # Nat.toText(valor);
    };

    return resultado;
};

public func find_array(n : Nat) : async ?Nat {

    func procurar(n1:Nat): Bool {
      n1 == n;
    };

    return Array.find(arrayNumerosNat, procurar);
};

public func reverse_array() : async [Nat] {
    return Array.reverse(arrayNumerosNat);
};

public func equal_array() : async Bool {

    func numeroIgual(n1: Nat, n2: Nat) : Bool {
        n1 == n2;
    };

    return Array.equal(arrayNumerosNat, arrayNumerosNatInit, numeroIgual);
};

public func apenas_par_array() : async [Nat] {

    func numeroPar(n1: Nat) : Bool {
        n1 % 2 == 0;
    };

    return Array.filter(arrayNumerosNat, numeroPar);
};


/*
//Soma os itens do array a base
public func foldLeft_array() : async Nat {

    let array = [40, 20, 0, 10];

    func add(a : Nat, b : Nat) : Nat {
        a + b;
    };

    let base : Nat = 30;

    let sum : Nat = Array.foldLeft<Nat, Nat>(array, base, add);
};

*/

/*

tabulate<X>(size : Nat, generator : Nat -> X) : [X] - Cria um array "imutável" com o tamanho informado em "size" utilizando os dados gerados pela função informada 
                                                      em generator. O valor que será gerado para cada índice processado (expresso abaixo pela letra "i") 
                                                      é criado aplicando-se a função generator em i.
                                                      Exemplo: let array : [Nat] = Array.tabulate<Nat>(4, func i = i * 2);


tabulateVar<X>(size : Nat, generator : Nat -> X) : [var X] - Cria um array "mutável" com o tamanho informado em "size" utilizando os dados gerados pela função informada 
                                                              em generator. O valor que será gerado para cada índice processado (expresso abaixo pela letra "i") 
                                                              é criado aplicando-se a função generator em i.
                                                              Exemplo: let array : [var Nat] = Array.tabulateVar<Nat>(4, func i = i * 2);
                                                                      array[2] := 0; // é possivel alterar o valor do array
                                                                        
freeze<X>(varArray : [var X]) : [X] - Transforma um array mutável em um array imutável. Exemplo:
                                                                                                let varArray = [var 0, 1, 2];
                                                                                                varArray[2] := 3;
                                                                                                let array = Array.freeze<Nat>(varArray);



thaw<A>(array : [A]) : [var A] - Transforma um array imutável em um array mutável. Exemplo: 
                                                                                            let array = [0, 1, 2];
                                                                                            let varArray = Array.thaw<Nat>(array);
                                                                                            varArray[2] := 3;                                                                                              

equal<X>(array1 : [X], array2 : [X], equal : (X, X) -> Bool) : Bool - Testa se dois arrays contêm valores iguais (ou seja, eles representam a mesma lista de
                                                                      elementos). Usado para comparar elementos nos arrays.
                                                                      Exemplo: 
                                                                              import {equal} "mo:base/Nat";
                                                                              let array1 = [0, 1, 2, 3];
                                                                              let array2 = [0, 1, 2, 3];
                                                                              Array.equal(array1, array2, equal)


 find<X>(array : [X], predicate : X -> Bool) : ?X - Retorna o primeiro valor encontrado no array que for igual ao predicate informado. Se nenhum elemento satisfaz 
                                                    o predicado, retorna null. Exemplo: let array = [1, 9, 4, 8];
                                                                                        Array.find<Nat>(array, func x = x > 8)

 append<X>(array1 : [X], array2 : [X]) : [X] - Cria um novo array anexando os valores dos dois arrays informados em array1 e array2. Note que Array.append copia 
                                               seus argumentos e tem complexidade linear; quando usado em um loop, considere usar um Buffer, e Buffer.append, 
                                               em vez disso. Exemplo: 
                                                                      let array1 = [1, 2, 3];
                                                                      let array2 = [4, 5, 6];
                                                                      Array.append<Nat>(array1, array2)

 sort<X>(array : [X], compare : (X, X) -> Order.Order) : [X] - Ordena os elementos do array de acordo o criterio definido em compare. É criado um novo array e retornado.
                                                               Esta opção é utilizada em array imutavel. A classificação é determinística e estável. 
                                                               Exemplo:
                                                                      import Nat "mo:base/Nat";
                                                                      let array = [4, 2, 6];
                                                                      Array.sort(array, Nat.compare)

 sortInPlace<X>(array : [var X], compare : (X, X) -> Order.Order) - Ordena os elementos do array de acordo com o critério definido em compare. Esta opção é utilizada
                                                                    em array mutável, ou seja, o array será alterado e não será gerada uma cópia. A classificação é 
                                                                    determinística e estável. Exemplo: import {compare} "mo:base/Nat";
                                                                                                       let array = [var 4, 2, 6];
                                                                                                       Array.sortInPlace(array, compare);

 reverse<X>(array : [X]) : [X] - Cria um novo array invertendo a ordem dos elementos. Exemplo: let array = [10, 11, 12];
                                                                                               Array.reverse(array)

map<X, Y>(array : [X], f : X -> Y) : [Y] - Cria um novo array aplicando o resultado da função "f" a cada elemento do array. Percorre todo o array. 
                                           Mantém a ordenação original dos elementos. Exemplo:
                                                                                              let array = [0, 1, 2, 3];
                                                                                              Array.map<Nat, Nat>(array, func x = x * 3)

filter<X>(array : [X], predicate : X -> Bool) : [X] - Cria um novo array filtrando os itens de acordo com a função informada em predicate. 
                                                      Seráo incluidos no novo array apenas os item que atendem os critérios informados em predicate.
                                                      Exemplo: let array = [4, 2, 6, 1, 5];
                                                               let evenElements = Array.filter<Nat>(array, func x = x % 2 == 0);

mapEntries<X, Y>(array : [X], f : (X, Nat) -> Y) : [Y] - Cria um novo array aplicando o resultado da função "f" a cada elemento do array e seus respectivos índice. 
                                                          Mantém a ordem original dos elementos.
                                                          Exemplo:
                                                          let array = [10, 10, 10, 10];
                                                          Array.mapEntries<Nat, Nat>(array, func (x, i) = i * x) => Resultado: [0, 10, 20, 30]

mapFilter<X, Y>(array : [X], f : X -> ?Y) : [Y] - Cria um novo array de acordo com o resultado da função "f". É possivel mesclar função de filtro com alteração 
                                                  dos itens do array, ou seja, serão incluidos no novo array apenas os itens que atendem as regras definidas 
                                                  na função "f" podendo alterar o valor do item antes de ser adicionado ao novo array (todos elementos não nulos). 
                                                  Exemplo: 
                                                          let array = [4, 2, 0, 1];
                                                          let newArray = Array.mapFilter<Nat, Text>( array,
                                                                                                     func x = if (x == 0) { null } else { ?toText(100 / x) }
                                                                                                   ); => Resultado: ["25", "50", "100"]



mapResult<X, Y, E>(array : [X], f : X -> Result.Result<Y, E>) : Result.Result<[Y], E> - Cria um novo array aplicando o resultado da função "f" a cada elemento do array. 
                                                                                        Se qualquer item do array produzir um #err, o processamento é abortado no 
                                                                                        mesmo momento e será retornado um #err. Caso contrário, será retornado 
                                                                                        um #ok contendo o novo array. 
                                                                                        Exemplo: 
                                                                                                let array = [4, 3, 2, 1, 0];
                                                                                                // divide 100 by every element in the array
                                                                                                Array.mapResult<Nat, Nat, Text>(array, func x {
                                                                                                  if (x > 0) {
                                                                                                    #ok(100 / x)
                                                                                                  } else {
                                                                                                    #err "Cannot divide by zero"
                                                                                                  }
                                                                                                })



chain<X, Y>(array : [X], k : X -> [Y]) : [Y] - Cria um novo array aplicando o resultado da função "k" a cada elemento do array, 
                                               o resultado é concatenado nos itens do array na mesma ordem que ele é percorrido. Esta operação é similar ao que 
                                               em outras linguagens funcionais conhecido como monadic bind.Exemplo:
                                                                            let array = [1, 2, 3, 4];
                                                                            Array.chain<Nat, Int>(array, func x = [x, -x]) => Resultado: [1, -1, 2, -2, 3, -3, 4, -4]


foldLeft<X, A>(array : [X], base : A, combine : (A, X) -> A) : A - Consolida os elementos de um array em um valor começando com a "base" e  executando a função 
                                                                   "combine" progressivamente. A iteração é executada da esquerda para a direita.
                                                                   Exemplo:
                                                                      import {add} "mo:base/Nat";

                                                                      let array = [4, 2, 0, 1];
                                                                      let sum = Array.foldLeft<Nat, Nat>( array,
                                                                                                          0, // valor base inicial
                                                                                                          func(sumSoFar, x) = sumSoFar + x 
                                                                                                        ); => Resultado: 7


foldRight<X, A>(array : [X], base : A, combine : (X, A) -> A) : A - Consolida os elementos de um array em um valor começando com a "base" e  executando a função 
                                                                   "combine" progressivamente. A iteração é executada da direira para a direita.
                                                                   Exemplo:
                                                                      import {toText} "mo:base/Nat";
                                                                      let array = [1, 9, 4, 8];
                                                                      let bookTitle = Array.foldRight<Nat, Text>(
                                                                        array,
                                                                        "",
                                                                        func(x, acc) = toText(x) # acc
                                                                      ); => Resultado: "1948"


flatten<X>(arrays : [[X]]) : [X] - Junta vários arrays em apenas um único array. Mantém a ordenação original dos elementos.
                                   Exemplo: 
                                            let arrays = [[0, 1, 2], [2, 3], [], [4]];
                                            Array.flatten<Nat>(arrays) => Resultado: [0, 1, 2, 2, 3, 4]

make<X>(element : X) : [X] - Crie um array contendo um único valor. Exemplo: Array.make(2) => [2]

vals<X>(array : [X]) : I.Iter<X> - Retorna um Iterator (Iter) correspondente aos elementos do array. O iterator fornece um único método chamado next(), que retorna 
                                   os elementos em ordem, ou null quando não há elementos.
                                   Exemplo: 
                                      let array = [10, 11, 12];
                                      var sum = 0;
                                      for (element in array.vals()) {
                                        sum += element;
                                      };
                                      sum => Resultado: 33

keys<X>(array : [X]) : I.Iter<Nat> - Retorna um Iterator (Iter) correspondente aos índices do array. O Iterator fornece um único método chamado next(), 
                                     que retorna os índices em ordem.
                                     Exemplo: 
                                          let array = [10, 11, 12];
                                          var sum = 0;
                                          for (element in array.keys()) {
                                            sum += element;
                                          };
                                          sum => Resultado: 3 (soma dos índices 0 + 1 + 2)

size<X>(array : [X]) : Nat - Retorna o tamanho de array. Exemplo: let array = [10, 11, 12];
                                                                  let size = Array.size(array); => 3

subArray<X>(array : [X], start : Nat, length : Nat) : [X] - Retorna um novo subarray com base nos itens do array fornecido. Será criado um subarray do incice 
                                                            correspondente ao "start" até o indice correspondente ao length.
                                                            Exemplo: 
                                                                    let array = [1,2,3,4,5];
                                                                    let subArray = Array.subArray<Nat>(array, 2, 3); => Resultado: [3,4,5]


indexOf<X>(element : X, array : [X], equal : (X, X) -> Bool) : ?Nat - Retorna o índice do item do array que atender o critério passado em "equal".
                                                                      Exemplo:
                                                                      import Char "mo:base/Char";
                                                                      let array = ['c', 'o', 'f', 'f', 'e', 'e'];
                                                                      assert Array.indexOf<Char>('c', array, Char.equal) == ?0;
                                                                      assert Array.indexOf<Char>('f', array, Char.equal) == ?2;
                                                                      assert Array.indexOf<Char>('g', array, Char.equal) == null;

nextIndexOf<X>(element : X, array : [X], fromInclusive : Nat, equal : (X, X) -> Bool) : ?Nat - Retorna o índice do item do array que atender o critério passado em "equal",
                                                                                               pórem o indice inicial será fromInclusive (a busca inicia neste indice)
                                                                            Exemplo:
                                                                            import Char "mo:base/Char";
                                                                            let array = ['c', 'o', 'f', 'f', 'e', 'e'];
                                                                            assert Array.nextIndexOf<Char>('c', array, 0, Char.equal) == ?0;
                                                                            assert Array.nextIndexOf<Char>('f', array, 0, Char.equal) == ?2;
                                                                            assert Array.nextIndexOf<Char>('f', array, 2, Char.equal) == ?2;
                                                                            assert Array.nextIndexOf<Char>('f', array, 3, Char.equal) == ?3;
                                                                            assert Array.nextIndexOf<Char>('f', array, 4, Char.equal) == null;

lastIndexOf<X>(element : X, array : [X], equal : (X, X) -> Bool) : ?Nat - Retorna o ultimo índice do item do array que atender o critério passado em "equal".
                                                                          Exemplo:
                                                                          import Char "mo:base/Char";
                                                                          let array = ['c', 'o', 'f', 'f', 'e', 'e'];
                                                                          assert Array.lastIndexOf<Char>('c', array, Char.equal) == ?0;
                                                                          assert Array.lastIndexOf<Char>('f', array, Char.equal) == ?3;
                                                                          assert Array.lastIndexOf<Char>('e', array, Char.equal) == ?5;
                                                                          assert Array.lastIndexOf<Char>('g', array, Char.equal) == null;

prevIndexOf<T>(element : T, array : [T], fromExclusive : Nat, equal : (T, T) -> Bool) : ?Nat - Retorna o índice da ocorrência anterior do elementno do array 
                                                                                               iniciando a busca por fromExclusive comparando utilizando "equal".
                                                                Exemplo:
                                                                import Char "mo:base/Char";
                                                                let array = ['c', 'o', 'f', 'f', 'e', 'e'];
                                                                assert Array.prevIndexOf<Char>('c', array, array.size(), Char.equal) == ?0;
                                                                assert Array.prevIndexOf<Char>('e', array, array.size(), Char.equal) == ?5;
                                                                assert Array.prevIndexOf<Char>('e', array, 5, Char.equal) == ?4;
                                                                assert Array.prevIndexOf<Char>('e', array, 4, Char.equal) == null;

slice<X>(array : [X], fromInclusive : Nat, toExclusive : Nat) : I.Iter<X> - Permite criar um iterador (Iter) de uma parte específica de um array.
                                                                            Exemplo:
                                                                            let array = [1, 2, 3, 4, 5];
                                                                            let s = Array.slice<Nat>(array, 3, array.size());
                                                                            assert s.next() == ?4;
                                                                            assert s.next() == ?5;
                                                                            assert s.next() == null;
                                                                            let s = Array.slice<Nat>(array, 0, 0);
                                                                            assert s.next() == null;

take<T>(array : [T], length : Int) : [T] -  Cria um novo subarray contendo um número específico de elementos do início ou do final de um array existente.
                                            Exemplo:
                                            let array = [1, 2, 3, 4, 5];
                                            assert Array.take(array, 2) == [1, 2];
                                            assert Array.take(array, -2) == [4, 5];
                                            assert Array.take(array, 10) == [1, 2, 3, 4, 5];
                                            assert Array.take(array, -99) == [1, 2, 3, 4, 5];
*/

/*###################### ARRAY  #######################*/
/*
   List é uma estrutura de dados que representa uma sequência de valores do mesmo tipo. 
   As principais características dos List são:
        - Os elementos do List são armazenados em uma estrutura de dados recursiva, onde cada elemento contém um 
          valor e uma referência para o próximo elemento (ou null para o último elemento)
          Exemplo:
          (opt record {9; opt record {3; opt record {1; opt record {6; opt record {5; opt record {2; null}}}}}})

        - Os Lists são imutáveis, o que significa que uma vez criados, não podem ser modificados.
        - Os Lists são eficientes para operações de inserção no início da lista.
        - Os Lists possuem boa eficiencia em operações como filter.
        - Os Lists na maioria dos casos pode ser mais eficiente que Arrays em termos de uso de memória
          devido a lógica utilizada para o armazenamento. 

Necessário o seguinte import:

import List "mo:base/List";

*/

let listNumeros : List.List<Nat> = List.fromArray([1, 2, 3, 4, 5]);
let listNomes : List.List<Text> = List.fromArray(["Alice", "Bob", "Charlie"]);
var listInt : List.List<Int> = List.nil<Int>();

// É importante notar que todas essas operações criam uma nova lista, pois os Lists em Motoko são imutáveis.
// Não é possivel modificar um List em Motoko, portanto é sempre criada e atribuida uma nova cópia da lista original.
public func add_inicio_list(n : Int) : async List.List<Int> {
    // List.push não modifica a lista original, a função retorna uma nova lista com o elemento adicionado.
    listInt := List.push(n,listInt);    
    return listInt;
};

public func add_final_list(nr : Int) : async List.List<Int> {
 /* Utilizando a função push o item sempre será inserido no inicio da lista, 
    para adicionar ao final da lista utilize append. 
    No exemplo abaixo será criada outra lista e utilizar append para juntar 
    a nova lista ao final da lista existente  */
    listInt := List.append(listInt, List.push(nr, List.nil()) );
    return listInt;
};

public func remover_item_list(nr : Int) : async List.List<Int> {
    /* Filter irá aplicar a função passada como parametro (utilizada para selecionar os elementos existente) 
       e retorna uma nova cópia da lista original. */
    listInt := List.filter(listInt, func (x : Int) : Bool { x != nr });    
    return listInt;
};

public query func get_list() : async List.List<Int> {
  return listInt;
};

public query func get_size_list() : async Nat {
  return List.size(listInt);
};

public query func get_item_list(indice : Nat) : async ?Int {
  return List.get<Int>(listInt, indice);
};

/* Não é possivel incluir um item em um index especifico de um List. 
   Para isto será necessário dividir a lista em duas e depois juntar */
public func incluir_item_index_list(valor: Int, index: Nat) : async List.List<Int> {
    let (lista1, lista2 ) = List.split<Int>(index, listInt);
    var nova_lista : List.List<Int> = List.append(lista1, List.push(valor, List.nil()) );
    listInt := List.append(nova_lista, lista2 );
    return listInt;
};

// Reverse não ordena a lista de traz para frente, apenas lista os itens na ordem original de traz para frente
public query func get_reverse_list() : async List.List<Int> {
  return List.reverse(listInt);
};

// Take irá retornar os primeiros registro do List até o indice passado como parametro.
public query func take_list(nr : Nat) : async List.List<Int> {
  return List.take<Int>(listInt, nr);
};

/* Drop irá retornar os itens do List iniciando no index passado até o final da lista (é o contrario do Take)
   Em outras palavras, irá remover do início do List a quantidade de elementos informada */
public func drop_list(nr : Nat) : async List.List<Int> {
  return List.drop<Int>(listInt, nr);
};

public query func toIter_list() : async Text {
  var str : Text = "";
  for( value in List.toIter(listInt) ) {
      str #= " - " # Int.toText(value);
  };
  return str;
};

public query func ordenar_list() : async List.List<Int> {
    // Função de comparação (neste caso, para ordenar em ordem crescente)
    let ordenar = func (a: Int, b: Int) : Order.Order {
      if (a < b) { #less }
      else if (a > b) { #greater }
      else { #equal }
    };

    // Converte List para Iter, ordena, e converte de volta para List
    return Iter.toList(Iter.sort(List.toIter(listInt), ordenar));

};

//var listA : List<Nat> = (1);  // verificar se lista á imutavel e verificar quais são as diferenças entre array e list
/* segundo a documentação a diferença é a seguinte (porem achei estranha): A diferença entre uma lista e um array é que um array é armazenado como um bloco contíguo de bytes na memória e uma lista é 'espalhada' sem que os elementos tenham que ser adjacentes uns aos outros. A vantagem é que podemos usar a memória de forma mais eficiente preenchendo a memória de forma mais flexível. A desvantagem é que para operações na lista inteira, temos que visitar cada elemento um por um, o que pode ser computacionalmente caro.
*/

/*

nil<T>() : List<T> - Crie uma lista vazia. Exemplo: List.nil<Nat>() // => null
isNil<T>(l : List<T>) : Bool - Verifica se uma lista está vazia e retorna verdadeiro se a lista estiver vazia. Exemplo: List.isNil<Nat>(null) => true
func push<T>(x : T, l : List<T>) : List<T> - Adiciona um item no inicio da lista a retorna uma nova lista. Exemplo: List.push<Nat>(0, null) => ?(0, null);
last<T>(l : List<T>) : ?T - Retorna o último elemento da lista. Exemplo: 
                                                                      import List "mo:base/List";
                                                                      // Criando uma lista de tarefas
                                                                      let tarefas = List.push("Fazer compras", 
                                                                                      List.push("Estudar Motoko", 
                                                                                        List.push("Exercitar-se", 
                                                                                          List.push("Ler um livro", 
                                                                                            List.nil<Text>()))));
                                                                      // Obtendo a última tarefa
                                                                      let ultimaTarefa = List.last<Text>(tarefas);
                                                                      // Exibindo o resultado
                                                                      switch (ultimaTarefa) {
                                                                        case (null) { 
                                                                          Debug.print("Não há tarefas na lista.");
                                                                        };
                                                                        case (?tarefa) {
                                                                          Debug.print("A última tarefa é: " # tarefa); => Resultado: A última tarefa é: Fazer compras
                                                                        };
                                                                      };

pop<T>(l : List<T>) : (?T, List<T>) - Remove o primeiro elemento de uma lista e retornar tanto o elemento removido quanto a lista restante.
                                      Exemplo:
                                              let (primeiroElemento, restoLista) = List.pop(minhaLista);
                                              switch (primeiroElemento) {
                                                case (null) { 
                                                              // Lista vazia 
                                                            };
                                                case (?elemento) { 
                                                                  // Faça algo com o elemento 
                                                                };
                                              };

size<T>(l : List<T>) : Nat - Retorna o número de itens de um List. Exemplo: List.size<Nat>(?(0, ?(1, null))) // => 2

get<T>(l : List<T>, n : Nat) : ?T - Retorna o item correspondente ao indice passado em "n". Exemplo: List.get<Nat>(?(0, ?(1, null)), 1) // => ?1
reverse<T>(l : List<T>) : List<T> - Retorna a lista porém com os itens organizados de forma inversa.
                                    Exemplo:
                                    List.reverse<Nat>(?(0, ?(1, ?(2, null)))) // => ?(2, ?(1, ?(0, null)))

iterate<T>(l : List<T>, f : T -> ()) - Percorrer todo os elementos da lista e aplicar uma função "f" a cada um deles.
                                       Exemplo:
                                       var sum = 0;
                                       List.iterate<Nat>(?(0, ?(1, ?(2, null))), func n { sum += n });
                                       sum => Resultado: 3

map<T, U>(l : List<T>, f : T -> U) : List<U> - Retorna um novo List com o resultado da função "f" aplicado em cada elemento da 
                                               lista passada como parametro.
                                               Exemplo:
                                               import Nat = "mo:base/Nat"
                                               List.map<Nat, Text>(?(0, ?(1, ?(2, null))), Nat.toText) => Resultado: ?("0", ?("1", ?("2", null))


filter<T>(l : List<T>, f : T -> Bool) : List<T> - Cria uma novo List com apenas os elementos que atenderem o critério definido na função "f".
                                                  Exemplo:
                                                  List.filter<Nat>(?(0, ?(1, ?(2, null))), func n { n != 1 }) => Resultado: ?(0, ?(2, null))

func partition<T>(l : List<T>, f : T -> Bool) : (List<T>, List<T>) - Cria dois novos List a partir dos resultados da função "f" informada. 
                                                                     A primeira lista inclui apenas os elementos que retornaram true no resultado da função "f",
                                                                     enquanto a segunda lista inclui apenas os elementos que retornaram false no resultado da função "f".
                                                        Exemplo:
                                                        List.partition<Nat>(?(0, ?(1, ?(2, null))), func n { n != 1 }) => Resultado (?(0, ?(2, null)), ?(1, null))

mapFilter<T, U>(l : List<T>, f : T -> ?U) : List<U> - Retorna os resultados não nulos da função "f" em um novo List. São percorridos todos os itens do List passado 
                                                      como parametro e aplicada a função "f"
                                                      Exemplo:
                                                      List.mapFilter<Nat, Nat>(
                                                        ?(1, ?(2, ?(3, null))),
                                                        func n {
                                                          if (n > 1) {
                                                            ?(n * 2);
                                                          } else {
                                                            null
                                                          }
                                                        }
                                                      ) => Resultado ?(4, ?(6, null))

mapResult<T, R, E>(xs : List<T>, f : T -> Result.Result<R, E>) : Result.Result<List<R>, E> - Percorre todos os itens da lista aplicando a função "f", 
                                                                                             Caso ocorrer um erro o processamento é interrompido e o erro é 
                                                                                             retornado, caso contrário será retornada uma lista com o resultado 
                                                                                             da função "f" nos itens percorridos. 
                                                                                             Exemplo:
                                                                                              List.mapResult<Nat, Nat, Text>(
                                                                                                                              ?(1, ?(2, ?(3, null))),
                                                                                                                              func n {
                                                                                                                                if (n > 0) {
                                                                                                                                  #ok(n * 2);
                                                                                                                                } else {
                                                                                                                                  #err("Some element is zero")
                                                                                                                                }
                                                                                                                              }
                                                                                                                            ); // => #ok ?(2, ?(4, ?(6, null))


func append<T>(l : List<T>, m : List<T>) : List<T> - Acrescenta os elementos de um List no outro. Exemplo:
                                                                                                  List.append<Nat>(?(0, ?(1, ?(2, null))),
                                                                                                                   ?(3, ?(4, ?(5, null)))
                                                                                                                  ) => ?(0, ?(1, ?(2, ?(3, ?(4, ?(5, null))))))

flatten<T>(l : List<List<T>>) : List<T> - Concatena um List de List em apenas um List.
                                          Exemplo:
                                          List.flatten<Nat>( ?(?(0, ?(1, ?(2, null))),
                                                                ?(?(3, ?(4, ?(5, null))),
                                                                  null))
                                                            ); => Resultado: ?(0, ?(1, ?(2, ?(3, ?(4, ?(5, null))))))

take<T>(l : List<T>, n : Nat) : List<T> - Retorna os primeiros n elementos do List passado como parametro. Se o List passado tiver menos de n elementos, 
                                          esta função retorna uma cópia da lista de entrada completa.
                                          Exemplo:
                                          List.take<Nat>( ?(0, ?(1, ?(2, null))),
                                                          2
                                                        ); => Resultado: ?(0, ?(1, null))

drop<T>(l : List<T>, n : Nat) : List<T> - Remove os primeiros n elementos do List passado como parametro.
                                          Exemplo:
                                          List.drop<Nat>(?(0, ?(1, ?(2, null))),
                                                          2
                                                        ); => Resultado: ?(2, null)

foldLeft<T, S>(list : List<T>, base : S, combine : (S, T) -> S) : S - Consolida os elementos de um List em um valor começando com a "base" e executando a função 
                                                                     "combine" progressivamente. A iteração é executada da esquerda para a direita.
                                                                      Exemplo:
                                                                        import Nat "mo:base/Nat";
                                                                        List.foldLeft<Nat, Text>(?(1, ?(2, ?(3, null))),
                                                                                                  "",
                                                                                                  func (acc, x) { acc # Nat.toText(x)}
                                                                                                ) => Resultado: "123"

foldRight<T, S>(list : List<T>, base : S, combine : (T, S) -> S) : S - Consolida os elementos de um List em um valor começando com a "base" e  executando a função 
                                                                       "combine" progressivamente. A iteração é executada da direira para a esquerda.
                                                                       Exemplo:
                                                                       import Nat "mo:base/Nat";
                                                                       List.foldRight<Nat, Text>( ?(1, ?(2, ?(3, null))),
                                                                                                  "",
                                                                                                  func (x, acc) { Nat.toText(x) # acc}
                                                                                              ) => Resultado: "123"

find<T>(l : List<T>, f : T -> Bool) : ?T - Retorna o primeiro valor encontrado no List que for igual ao "f" informado. O primeiro elemento que atender o critério 
                                           passado em "f" será retornado e a busca é encerrada.
                                            Exemplo:
                                            List.find<Nat>(?(1, ?(2, ?(3, null))),
                                                            func n { n > 1 }
                                                          ); => Resultado: ?2

some<T>(l : List<T>, f : T -> Bool) : Bool - Retorna true se existir pelo menos um elemento no List que atenda os critérios definidos na função "f" passado como parametro.
                                             Exemplo:
                                             List.some<Nat>(
                                                ?(1, ?(2, ?(3, null))),
                                                func n { n > 1 }
                                             ) // => true

all<T>(l : List<T>, f : T -> Bool) : Bool - Retorna true se todos os elemento do List atenderem os critérios definidos na função "f" passado como parametro.
                                            Exemplo:
                                            List.all<Nat>( ?(1, ?(2, ?(3, null))),
                                                            func n { n > 1 }
                                                          ); => Resultado: false

merge<T>(l1 : List<T>, l2 : List<T>, lessThanOrEqual : (T, T) -> Bool) : List<T> - Mescla dois List em um único List ordenado. O List retornado será 
                                                                                   ordenado de acordo com o critério informado na função "lessThanOrEqual".
                                                                                   Exemplo: List.merge<Nat>(
                                                                                                      ?(1, ?(2, ?(4, null))),
                                                                                                      ?(2, ?(4, ?(6, null))),
                                                                                                      func (n1, n2) { n1 <= n2 }
                                                                                                    ); => Resultado: ?(1, ?(2, ?(2, ?(4, ?(4, ?(6, null))))))),

compare<T>(l1 : List<T>, l2 : List<T>, compare : (T, T) -> Order.Order) : Order.Order - Compara dois List usando a ordenação lexicográfica especificada 
                                                                                        pela função compare passada como parametro.
                                                                                        Exemplo:
                                                                                        import Nat "mo:base/Nat";
                                                                                        List.compare<Nat>(  ?(1, ?(2, null)),
                                                                                                            ?(3, ?(4, null)),
                                                                                                            Nat.compare
                                                                                                          ) => Resultado: #less

equal<T>(l1 : List<T>, l2 : List<T>, equal : (T, T) -> Bool) : Bool - Compara dois List usando a função informada no parametro "equal". A função do parametro "equal" 
                                                                      é utilizada para determinar a igualdade.
                                                                      Exemplo:
                                                                            import Nat "mo:base/Nat";
                                                                            List.equal<Nat>(  ?(1, ?(2, null)),
                                                                                              ?(3, ?(4, null)),
                                                                                              Nat.equal
                                                                                            ); => Resultado: false

tabulate<T>(n : Nat, f : Nat -> T) : List<T> - Gera um List com base no comprimento e uma função que mapeia de um índice de lista para um elemento de lista.
                                               Cria um List com o tamanho informado em "n" utilizando os dados gerados pela função informada 
                                               em "f". O valor será gerado para cada elemento do List que for processado.
                                               Exemplo:
                                               List.tabulate<Nat>( 3,
                                                                   func n { n * 2 }
                                                                 ) => Resultado: ?(0, ?(2, (?4, null)))

make<T>(x : T) : List<T> - Cria um List com exatamente um elemento. Exemplo: List.make<Nat>( 0 ) => Resultado: ?(0, null)

replicate<T>(n : Nat, x : T) : List<T> - Cria um List com o comprimento informado em "n" repetindo o valor informado em "x" em cada posição do List gerado.
                                         Exemplo:
                                         List.replicate<Nat>( 3, 0 ) => Resultado: ?(0, ?(0, ?(0, null)))

zip<T, U>(xs : List<T>, ys : List<U>) : List<(T, U)> - Cria um List com pares a partir de dois List. Se os List informados tiverem comprimentos diferentes, 
                                                       o List criado terá um comprimento igual ao comprimento do List menor.
                                                       Exemplo:
                                                       List.zip<Nat, Text>( ?(0, ?(1, ?(2, null))),
                                                                            ?("0", ?("1", null)),
                                                                          ) => Resultado: ?((0, "0"), ?((1, "1"), null))

zipWith<T, U, V>(xs : List<T>, ys : List<U>, f : (T, U) -> V) : List<V> - Cria um List o resultado da função "f" passada como parametro. A função "f" irá
                                                                          processar cada par dos List xs e ys com os elementos que correspondem a mesma 
                                                                          posição nos Lists. Se os Lists informados tiverem comprimentos diferentes, 
                                                                          o List criado terá um comprimento igual ao comprimento do List menor.
                                                                          Exemplo:
                                                                          import Nat = "mo:base/Nat";
                                                                          import Char = "mo:base/Char";
                                                                          List.zipWith<Nat, Char, Text>(  ?(0, ?(1, ?(2, null))),
                                                                                                          ?('a', ?('b', null)),
                                                                                                          func (n, c) { Nat.toText(n) # Char.toText(c) }
                                                                                                        ) => Resultado: ?("0a", ?("1b", null))

split<T>(n : Nat, xs : List<T>) : (List<T>, List<T>) - Divide o List passada como parametro em dois Lists. Para dividir o List é utilizada a quantidade 
                                                       de itens passada em "n". Exemplo: List.split<Nat>( 2,
                                                                                                          ?(0, ?(1, ?(2, null)))
                                                                                                        ) => Resultado: (?(0, ?(1, null)), ?(2, null))

chunks<T>(n : Nat, xs : List<T>) : List<List<T>> - Divide o List em vários Lists com o comprimeto informado em "n". 
                                                   Exemplo:
                                                   List.chunks<Nat>( 2,
                                                                     ?(0, ?(1, ?(2, ?(3, ?(4, null)))))
                                                                   ) => Resultado ?(?(0, ?(1, null)),
                                                                                  ?(?(2, ?(3, null)),
                                                                                  ?(?(4, null),
                                                                                  null)))

fromArray<T>(xs : [T]) : List<T> - Converte um Array em List. Exemplo: List.fromArray<Nat>([ 0, 1, 2, 3, 4]) => Resultado:  ?(0, ?(1, ?(2, ?(3, ?(4, null)))))

fromVarArray<T>(xs : [var T]) : List<T> - Converte um Array mutável em um List.
                                          Exemplo: List.fromVarArray<Nat>([var 0, 1, 2, 3, 4]) => Resultado:  ?(0, ?(1, ?(2, ?(3, ?(4, null)))))

toArray<T>(xs : List<T>) : [T] - Cria um array a partir de um List. Exemplo: List.toArray<Nat>(?(0, ?(1, ?(2, ?(3, ?(4, null)))))) => [0, 1, 2, 3, 4]

toVarArray<T>(xs : List<T>) : [var T] - Cria um array mutável a partir de um List. 
                                        Exemplo: List.toVarArray<Nat>(?(0, ?(1, ?(2, ?(3, ?(4, null)))))) => [var 0, 1, 2, 3, 4]

toIter<T>(xs : List<T>) : Iter.Iter<T> - Retorna um iterador (Iter) a partir de um List. Exemplo:
                                                                                            var sum = 0;
                                                                                            for (n in List.toIter<Nat>(?(0, ?(1, ?(2, ?(3, ?(4, null))))))) {
                                                                                              sum += n;
                                                                                            };
                                                                                            sum => Resultado: 10

*/

/*
   Buffer é uma estrutura de dados dinâmica e mutável que pode crescer/aumentar conforme necessário
   à medida que novos elementos são adicionados (diferente de Arrays que possuem tamanho fixo e 
   diferente dos Lists que não permitem alterar os elementos incluidos). 
 
   As principais características dos Buffers são:
        - Os Buffers são mutáveis, permitindo modificações após a sua criação. Possuem estrutura 
          de dados versátil e eficiente, ideal para situações onde necessita-se de uma coleção mutável 
          que pode aumentar dinamicamente.
        - É possivel modificar o conteúdo de um Buffers mesmo se a variável for declarada com "let".
        - Os Buffers foram projetados para serem eficientes em operações de adição e remoção de elementos.
        - Os Buffers podem ser controlados através de indices, é possivel incluir um elemento
          em um indice especifico.
        
Necessário o seguinte import:

   import Buffer "mo:base/Buffer";

*/

var bufferA = Buffer.Buffer<Int>(3); //Declaração de um Buffer com capacidade inicial para armazenar 3 elementos.  
let bufferB : Buffer.Buffer<Int> = Buffer.fromArray([1, 2, 3, 4, 5, 6, 7]); //Inicializa com numeros
var bufferC : Buffer.Buffer<Int> = Buffer.fromArray([1, 2, 3, 4, 5, 6, 7]); //Inicializa com numeros

// Adicionar o item no final do buffer
public func add_final_buffer(n : Int) : async [Int] {    
    bufferA.add(n);
    return Buffer.toArray(bufferA);
};

 /*
  O tipo Buffer.Buffer<Int> não é diretamente serializável, ou seja, não pode ser retornado para o frontend, 
   então precisamos convertê-lo para um tipo serializável.
  Uma abordagem é converter o Buffer para um Array, que pode ser facilmente serializado e enviado para o frontend. 
  */

public func insert_buffer(indice : Nat, valor : Int) : async [Int] {    
    bufferA.insert(indice, valor);
    return Buffer.toArray(bufferA);
};

//Sobrescreve/altera o elemento correspondente ao índice passado
public func put_buffer(indice : Nat, valor : Int) : async [Int] {    
    bufferA.put(indice, valor);
    return Buffer.toArray(bufferA);
};

//Remove do buffer o elemento correspondente ao índice passado
public func remove_buffer(indice : Nat) : async [Int] {    
    let ex = bufferA.remove(indice); // ex recebe o elemento removido
    return Buffer.toArray(bufferA);
};

// Retorna o elemento correspondente ao indice informado
public func get_item_buffer(indice : Nat) : async Int {        
    return bufferA.get(indice);
};

//Retorna todo o conteudo do buffer
public query func get_buffer() : async [Int] {
  return Buffer.toArray(bufferA);
};

public query func ordenar_buffer() : async [Int] {
  bufferA.sort(Int.compare);
  return Buffer.toArray(bufferA);
};

public query func get_size_buffer() : async Nat {
  return bufferA.size();
};

// inclui um Buffer no final de outro buffer, junta os dois
public func add_outro_buffer(n : Int) : async [Int] {        
    var bufferD = Buffer.Buffer<Int>(1);
    bufferD.add(n);
    bufferA.append(bufferD);
    return Buffer.toArray(bufferA);
};

//remove todos os numeros iguais ao passado por parametro
public func remove_element_buffer(n : Int) : async [Int] {    
    bufferA.filterEntries(func (i, x) = x != n); // Remove todos os elementos com valor 1
    return Buffer.toArray(bufferA);
};

//Remove o ultimo elemento do buffer
public func remove_last_buffer() : async [Int] {    
    let ex = bufferA.removeLast(); // ex recebe o elemento removido
    return Buffer.toArray(bufferA);
};

//Remove todos os itens do buffer
public func clear_buffer() : async [Int] {    
    bufferA.clear();
    return Buffer.toArray(bufferA);
};

public query func ordenar_desc_buffer() : async [Int] {     

  bufferA.sort(func(a, b) : Order.Order {
    if (a < b) { #greater } 
    else if (a > b) { #less } 
    else { #equal }
  });
  
  return Buffer.toArray(bufferA);

};

public query func percorrer_buffer() : async Text {
  var str : Text = "";
  for( value in bufferA.vals() ) {
      str #= " - " # Int.toText(value);
  };

  /*
   bufferA.iterate(func (item) {
      // Faça algo com cada item
  });
   */
  
  /* 
    for (i in Iter.range(0, bufferA.size() - 1)) {
        let item = bufferA.get(i);
        // Faça algo com cada item
    };
  */

  return str;
};

/*
class Buffer<X>(initCapacity : Nat)

size() : Nat - Retorna o número total de elementos do buffer. Exemplo: Buffer.size() => 0

add(element : X) - Adiciona um elemento ao final do buffer. Exemplo: buffer.add(0); 
                                                                     buffer.add(1);
                                                                     buffer.add(2);
                                                                     buffer.add(3); 
                                                                     Buffer.toArray(buffer) => [0, 1, 2, 3]

get(index : Nat) : X - Retorna o elemento do índice informado em "index". Exemplo: buffer.add(10);
                                                                                   buffer.add(11);
                                                                                   buffer.get(0); // => 10

getOpt(index : Nat) : ?X - Retorna o elemento do índice informado em "index" como uma opção. Exemplo: buffer.add(10);
                                                                                                      buffer.add(11);
                                                                                                      let x = buffer.getOpt(0); // => ?10
                                                                                                      let y = buffer.getOpt(2); // => null

put(index : Nat, element : X) - Sobrescreve o elemento correspondente ao "index" informado. Exemplo:
                                                                                            buffer.add(10);
                                                                                            buffer.put(0, 20); // sobreescreve 10 (valor do index 0) por 20
                                                                                            Buffer.toArray(buffer) => [20]

removeLast() : ?X - Remove e retorna o último item no buffer ou null se o buffer estiver vazio. Exemplo: buffer.add(10);
                                                                                                         buffer.add(11);
                                                                                                         buffer.removeLast(); // => ?11

remove(index : Nat) : X - Remove e retorna o elemento correspondente ao "index" informado. Todos os elementos com índice > "index" serão deslocados uma posição 
                          para a esquerda. Isso pode causar uma redução do tamanho do buffer.
                          Exemplo: buffer.add(10);
                                   buffer.add(11);
                                   buffer.add(12);
                                   let x = buffer.remove(1); 
                                   Buffer.toArray(buffer) => [10, 12]

clear() - Remove todos os elementos do buffer. Exemplo: buffer.add(10);
                                                        buffer.add(11);
                                                        buffer.add(12);
                                                        buffer.clear(); 
                                                        Buffer.toArray(buffer) => []

filterEntries(predicate : (Nat, X) -> Bool) - Remove os elementos do buffer quando o retorno da função "predicate" retornar falso. 
                                              A função "predicate" recebe tanto o índice do elemento quanto o próprio elemento
                                              e processa, retornando true/false, toda a lista do buffer é percorrida. 
                                              Exemplo:
                                                  buffer.add(10);
                                                  buffer.add(11);
                                                  buffer.add(12);
                                                  buffer.filterEntries(func(_, x) = x % 2 == 0); 
                                                  Buffer.toArray(buffer) => [10, 12]

capacity() : Nat - Retorna a capacidade do buffer (o comprimento do array subjacente).
                   Exemplo: let buffer = Buffer.Buffer<Nat>(2); 
                            buffer.add(10);
                            let c1 = buffer.capacity(); => Resultado: 2
                            buffer.add(11);
                            buffer.add(12); // incrementa a capacidade
                            let c2 = buffer.capacity(); => Resultado: 3

reserve(capacity : Nat) - Altera a capacidade do buffer para "capacity" informada.
                          Exemplo:
                              buffer.reserve(4);
                              buffer.add(10);
                              buffer.add(11);
                              buffer.capacity(); => Resultado: 4

append(buffer2 : Buffer<X>) - Adiciona todos os elementos do buffer passado como parametro no buffer que está chamando a função.
                              Exemplo:
                              let buffer1 = Buffer.Buffer<Nat>(2);
                              let buffer2 = Buffer.Buffer<Nat>(2);
                              buffer1.add(10);
                              buffer1.add(11);
                              buffer2.add(12);
                              buffer2.add(13);
                              buffer1.append(buffer2); => Adicionar os elementos do buffer2 no buffer 1
                              Buffer.toArray(buffer1) => Resultado: [10, 11, 12, 13]

insert(index : Nat, element : X) - Insere um elemento no indice correspondente ao "index" informado, isso irá deslocar 
                                   todos os demais elementos para a direita.
                                   Exemplo: var buffer = Buffer.Buffer<Nat>(2);                                            
                                            buffer.add(10);
                                            buffer.add(11);
                                            buffer.insert(1, 9);
                                            Buffer.toArray(buffer) => Resultado: [10, 9, 11]

insertBuffer(index : Nat, buffer2 : Buffer<X>) - Insere todos os elementos do "buffer2" no buffer que chamou a função.
                                                 Os elementos serão inseridos a partir do "index" informado. Isso irá deslocar 
                                                 todos os elementos existentes para a direita
                                                 Exemplo: 
                                                    let buffer1 = Buffer.Buffer<Nat>(2);
                                                    let buffer2 = Buffer.Buffer<Nat>(2);
                                                    buffer1.add(10);
                                                    buffer1.add(11);
                                                    buffer2.add(12);
                                                    buffer2.add(13);
                                                    buffer1.insertBuffer(1, buffer2);
                                                    Buffer.toArray(buffer1) => [10, 12, 13, 11]

sort(compare : (X, X) -> Order.Order) - Ordena os elementos do buffer de acordo com o critério de ordenação informado em "compare". 
                                        Exemplo: import Nat "mo:base/Nat";
                                                 buffer.add(11);
                                                 buffer.add(12);
                                                 buffer.add(10);
                                                 buffer.sort(Nat.compare);
                                                 Buffer.toArray(buffer) => [10, 11, 12]

vals() : { next : () -> ?X } - Retorna um Iterator (Iter) com os elementos do buffer. O Iterator fornece o método next(), 
                               que permite percorrer todos os elementos do buffer em ordem.
                               Exemplo: buffer.add(10);
                                        buffer.add(11);
                                        buffer.add(12);
                                        var sum = 0;
                                        for (element in buffer.vals()) {
                                          sum += element;
                                        };
                                        sum => Resultado: 33

clone() : Buffer<X> - função @deprecated recomenda-se usar uma função de biblioteca estática.

toArray() : [X]  @deprecated Use uma função de biblioteca estática, Exemplo: Buffer.toArray(buffer1);

toVarArray() : [var X] - função @deprecated recomenda-se usar uma função de biblioteca estática.

isEmpty<X>(buffer : Buffer<X>) : Bool - Retorna verdadeiro se, e somente se o buffer estiver vazio.
                                        Exemplo: buffer.add(2);
                                                 buffer.add(0);
                                                 buffer.add(3);
                                                 Buffer.isEmpty(buffer); => false                                                 

contains<X>(buffer : Buffer<X>, element : X, equal : (X, X) -> Bool) : Bool - Retorna verdadeiro se, e somente se o buffer
                                                                              contem um elemento que atende os critérios definidos
                                                                              na função "equal".
                                                                              Exemplo:
                                                                              import Nat "mo:base/Nat";
                                                                              buffer.add(2);
                                                                              buffer.add(0);
                                                                              buffer.add(3);
                                                                              Buffer.contains<Nat>(buffer, 2, Nat.equal); => true

clone<X>(buffer : Buffer<X>) : Buffer<X> - Retorna uma cópia do buffer, com a mesma capacidade.
                                           Exemplo: buffer.add(1);
                                                    let clone = Buffer.clone(buffer);
                                                    Buffer.toArray(clone); => [1]

max<X>(buffer : Buffer<X>, compare : (X, X) -> Order) : ?X - Retorna o maior elemento do buffer de acordo com o critério
                                                             informado em "compare". 
                                                             Exemplo: import Nat "mo:base/Nat";
                                                                      buffer.add(1);
                                                                      buffer.add(2);
                                                                      Buffer.max(buffer, Nat.compare); => ?2

min<X>(buffer : Buffer<X>, compare : (X, X) -> Order) : ?X - Retorna o menor elemento do buffer de acordo com o critério
                                                             informado em "compare".
                                                             Exemplo:
                                                                  import Nat "mo:base/Nat";
                                                                  buffer.add(1);
                                                                  buffer.add(2);
                                                                  Buffer.min(buffer, Nat.compare); => ?1

equal<X>(buffer1 : Buffer<X>, buffer2 : Buffer<X>, equal : (X, X) -> Bool) : Bool - 
                   Retorna se dois buffers são iguais. Para determinar a igualdade é utilizado o resultado do 
                   processamento da função "equal" passada como parametro. A comparação é executada nos elementos
                   dos buffers e retorna true se os dois buffers forem do mesmo tamanho e "equal" avalia como true/false 
                   para cada par de elementos dos dois buffers do mesmo índice.
                   Exemplo: import Nat "mo:base/Nat";
                            let buffer1 = Buffer.Buffer<Nat>(2);
                            buffer1.add(1);
                            buffer1.add(2);

                            let buffer2 = Buffer.Buffer<Nat>(5);
                            buffer2.add(1);
                            buffer2.add(2);

                            Buffer.equal(buffer1, buffer2, Nat.equal); => true

compare<X>(buffer1 : Buffer<X>, buffer2 : Buffer<X>, compare : (X, X) -> Order.Order) : Order.Order
                     Compara dois buffers usando a ordenação lexicográfica especificada pela função "compare" passada como parametro.
                     Exemplo: import Nat "mo:base/Nat";
                              let buffer1 = Buffer.Buffer<Nat>(2);
                              buffer1.add(1);
                              buffer1.add(2);

                              let buffer2 = Buffer.Buffer<Nat>(3);
                              buffer2.add(3);
                              buffer2.add(4);

                              Buffer.compare<Nat>(buffer1, buffer2, Nat.compare); => #less

toText<X>(buffer : Buffer<X>, toText : X -> Text) : Text - Retorna a representação textual do buffer, 
                                                           usando toText os elementos do buffer serão convertidos em 
                                                           um array de Texto.
                                                           Exemplo:
                                                           import Nat "mo:base/Nat";
                                                           buffer.add(1);
                                                           buffer.add(2);
                                                           buffer.add(3);
                                                           buffer.add(4);
                                                           Buffer.toText(buffer, Nat.toText); => "[1, 2, 3, 4]"

hash<X>(buffer : Buffer<X>, hash : X -> Nat32) : Nat32 - Hashs de buffer são usados criar um hash dos elementos subjacentes. 
                                                         Exemplo:
                                                         import Hash "mo:base/Hash";
                                                         buffer.add(1);
                                                         buffer.add(2);
                                                         buffer.add(3);
                                                         buffer.add(1000);
                                                         Buffer.hash<Nat>(buffer, Hash.hash); => 2_872_640_342

indexOf<X>(element : X, buffer : Buffer<X>, equal : (X, X) -> Bool) : ?Nat - 
                        Retorna o índice do primeiro elemento do buffer que atender os critérios informados na função "equal".
                        A função "equal" retorna true/false. 
                        Exemplo:
                        import Nat "mo:base/Nat";
                        buffer.add(1);
                        buffer.add(2);
                        buffer.add(3);
                        buffer.add(4);
                        Buffer.indexOf<Nat>(3, buffer, Nat.equal); => ?2

lastIndexOf<X>(element : X, buffer : Buffer<X>, equal : (X, X) -> Bool) : ?Nat
                        Retorna o índice do ultimo elemento do buffer que atender os critérios informados na função "equal".
                        A função "equal" retorna true/false. 
                        Exemplo:
                        import Nat "mo:base/Nat";
                        buffer.add(1);
                        buffer.add(2);
                        buffer.add(3);
                        buffer.add(4);
                        buffer.add(2);
                        buffer.add(2);
                        Buffer.lastIndexOf<Nat>(2, buffer, Nat.equal); => ?5

indexOfBuffer<X>(subBuffer : Buffer<X>, buffer : Buffer<X>, equal : (X, X) -> Bool) : ?Nat
                             Pesquisa se o buffer passado como parametro em "subBuffer" existe 
                             no "buffer" (também passado como parametro). Se existir será retornado o índice inicial encontrado.
                             Exemplo:
                             import Nat "mo:base/Nat";
                             buffer.add(1);
                             buffer.add(2);
                             buffer.add(3);
                             buffer.add(4);
                             buffer.add(5);
                             buffer.add(6);

                            let sub = Buffer.Buffer<Nat>(2);
                            sub.add(4);
                            sub.add(5);
                            sub.add(6);

                            Buffer.indexOfBuffer<Nat>(sub, buffer, Nat.equal); => ?3

binarySearch<X>(element : X, buffer : Buffer<X>, compare : (X, X) -> Order.Order) : ?Nat
                             Esta função é semelhante a indexOf, porém é executada em tempo logarítmico. 
                             Ao executa-la assume-se que buffer está ordenado. Caso não estiver ordenado o seu comportamento
                             será indefinido. É utilizada a função "compare" passada como parametro para executar a pesquisa. 
                             Retorna o índice do elemento que for encontrado.
                             Exemplo:
                             import Nat "mo:base/Nat";
                             buffer.add(1);
                             buffer.add(4);
                             buffer.add(5);
                             buffer.add(6);
                             Buffer.binarySearch<Nat>(5, buffer, Nat.compare); // => ?2

subBuffer<X>(buffer : Buffer<X>, start : Nat, length : Nat) : Buffer<X>
                      Retorna um sub-buffer do buffer passado como parametro, para criar o subbuffer será utilizado o 
                      número "start" para indicar o indice inicial do "buffer" e "length" para indicar a quantidade de elementos
                      que serão copiados do buffer principal para o subbuffer. 
                      Exemplo:
                      import Nat "mo:base/Nat";
                      buffer.add(1);
                      buffer.add(2);
                      buffer.add(3);
                      buffer.add(4);
                      buffer.add(5);
                      buffer.add(6);
                      let sub = Buffer.subBuffer(buffer, 3, 2);
                      Buffer.toText(sub, Nat.toText); => [4, 5]

isSubBufferOf<X>(subBuffer : Buffer<X>, buffer : Buffer<X>, equal : (X, X) -> Bool) : Bool
                             Verifica se "subBuffer" é um sub-Buffer do "buffer". Utiliza a função "equal" para definir os 
                             critérios de comparação. O sub-buffer pode estar localizado em quando posição do "buffer". 
                                    Exemplo:
                                            import Nat "mo:base/Nat";
                                            buffer.add(1);
                                            buffer.add(2);
                                            buffer.add(3);
                                            buffer.add(4);
                                            buffer.add(5);
                                            buffer.add(6);

                                            let sub = Buffer.Buffer<Nat>(2);
                                            sub.add(2);
                                            sub.add(3);
                                            Buffer.isSubBufferOf(sub, buffer, Nat.equal); => true


isStrictSubBufferOf<X>(subBuffer : Buffer<X>, buffer : Buffer<X>, equal : (X, X) -> Bool) : Bool
                                   Esta função é semelhante a função isSubBufferOf, a diferença é que para localizar o 
                                   "subBuffer" não serão levados em consideração o primeiro e o ultimo índice do "buffer", 
                                   ou seja, não são considerados os índices dos elementos das extremidades.
                                   Exemplo: import Nat "mo:base/Nat";
                                            buffer.add(1);
                                            buffer.add(2);
                                            buffer.add(3);
                                            buffer.add(4);

                                            let sub = Buffer.Buffer<Nat>(2);
                                            sub.add(2);
                                            sub.add(3);
                                            Buffer.isStrictSubBufferOf(sub, buffer, Nat.equal); // => true

prefix<X>(buffer : Buffer<X>, length : Nat) : Buffer<X> - Retorna um Buffer com o tamanho igual ao informado no parametro "length", 
                                                          o buffer será criado levando em consideração os elementos do "buffer"
                                                          paassado como parametro, onde, serão considerados o índice 0 até
                                                          o indice correspondente a "length"-1. 
                                                          Exemplo:
                                                          import Nat "mo:base/Nat";
                                                          buffer.add(1);
                                                          buffer.add(2);
                                                          buffer.add(3);
                                                          buffer.add(4);
                                                          let pre = Buffer.prefix(buffer, 3); => [1, 2, 3]
                                                          
isPrefixOf<X>(prefix : Buffer<X>, buffer : Buffer<X>, equal : (X, X) -> Bool) : Bool
                                  Verifica se prefix é um prefixo de "buffer". Utiliza "equal" para comparar elementos.
                                  Exemplo:
                                  import Nat "mo:base/Nat";
                                  buffer.add(1);
                                  buffer.add(2);
                                  buffer.add(3);
                                  buffer.add(4);

                                  let pre = Buffer.Buffer<Nat>(2);
                                  pre.add(1);
                                  pre.add(2);
                                  Buffer.isPrefixOf(pre, buffer, Nat.equal); => true

isStrictPrefixOf<X>(prefix : Buffer<X>, buffer : Buffer<X>, equal : (X, X) -> Bool) : Bool
                             Verifica se prefix é um prefixo estrito de buffer. Utiliza "equal" para comparar elementos.
                             Exemplo: import Nat "mo:base/Nat";
                                      buffer.add(1);
                                      buffer.add(2);
                                      buffer.add(3);
                                      buffer.add(4);

                                      let pre = Buffer.Buffer<Nat>(3);
                                      pre.add(1);
                                      pre.add(2);
                                      pre.add(3);
                                      Buffer.isStrictPrefixOf(pre, buffer, Nat.equal); => true

suffix<X>(buffer : Buffer<X>, length : Nat) : Buffer<X> - Retorna um Buffer com o tamanho igual ao informado no parametro "length", 
                                                          o buffer será criado levando em consideração os elementos do "buffer"
                                                          passado como parametro, onde, serão considerados o ultimo índice do 
                                                          "buffer" até o indice correspondente a ultimo_indice_buffer - "length". 
                                                          Exemplo:
                                                          import Nat "mo:base/Nat";
                                                          buffer.add(1);
                                                          buffer.add(2);
                                                          buffer.add(3);
                                                          buffer.add(4);

                                                          let suf = Buffer.suffix(buffer, 3); => [2, 3, 4]
                                                          Buffer.toText(suf, Nat.toText);

isSuffixOf<X>(suffix : Buffer<X>, buffer : Buffer<X>, equal : (X, X) -> Bool) : Bool
                                  Verifica se "suffix" é um sufixo de "buffer". Utiliza "equal" para comparar elementos.
                                  Exemplo:  import Nat "mo:base/Nat";
                                            buffer.add(1);
                                            buffer.add(2);
                                            buffer.add(3);
                                            buffer.add(4);

                                            let suf = Buffer.Buffer<Nat>(3);
                                            suf.add(2);
                                            suf.add(3);
                                            suf.add(4);
                                            Buffer.isSuffixOf(suf, buffer, Nat.equal); => true

isStrictSuffixOf<X>(suffix : Buffer<X>, buffer : Buffer<X>, equal : (X, X) -> Bool) : Bool
                             Verifica se "suffix" é um sufixo estrito de buffer. Utiliza "equal" para comparar elementos.
                             Exemplo: import Nat "mo:base/Nat";
                                      buffer.add(1);
                                      buffer.add(2);
                                      buffer.add(3);
                                      buffer.add(4);

                                      let suf = Buffer.Buffer<Nat>(3);
                                      suf.add(2);
                                      suf.add(3);
                                      suf.add(4);
                                      Buffer.isStrictSuffixOf(suf, buffer, Nat.equal); => true

forAll<X>(buffer : Buffer<X>, predicate : X -> Bool) : Bool - Retorna verdadeiro se todos os elementos de "buffer"
                                                              satisfazem os critérios de "predicate".
                                                              Exemplo:
                                                              buffer.add(2);
                                                              buffer.add(3);
                                                              buffer.add(4);

                                                              Buffer.forAll<Nat>(buffer, func x { x > 1 }); // => true

forSome<X>(buffer : Buffer<X>, predicate : X -> Bool) : Bool - Retorna verdadeiro se algum elemento de "buffer" satisfaz 
                                                               os critérios de "predicate".
                                                               Exemplo:
                                                               buffer.add(2);
                                                               buffer.add(3);
                                                               buffer.add(4);

                                                               Buffer.forSome<Nat>(buffer, func x { x > 3 }); // => true

forNone<X>(buffer : Buffer<X>, predicate : X -> Bool) : Bool - Retorna verdadeiro se nenhu, elemento de "buffer" satisfaz 
                                                               os critérios de "predicate".
                                                               Exemplo:
                                                               buffer.add(2);
                                                               buffer.add(3);
                                                               buffer.add(4);

                                                               Buffer.forNone<Nat>(buffer, func x { x == 0 }); // => true

Buffer.toArray<X>(buffer : Buffer<X>) : [X] - Retorna um array contendo os elementos de buffer.
                                              Exemplo:
                                              buffer.add(1);
                                              buffer.add(2);
                                              buffer.add(3);
                                              Buffer.toArray<Nat>(buffer); => [1, 2, 3]

Buffer.toVarArray<X>(buffer : Buffer<X>) : [var X] - Retorna um array mutável contendo os elementos de buffer.
                                                     Exemplo:
                                                     buffer.add(1);
                                                     buffer.add(2);
                                                     buffer.add(3);
                                                     Buffer.toVarArray<Nat>(buffer); // => [1, 2, 3]

Buffer.fromArray<X>(array : [X]) : Buffer<X> - Retorna um buffer contendo elementos do array passado como parametro.
                                               Exemplo:
                                               import Nat "mo:base/Nat";
                                               let array = [2, 3];
                                               let buf = Buffer.fromArray<Nat>(array); // => [2, 3]
                                               
fromVarArray<X>(array : [var X]) : Buffer<X> - Retorna um buffer contendo elementos do array mutável passado como parametro.
                                               Exemplo:
                                               import Nat "mo:base/Nat";
                                               let array = [var 1, 2, 3];
                                               let buf = Buffer.fromVarArray<Nat>(array); => [1, 2, 3]                                               

fromIter<X>(iter : { next : () -> ?X }) : Buffer<X> - Retorna um buffer contendo elementos do Iter passado como paramerto.
                                                      Exemplo:
                                                      import Nat "mo:base/Nat";
                                                      let array = [1, 1, 1];
                                                      let iter = array.vals();

                                                      let buf = Buffer.fromIter<Nat>(iter); => [1, 1, 1]
                                                      
trimToSize<X>(buffer : Buffer<X>) - Redimenciona o buffer de modo que capacidade == tamanho.
                                    Exemplo:
                                    let buffer = Buffer.Buffer<Nat>(10);
                                    buffer.add(1);
                                    buffer.add(2);
                                    buffer.add(3);

                                    Buffer.trimToSize<Nat>(buffer);
                                    buffer.capacity(); => 3

map<X, Y>(buffer : Buffer<X>, f : X -> Y) : Buffer<Y> - Retorna um novo buffer aplicando "f" a cada elemento do buffer.
                                                        Exemplo:
                                                        import Nat "mo:base/Nat";
                                                        buffer.add(1);
                                                        buffer.add(2);
                                                        buffer.add(3);
                                                        let newBuf = Buffer.map<Nat, Nat>(buffer, func (x) { x + 1 });
                                                        Buffer.toText(newBuf, Nat.toText); => [2, 3, 4]

iterate<X>(buffer : Buffer<X>, f : X -> ()) - Aplica "f" para cada elemento do buffer. 
                                              O buffer original é alterado (caso houver alteração).
                                              Exemplo:
                                              import Nat "mo:base/Nat";
                                              import Debug "mo:base/Debug";

                                              buffer.add(1);
                                              buffer.add(2);
                                              buffer.add(3);

                                              Buffer.iterate<Nat>(buffer, func (x) {
                                                                                      Debug.print(Nat.toText(x)); 
                                                                                    });

mapEntries<X, Y>(buffer : Buffer<X>, f : (Nat, X) -> Y) : Buffer<Y>  
                          Aplica-se "f" para cada elemento do buffer. Para percorrer a lista será utilizado o índice do buffer
                          O buffer original é alterado (caso houver alteração).
                          Exemplo:
                          import Nat "mo:base/Nat";
                          buffer.add(1);
                          buffer.add(2);
                          buffer.add(3);

                          let newBuf = Buffer.mapEntries<Nat, Nat>(buffer, func (x, i) { x + i + 1 });
                          Buffer.toText(newBuf, Nat.toText); => [2, 4, 6]


mapFilter<X, Y>(buffer : Buffer<X>, f : X -> ?Y) : Buffer<Y> 
                         Retorna um novo buffer aplicando "f" em cada elemento do "buffer" e mantendo todos os elementos não nulos.
                         Exemplo:
                         import Nat "mo:base/Nat";
                         buffer.add(1);
                         buffer.add(2);
                         buffer.add(3);
 
                         let newBuf = Buffer.mapFilter<Nat, Nat>(buffer, func (x) {
                           if (x > 1) {
                             ?(x * 2);
                           } else {
                             null;
                           }
                         });
                         Buffer.toText(newBuf, Nat.toText); => [4, 6]

mapResult<X, Y, E>(buffer : Buffer<X>, f : X -> Result.Result<Y, E>) : Result.Result<Buffer<Y>, E>
                            Retorna um novo buffer aplicando "f" em cada elemento do "buffer". 
                            Se qualquer invocação de "f" produzir um #err, retorna o #err. 
                            Caso contrário, retorna um #ok contendo o novo buffer.
                            Exemplo:
                            import Result "mo:base/Result";
                            buffer.add(1);
                            buffer.add(2);
                            buffer.add(3);

                            let result = Buffer.mapResult<Nat, Nat, Text>(buffer, func (k) {
                              if (k > 0) {
                                #ok(k);
                              } else {
                                #err("One or more elements are zero.");
                              }
                            });

                            Result.mapOk<Buffer.Buffer<Nat>, [Nat], Text>(result, func buffer = Buffer.toArray(buffer)) 
                            => Resultado  #ok([1, 2, 3])

chain<X, Y>(buffer : Buffer<X>, k : X -> Buffer<Y>) : Buffer<Y>
                                Retorna um novo buffer aplicando "k" em cada elemento do buffer, Será concatenado os buffers 
                                resultantes em ordem. Esta operação é similar ao que em outras linguagens funcionais
                                é conhecido como monadic bind.
                                Exemplo:
                                import Nat "mo:base/Nat";
                                buffer.add(1);
                                buffer.add(2);
                                buffer.add(3);

                                let chain = Buffer.chain<Nat, Nat>(buffer, func (x) {
                                  let b = Buffer.Buffer<Nat>(2);
                                  b.add(x);
                                  b.add(x * 2);
                                  return b;
                                });
                                Buffer.toText(chain, Nat.toText); => [1, 2, 2, 4, 3, 6]

foldLeft<A, X>(buffer : Buffer<X>, base : A, combine : (A, X) -> A) : A
                        Consolida os elementos do "buffer" em um único valor.
                        A iteração é executada da esquerda para a direita.
                        Exemplo:
                        import Nat "mo:base/Nat";
                        buffer.add(1);
                        buffer.add(2);
                        buffer.add(3);
                        Buffer.foldLeft<Text, Nat>(buffer, "", func (acc, x) { acc # Nat.toText(x)}); => "123"


foldRight<X, A>(buffer : Buffer<X>, base : A, combine : (X, A) -> A) : A
                Consolida os elementos de um Buffer em um valor começando com a "base" e  executando a função 
                "combine" progressivamente. A iteração é executada da direira para a esquerda.
                Exemplo:
                import Nat "mo:base/Nat";
                buffer.add(1);
                buffer.add(2);
                buffer.add(3);

                Buffer.foldRight<Nat, Text>(buffer, "", func (x, acc) { Nat.toText(x) # acc }); // => "123"

first<X>(buffer : Buffer<X>) : X - Retorna o primeiro elemento do "buffer". 
                                   Exemplo: buffer.add(1);
                                            buffer.add(2);
                                            buffer.add(3);
                                            Buffer.first(buffer); => 1

last<X>(buffer : Buffer<X>) : X - Retorna o último elemento do "buffer". 
                                  Exemplo:
                                  buffer.add(1);
                                  buffer.add(2);
                                  buffer.add(3);
                                  Buffer.last(buffer); => 3

make<X>(element : X) : Buffer<X> - Retorna um novo buffer com capacidade e tamanho 1, contendo apenas 1 elemento.
                                   Exemplo:
                                   import Nat "mo:base/Nat";
                                   let buffer = Buffer.make<Nat>(1);
                                   Buffer.toText(buffer, Nat.toText); => [1]

reverse<X>(buffer : Buffer<X>) = Inverte a ordem dos elementos do buffer.
                                 Exemplo:
                                 import Nat "mo:base/Nat";
                                 buffer.add(1);
                                 buffer.add(2);
                                 buffer.add(3);

                                 Buffer.reverse(buffer);
                                 Buffer.toText(buffer, Nat.toText); // => [3, 2, 1]

merge<X>(buffer1 : Buffer<X>, buffer2 : Buffer<X>, compare : (X, X) -> Order) : Buffer<X>
                              Mescla dois Buffers em um único Buffer ordenado. O Buffer retornado será 
                              ordenado de acordo com o critério informado na função "compare".                     
                              Exemplo: import Nat "mo:base/Nat";
                                       let buffer1 = Buffer.Buffer<Nat>(2);
                                       buffer1.add(1);
                                       buffer1.add(2);
                                       buffer1.add(4);

                                       let buffer2 = Buffer.Buffer<Nat>(2);
                                       buffer2.add(2);
                                       buffer2.add(4);
                                       buffer2.add(6);

                                      let merged = Buffer.merge<Nat>(buffer1, buffer2, Nat.compare);
                                      Buffer.toText(merged, Nat.toText); => [1, 2, 2, 4, 4, 6]

removeDuplicates<X>(buffer : Buffer<X>, compare : (X, X) -> Order)
                             Elimina todos os elementos duplicados do "buffer". Psra definir os elementos duplicados
                             é utilizada a função "compare".
                            Exemplo: import Nat "mo:base/Nat";
                                     buffer.add(1);
                                     buffer.add(2);
                                     buffer.add(3);
                                     buffer.add(1);
                                     buffer.add(2);
                                     buffer.add(3);

                                     Buffer.removeDuplicates<Nat>(buffer, Nat.compare);
                                     Buffer.toText(buffer, Nat.toText); => [1, 2, 3]

partition<X>(buffer : Buffer<X>, predicate : X -> Bool) : (Buffer<X>, Buffer<X>)
                      Divide o buffer em um par de buffers onde todos os elementos no buffer esquerdo são satisfeitos 
                      pelo "predicate" e todos os elementos no buffer direito não.
                      Cria dois novos Buffers a partir dos resultados da função "predicate" informada. 
                      O primeiro Buffer inclui apenas os elementos que retornaram true no resultado da função "predicate",
                      enquanto o segundo Buffer inclui apenas os elementos que retornaram false no resultado da função "predicate".
                      Exemplo:
                      import Nat "mo:base/Nat";
                      buffer.add(1);
                      buffer.add(2);
                      buffer.add(3);
                      buffer.add(4);
                      buffer.add(5);
                      buffer.add(6);

                      let partitions = Buffer.partition<Nat>(buffer, func (x) { x % 2 == 0 });
                      (Buffer.toArray(partitions.0), Buffer.toArray(partitions.1)) => ([2, 4, 6], [1, 3, 5])

split<X>(buffer : Buffer<X>, index : Nat) : (Buffer<X>, Buffer<X>)
                  Divide o Buffer passado como parametro em dois Buffers. Para dividir o Buffer é utilizado o índice 
                  passado em "index". Buffer esquerdo contém todos os elementos com índices menores que "index", 
                  e o buffer direito contém todos os elementos com índices maiores que ou iguais a "index". 
                  Exemplo:
                  import Nat "mo:base/Nat";
                  buffer.add(1);
                  buffer.add(2);
                  buffer.add(3);
                  buffer.add(4);
                  buffer.add(5);
                  buffer.add(6);

                  let split = Buffer.split<Nat>(buffer, 3);
                  (Buffer.toArray(split.0), Buffer.toArray(split.1)) // => ([1, 2, 3], [4, 5, 6])

chunk<X>(buffer : Buffer<X>, size : Nat) : Buffer<Buffer<X>> 
                  Divide o Buffer em vários Buffers com o comprimeto informado em "size". 
                  Exemplo:
                    import Nat "mo:base/Nat";
                    buffer.add(1);
                    buffer.add(2);
                    buffer.add(3);
                    buffer.add(4);
                    buffer.add(5);
                    buffer.add(6);

                    let chunks = Buffer.chunk<Nat>(buffer, 3);
                    Buffer.toText<Buffer.Buffer<Nat>>(chunks, func buf = Buffer.toText(buf, Nat.toText)); => [[1, 2, 3], [4, 5, 6]]

groupBy<X>(buffer : Buffer<X>, equal : (X, X) -> Bool) : Buffer<Buffer<X>>
                    Agrupa os elementos iguais e adjacentes do Buffer em sublistas.
                    Exemplo:
                    import Nat "mo:base/Nat";
                    buffer.add(1);
                    buffer.add(2);
                    buffer.add(2);
                    buffer.add(4);
                    buffer.add(5);
                    buffer.add(5);
                    let grouped = Buffer.groupBy<Nat>(buffer, func (x, y) { x == y });
                    Buffer.toText<Buffer.Buffer<Nat>>(grouped, func buf = Buffer.toText(buf, Nat.toText)); 
                    => Resultado [[1], [2, 2], [4], [5, 5]]

flatten<X>(buffer : Buffer<Buffer<X>>) : Buffer<X> - Concatena um Buffer de Buffer em apenas um Buffer.
                                                     Exemplo:
                                                     import Nat "mo:base/Nat";
                                                     let buffer = Buffer.Buffer<Buffer.Buffer<Nat>>(1);

                                                     let inner1 = Buffer.Buffer<Nat>(2);
                                                     inner1.add(1);
                                                     inner1.add(2);

                                                     let inner2 = Buffer.Buffer<Nat>(2);
                                                     inner2.add(3);
                                                     inner2.add(4);

                                                     buffer.add(inner1);
                                                     buffer.add(inner2);
                                                     // buffer = [[1, 2], [3, 4]]

                                                     let flat = Buffer.flatten<Nat>(buffer);
                                                     Buffer.toText<Nat>(flat, Nat.toText); // => [1, 2, 3, 4]

zip<X, Y>(buffer1 : Buffer<X>, buffer2 : Buffer<Y>) : Buffer<(X, Y)>
                    Combina dois buffers em um único buffer de pares, pareando elementos com o mesmo índice. 
                    Se um buffer for maior que o outro, os elementos restantes do buffer maior não serão incluídos.
                    Exemplo:
                    let buffer1 = Buffer.Buffer<Nat>(2);
                    buffer1.add(1);
                    buffer1.add(2);
                    buffer1.add(3);

                    let buffer2 = Buffer.Buffer<Nat>(2);
                    buffer2.add(4);
                    buffer2.add(5);

                    let zipped = Buffer.zip(buffer1, buffer2);
                    Buffer.toArray(zipped); // => [(1, 4), (2, 5)]

zipWith<X, Y, Z>(buffer1 : Buffer<X>, buffer2 : Buffer<Y>, zip : (X, Y) -> Z) : Buffer<Z>
                           Combina dois buffers em um único buffer, pareando elementos com o mesmo índice e 
                           combinando-os usando a função "zip". Se um buffer for maior que o outro, os elementos 
                           restantes do buffer maior não serão incluídos.
                           Exemplo:
                           let buffer1 = Buffer.Buffer<Nat>(2);
                           buffer1.add(1);
                           buffer1.add(2);
                           buffer1.add(3);

                           let buffer2 = Buffer.Buffer<Nat>(2);
                           buffer2.add(4);
                           buffer2.add(5);
                           buffer2.add(6);

                           let zipped = Buffer.zipWith<Nat, Nat, Nat>(buffer1, buffer2, func (x, y) { x + y });
                           Buffer.toArray(zipped) => [5, 7, 9]

takeWhile<X>(buffer : Buffer<X>, predicate : X -> Bool) : Buffer<X>
                                 Retorna um novo buffer incluindo os elementos na ordem do "buffer" passado como parametro, 
                                 até que o "predicado" retorne falso.
                                 Exemplo:
                                 import Nat "mo:base/Nat";
                                 buffer.add(1);
                                 buffer.add(2);
                                 buffer.add(3);

                                 let newBuf = Buffer.takeWhile<Nat>(buffer, func (x) { x < 3 });
                                 Buffer.toText(newBuf, Nat.toText); // => [1, 2]

dropWhile<X>(buffer : Buffer<X>, predicate : X -> Bool) : Buffer<X>
                      Retorna um novo buffer removendo os elementos na ordem de "buffer" passado como parametro,
                      até que o predicado retorne falso.
                      Exemplo:
                      import Nat "mo:base/Nat";
                      buffer.add(1);
                      buffer.add(2);
                      buffer.add(3);

                      let newBuf = Buffer.dropWhile<Nat>(buffer, func x { x < 3 }); // => [3]
                      Buffer.toText(newBuf, Nat.toText);

#################### FIM DO BUFFER
*/

/* Rercort permite definir uma estrutura que irá armazenar dados seguindo um padrão pré-definido. 
   Record são estruturas que você pode utilizar para padronizar os dados que serão armazenados. 
  Estes dados podem ser incluidos em array, list, hashmap etc. */

  type Pessoa = {
    nome : Text;
    email : Text;
    cidade : Text;
    uf : Text;
  };


/*
   Hashmap é uma estrutura de dados que permite armazenar pares de chave-valor. 
 
   As principais características dos Hashmap são:
        - O Hashmap armazena dados em pares de chave-valor, onde cada chave é única e está associada a um valor.
          Exemplo: ("Maria", "(41)99999-9999") onde "Maria" será a chave e "(41)99999-9999" será o valor.
        - O HashMap pode crescer/aumentar dinamicamente à medida que novos elementos são adicionados.
        - Oferece acesso rápido aos valores através de suas chaves.
        
Necessário o seguinte import:

   import HashMap "mo:base/HashMap";

*/

/*Haspmap não pode ser serializado devido sua estrutura complexa, devido a isso ele não pode ser utilizado
  como stable. Caso utilizar Hashmap o qual deverá guardar dados entre versões diferentes do sistema é 
  necessário criar mecanimos para pre e pos atualização do Canister, onde poderá utilizar um array 
  para guardar provisoriamente os dados
*/
  let mapA = HashMap.HashMap<Text, Nat>(5, Text.equal, Text.hash);
  var mapB = HashMap.HashMap<Text, Pessoa>(5, Text.equal, Text.hash);
  
  /* Para retornar os dados para o Frontend é necessário converter o Hashmap para array pois um Hashmap 
     não é possivel serializar */
  public func put_hashmap(chave: Text, numero: Nat) : async [(Text, Nat)] {
    mapA.put(chave, numero);
    return Iter.toArray(mapA.entries());
  };

  public func put_record_hashmap(nome: Text, email: Text, cidade: Text, uf: Text) : async [(Text, Pessoa)] {

    let pessoa : Pessoa = {nome = nome; email = email; cidade = cidade; uf = uf};
    mapB.put(nome, pessoa);
    return Iter.toArray(mapB.entries());

  };

  public func remove_record_hashmap(nome: Text) : async [(Text, Pessoa)] {
    let pessoaRemovida = mapB.remove(nome);    
    return Iter.toArray(mapB.entries());
  };

  public func replace_record_hashmap(nome: Text, email: Text, cidade: Text, uf: Text) : async [(Text, Pessoa)] {
    
    let pessoa : Pessoa = {nome = nome; email = email; cidade = cidade; uf = uf};
    let pessoaAlterada = mapB.replace(nome, pessoa);
    return Iter.toArray(mapB.entries());
  };
  
  public func keys_hashmap() : async [Text] {        
    let iter : Iter.Iter<Text> = mapB.keys();    
    return Iter.toArray<Text>(iter);
  };


/*
size() : Nat - Retorna o número de (chave/valor) incluidas no Hashmap. Example: map.size() => 0 

get(key : K) : (value : ?V) - Retorna o valor associado a chave informada em "K".
                              Exemplo:
                              map.put("key", 3);
                              map.get("key") // => ?3

put(key : K, value : V) - Incluir no Hashmap um item com a "key" e "value" informados. Caso já existir um item com a "key"
                          informada, ele é sobrescrito.
                          Exemplo:
                          map.put("key", 3);
                          map.get("key") // => ?3

replace(key : K, value : V) : (oldValue : ?V) - Sobreescreve o item do Hashmap que possui uma chave igual a passada em "k",
                                                ao sobre escrever é retornado o valor correspondente a chave antes de ser alterado.
                                                Se não existir nenhuma chave com a "key" informada, será feita a primeira alocação
                                                para a "key" e "value" informados.
                                                Examplo:
                                                map.put("key", 3);
                                                ignore map.replace("key", 2); => ?3
                                                map.get("key") => ?2

delete(key : K) - Remove do Hashmap o item/entrada correspondente a chave informada em "key".
                  Exemplo:
                  map.put("key", 3);
                  map.delete("key");
                  map.get("key"); // => null

remove(key : K) : (oldValue : ?V) - Remove do Hashmap o item/entrada correspondente a chave informada em "key".
                                    Antes de remover o item o valor que será removido é retornado.
                                    Example:
                                    map.put("key", 3);
                                    map.remove("key"); => ?3

keys() : Iter.Iter<K> - Retorna um iterator (Iter) com as chaves do Hashmap. O iterator possui apenas uma função 
                        chamada next(), esta função é utilizada para percorrer as chaves do Hashmap. 
                        As chaves são retornadas sem uma ordem especifica.
                        Exemplo:
                        map.put("key1", 1);
                        map.put("key2", 2);
                        map.put("key3", 3);

                        var keys = "";
                        for (key in map.keys()) {
                          keys := key # " " # keys
                        };
                        keys => "key3 key2 key1 "

vals() : Iter.Iter<V> - Retorna um iterator (Iter) com os valores do Hashmap. O iterator possui apenas uma função 
                        chamada next(), esta função é utilizada para percorrer os valores do Hashmap. 
                        Os valores são retornados sem uma ordem especifica.
                        Exemplo:
                        map.put("key1", 1);
                        map.put("key2", 2);
                        map.put("key3", 3);

                        var sum = 0;
                        for (value in map.vals()) {
                          sum += value;
                        };
                        sum => 6

entries() : Iter.Iter<(K, V)> - Retorna um iterator (Iter) com os pares chave/valor do Hashmap. O iterator possui apenas uma função 
                                chamada next(), esta função é utilizada para percorrer os pares do Hashmap. 
                                Os pares são retornados sem uma ordem especifica.
                                Exemplo:
                                import Nat "mo:base/Nat";
                                map.put("key1", 1);
                                map.put("key2", 2);
                                map.put("key3", 3);

                                var pairs = "";
                                for ((key, value) in map.entries()) {
                                  pairs := "(" # key # ", " # Nat.toText(value) # ") " # pairs
                                };
                                pairs => "(key3, 3) (key2, 2) (key1, 1)"

clone<K, V>(map : HashMap<K, V>, keyEq : (K, K) -> Bool, keyHash : K -> Hash.Hash) : HashMap<K, V>
                                 Retorna uma cópia do HashMap, a função "KeyEq" pode ser utilizada para determinar
                                 quais chaves serão incluidas no clone.                                 
                                 Exemplo: map.put("key1", 1);
                                          map.put("key2", 2);
                                          map.put("key3", 3);

                                          let map2 = HashMap.clone(map, Text.equal, Text.hash);
                                          map2.get("key1") => ?1

fromIter<K, V>(iter : Iter.Iter<(K, V)>, initCapacity : Nat, keyEq : (K, K) -> Bool, keyHash : K -> Hash.Hash) : HashMap<K, V>
                                         Retorna um Hashmap contendo todos os registros do Iter passado como parametro.
                                         Exemplo:
                                         let entries = [("key3", 3), ("key2", 2), ("key1", 1)];
                                         let iter = entries.vals();

                                         let map2 = HashMap.fromIter<Text, Nat>(iter, entries.size(), Text.equal, Text.hash);
                                         map2.get("key1") // => ?1

map<K, V1, V2>(hashMap : HashMap<K, V1>, keyEq : (K, K) -> Bool, keyHash : K -> Hash.Hash, f : (K, V1) -> V2) : HashMap<K, V2>
                                         Retorna um novo Hashmap com o resultado da função "keyEq" que é aplicada 
                                         em cada par (chave/valor) do Hashmap passado como parametro.
                                         Exemplo:                                         
                                         map.put("key1", 1);
                                         map.put("key2", 2);
                                         map.put("key3", 3);

                                         let map2 = HashMap.map<Text, Nat, Nat>(map, Text.equal, Text.hash, func (k, v) = v * 2);
                                         map2.get("key2") => ?4

mapFilter<K, V1, V2>(hashMap : HashMap<K, V1>, keyEq : (K, K) -> Bool, keyHash : K -> Hash.Hash, f : (K, V1) -> ?V2) : HashMap<K, V2>
                    Retorna um novo Hashmap onde será aplicada a função "keyEq" passada como parametro em cada par (chave/valor),
                    o valor que será adicionado ao novo Hashmap corresponde ao resultado do processamento desta função 
                    (poderá transformar um valor diferente do valor original). 
                    Exemplo:  map.put("key1", 1);
                              map.put("key2", 2);
                              map.put("key3", 3);

                              let map2 =
                                HashMap.mapFilter<Text, Nat, Nat>(
                                  map,
                                  Text.equal,
                                  Text.hash,
                                  func (k, v) = if (v == 2) { null } else { ?(v * 2)}
                              );
                              map2.get("key3") => ?6

######## FIM DO HASMAP
*/

/*
   RBTree é uma estrutura de dados eficiente para armazenar pares de chave-valor, implementada como uma 
   árvore binária (Red-Black Tree).
 
   As principais características dos RBTree são:
        - O RBTree armazena dados em pares de chave-valor, onde cada chave é única e está associada a um valor.
          Exemplo: ("Maria", "(41)99999-9999") onde "Maria" será a chave e "(41)99999-9999" será o valor.
        - Ao armazenar o par o RBTree organiza as chaves para melhor eficiencia na busca. Quando um RBTree
          é criado é necessário fornecer uma função que será utilizada para comparação de chaves. Desta
          forma ele é ordenado quando um item é inserido.          
        - O RBTree pode crescer/aumentar dinamicamente à medida que novos elementos são adicionados.
        - Oferece operações eficientes de inserção, remoção e busca.
        
Necessário o seguinte import:

   import RBTree "mo:base/RBTree";

*/

let tree = RBTree.RBTree<Nat, Text>(Nat.compare); 

//RBTree não é serealizavel, devido a isso é convertido em Array antes de ser retornado para o frontend.
public func put_rbtree(chave: Nat, texto: Text) : async [(Nat, Text)] {
  tree.put(chave, texto);
  return Iter.toArray(tree.entries());
};

public func replace_rbtree(chave: Nat, texto: Text) : async [(Nat, Text)] {
  let valor_antigo = tree.replace(chave, texto);
  return Iter.toArray(tree.entries());
};

public func remove_rbtree(chave: Nat) : async [(Nat, Text)] {
  let item_removido = tree.remove(chave);
  return Iter.toArray(tree.entries());
};

public query func get_rbtree() : async [(Nat, Text)] {
    Iter.toArray(tree.entries())
};

/*
Exemplo:

import RBTree "mo:base/RBTree";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";

let tree = RBTree.RBTree<Nat, Text>(Nat.compare); - Cria um novo red-black tree onde as chaves e valores respectivamente serão
                                                  Nat e Text. Exemplo:
                                                  tree.put(1, "one");
                                                  tree.put(2, "two");
                                                  tree.put(3, "tree");
                                                  for (entry in tree.entries()) {
                                                    Debug.print("Entry key=" # debug_show(entry.0) # " value=\"" # entry.1 #"\"");
                                                  }

O núcleo desta implementação é derivado de:
RedBlackMap.sml de Ken Friis Larsen , que por sua vez é baseado em:
Stefan Kahrs, "Árvores rubro-negras com tipos", Journal of Functional Programming, 11(4): 425-432 (2001), versão 1 no apêndice da web .
Color
type Color = {#R; #B}

Cor do nó: Vermelho ( #R) ou preto ( #B).

Tree
type Tree<K, V> = {#node : (Color, Tree<K, V>, (K, ?V), Tree<K, V>); #leaf}

Árvore vermelha e preta de nós com entradas de chave-valor, ordenadas pelas chaves. As chaves têm o tipo genérico Ke os valores o tipo genérico V. As folhas são consideradas implicitamente pretas.

RBTree<K, V>
class RBTree<K, V>(compare : (K, K) -> O.Order)

Um mapa de chaves de tipo Kpara valores de tipo V implementado como uma árvore rubro-negra. As entradas de pares chave-valor são ordenadas por comparefunção aplicada às chaves.

A classe permite uso imperativo em estilo orientado a objetos. No entanto, internamente, a classe usa uma implementação funcional.

A comparefunção deve implementar uma ordem total consistente entre todos os valores possíveis de Ke para eficiência, envolve apenas O(1)custos de tempo de execução sem alocação de espaço.

Exemplo:


import RBTree "mo:base/RBTree";
import Nat "mo:base/Nat";

let tree = RBTree.RBTree<Nat, Text>(Nat.compare); // Criar um map com chave Nat e valor Text utilizando Nat.compare para ordenar

share() : Tree<K, V> - Retorna um snapshot da representação da árvore. A representação da árvore retornada não é afetada por 
                       alterações subsequentes da RBTree. É útil para armazenar o estado de um objeto de árvore como uma variável estável, 
                       determinar seu tamanho, imprimi-lo de forma bonita e compartilhá-lo entre chamadas de funções assíncronas, ou seja, 
                       passá-lo em argumentos assíncronos ou resultados assíncronos.
                       Exemplo:
                       tree.put(1, "one");
                       let treeSnapshot = tree.share();
                       tree.put(2, "second");
                       RBTree.size(treeSnapshot) // => 1 (Only the first insertion is part of the snapshot.)

unshare(t : Tree<K, V>) : () - Redefine o estado atual do objeto de árvore a partir de um snapshot obtido anteriormente.
                               Exemplo:
                               import Iter "mo:base/Iter";
                               tree.put(1, "one");
                               let snapshot = tree.share(); // save the current state of the tree object in a snapshot
                               tree.put(2, "two");
                               tree.unshare(snapshot); // restore the tree object from the snapshot
                               Iter.toArray(tree.entries()) // => [(1, "one")]

get(key : K) : ?V - Recupera o valor correspondente a chave informada em "key".
                    Exemplo:
                    tree.put(1, "one");
                    tree.put(2, "two");
                    tree.get(1) => ?"one"

replace(key : K, value : V) : ?V - Sobreescreve o item que possui uma chave igual a passada em "key",
                                                ao sobreescrever é retornado o valor correspondente a chave antes de ser alterado.
                                                Se não existir nenhuma chave com a "key" informada, será feita a primeira alocação
                                                para a "key" e "value" informados.
                                                Exemplo:
                                                import Iter "mo:base/Iter";
                                                tree.put(1, "old one");
                                                tree.put(2, "two");

                                                ignore tree.replace(1, "new one");
                                                Iter.toArray(tree.entries()) // => [(1, "new one"), (2, "two")]

put(key : K, value : V) - Insire uma nova entrada na árvore com a chave e valor informados em "key" e "value")". 
                          Se a chave já existir, será sobreescrito o valor associado.
                          Exemplo:
                          import Iter "mo:base/Iter";
                          tree.put(1, "one");
                          tree.put(2, "two");
                          tree.put(3, "three");
                          Iter.toArray(tree.entries()) => [(1,"one"),(2,"two"),(3,"three")]

delete(key : K) - Exclui a entrada associada a chave informada em "key".
                  Exemplo:
                  import Iter "mo:base/Iter";
                  tree.put(1, "one");
                  tree.put(2, "two");

                  tree.delete(1);
                  Iter.toArray(tree.entries()) // => [(2, "two")].

remove(key : K) : ?V - Remove a entrada associada a chave informada em "key", antes de remover retorna o valor associado. 
                       Exemplo:
                       import Iter "mo:base/Iter";
                       tree.put(1, "one");
                       tree.put(2, "two");

                       ignore tree.remove(1);
                       Iter.toArray(tree.entries()) // => [(2, "two")].

entries() : I.Iter<(K, V)> - Retorna um iterador (Iter) para todas as entradas chave/valor, em ordem crescente de chave. 
                             Exemplo: import Debug "mo:base/Debug";
                                      tree.put(1, "one");
                                      tree.put(2, "two");
                                      tree.put(3, "two");
                                      for (entry in tree.entries()) {
                                        Debug.print("Entry key=" # debug_show(entry.0) # " value=\"" # entry.1 #"\"");
                                      }
                                      // Entry key=1 value="one"
                                      // Entry key=2 value="two"
                                      // Entry key=3 value="three"

entriesRev() : I.Iter<(K, V)> - Retorna um iterador (Iter) para todas as entradas chave/valor, em ordem decrescente de chave. 
                                Exemplo: import Debug "mo:base/Debug";
                                         let tree = RBTree.RBTree<Nat, Text>(Nat.compare);
                                         tree.put(1, "one");
                                         tree.put(2, "two");
                                         tree.put(3, "two");

                                         for (entry in tree.entriesRev()) {
                                           Debug.print("Entry key=" # debug_show(entry.0) # " value=\"" # entry.1 #"\"");
                                         }

                                         // Entry key=3 value="three"
                                         // Entry key=2 value="two"
                                         // Entry key=1 value="one"

iter<X, Y>(tree : Tree<X, Y>, direction : {#fwd; #bwd}) : I.Iter<(X, Y)>
                  Retorna um iterador para os pares (chave/valor), em ordem crescente ( #fwd) ou decrescente ( #bwd) 
                  conforme especificado no parametro "direction".
                  Exemplo:
                  import RBTree "mo:base/RBTree";
                  import Nat "mo:base/Nat";
                  import Debug "mo:base/Debug";

                  let tree = RBTree.RBTree<Nat, Text>(Nat.compare);
                  tree.put(1, "one");
                  tree.put(2, "two");
                  tree.put(3, "two");

                  for (entry in RBTree.iter(tree.share(), #bwd)) { // backward iteration
                    Debug.print("Entry key=" # debug_show(entry.0) # " value=\"" # entry.1 #"\"");
                  }

                  // Entry key=3 value="three"
                  // Entry key=2 value="two"
                  // Entry key=1 value="one"

size<X, Y>(t : Tree<X, Y>) : Nat - Retorna o tamanho da árvore. Exemplo:
                                                                import RBTree "mo:base/RBTree";
                                                                import Nat "mo:base/Nat";

                                                                let tree = RBTree.RBTree<Nat, Text>(Nat.compare);
                                                                tree.put(1, "one");
                                                                tree.put(2, "two");
                                                                tree.put(3, "three");

                                                                RBTree.size(tree.share()) // 3 entries

  */

////How to Test in Terminal: dfx canister call loops for_loop '(vec{"apple";"banana";"cucumber"})' 

  //##########################################################################################################################//

  // Exemplos de utilização de tipos primitivos

   var b : Bool = false;  
  
  // Função toText() transforma valor booleano em texto
  public func converteBooleanText() : async Text {
      return Bool.toText(b);
  };
  
  /* Funções de operações logicas:
     
     A função Bool.logand(a, b) retorna true apenas se ambos os operandos a e b forem true.
     É equivalente ao operador && na maioria das linguagens, mas é expresso como uma função de biblioteca.
     Irá funcionar como uma Tabela Verdade AND:
     
     | a	  | b	    | Bool.logand(a, b)|
     ----------------------------------|
     | true	| true	| true             |
     | true	| false	| false            |
     | false|	true	| false            |
     | false|	false	| false            |

  */
  public func tabelaVerdade(a: Bool, b: Bool) : async Bool {
    return Bool.logand(a,b);
  };

  /* Demais funções logicas de Bool:
     logor(x : Bool, y : Bool) : Bool - mesmo comportamento que logand porém utilizando OR
     logxor(x : Bool, y : Bool) : Bool - mesmo comportamento que logand porém utilizando XOR
     lognot(x : Bool) : Bool  - mesmo comportamento que logand porém utilizando NOT
  */

  /* Funções de comparação:
     equal(x : Bool, y : Bool) : Bool
     notEqual(x : Bool, y : Bool) : Bool
     compare(x : Bool, y : Bool) : {#less; #equal; #greater}
  */

  var i : Int = 1; 
  
  //A função Int.abs(n) irá retornar o valor absoluto do parametro informado, ou seja, mesmo passando um valor negativo ele será convertido para positivo
  public func retornaValorAbsInt() : async Int {
      let n : Int = -5;
      return Int.abs(n);
      //O valor de retorno será 5
  };

  /*A função Int.neg(n) irá retornar a negação do valor passado como parametro, por exemplo, se passar o valor 3 será retornado o valor -3, 
    se passar o valor -2 será retornado o valor 2 */
  public func retornaValorNegInt() : async Int {
      let n : Int = 3;
      return Int.neg(n);
      //O valor de retorno será -3
  };

  /*A função Int.mul(n1,n2) irá multiplicar dois valores passados por parametro levando em consideração o sinal*/
  public func multiplicaValorInt(n1: Int, n2: Int) : async Int {
    return Int.mul(n1,n2);
  };

  /*A função Int.div(n1,n2) irá dividir dois valores passados por parametro, será retornado apenas a parte inteira da divisão (trunca os decimais). 
    Deve-se tratar divisão por zero pois pode ocorrer "trap" */
  public func divideValorInt(n1: Int, n2: Int) : async Int {
    return Int.div(n1,n2);
  };

  /*A função Int.rem(n1,n2) irá retornar o resto da divisão dos dois valores passados por parametro. Deve-se tratar divisão por zero pois pode ocorrer "trap" */
  public func restoDivisaoValorInt(n1: Int, n2: Int) : async Int {
    return Int.rem(n1,n2); // Exemplo: (6, -4); // => 2
  };

   /* Demais funções númericas do Int:
      add(x : Int, y : Int) : Int  - Retorna a soma de x e y, x + y. Exemplo: Int.add(1, 2); => 3
      sub(x : Int, y : Int) : Int  - Retorna a diferença de x e y, x - y. Exemplo: Int.sub(1, 2); => -1
      pow(x : Int, y : Int) : Int  - Retorna x à potência de y, x ** y. Exemplo: Int.pow(-2, 3); => -8
   */

   /* Funções de comparação do Int:
      min(x : Int, y : Int) : Int        - Retorna o menor valor de x e y. Exemplo Int.min(2, -3) => -3
      max(x : Int, y : Int) : Int        - Retorna o maior valor de x e y. Exemplo: Int.max(2, -3) => 2
      hash(i : Int) : Hash.Hash          - Calcula um hash dos 32 bits menos significativos de i, ignorando outros bits
      hashAcc(h1 : Hash.Hash, i : Int) : Hash.Hash  - Calcula um hash acumulado de h1 e os 32 bits menos significativos de i, ignorando outros bits em i
      equal(x : Int, y : Int) : Bool     - Esta função compara dois tipos Int. Isso é equivalente a x == y. Exemplo: Int.equal(-1, -1); => true
      notEqual(x : Int, y : Int) : Bool  - Esta função verifica se os dois tipos de Int são diferentes. Isso é equivalente a x != y. Exemplo: Int.notEqual(-1, -2); => true
      less(x : Int, y : Int) : Bool      - Retorna true se x for menor que y. Isso é equivalente a x < y. Exemplo: Int.less(-2, 1); => true
      lessOrEqual(x : Int, y : Int) : Bool - Retorna true se x for "menor que ou igual" a y. Isso é equivalente a x <= y. Exemplo: Int.lessOrEqual(-2, 1); => true
      greater(x : Int, y : Int) : Bool  - Retorna true se x for "maior que" y. Isso é equivalente a x > y. Exemplo: Int.greater(1, -2); => true
      greaterOrEqual(x : Int, y : Int) : Bool  - Retorna true se x for "maior que ou igual" y. Isso é equivalente a x >= y. Exemplo: Int.greaterOrEqual(1, -2); => true
      compare(x : Int, y : Int) : {#less; #equal; #greater} - Função de comparação de uso geral para Int. Retorna (#less, #equal, ou #greater). Exemplo: Int.compare(-3, 2) => #less  
                                                              Esta função também pode ser usada como valor para uma função de ordenação. 
                                                              Exemplo: Array.sort([1, -2, -3], Int.compare) => [-3, -2, 1]

      Função de conversão do Int:
          toText(x : Int) : Text - Converte um número inteiro para sua representação textual. Exemplo: Int.toText(-1234) => "-1234"
   */


 var n : Nat = 1;

 /* Funções de Conversão do Nat */

  /*A função Nat.fromText(n1) irá converter um texto em um número natural desde que não seja negativo ou o texto contenha letras 
    o retorno possui ? pois isso indica que o valor que for retornado poderá ser null
  */
  public func converteTextoNat() : async ?Nat {
    let texto : Text = "123";
    return Nat.fromText(texto); // Exemplo: "123" => 123
  };
  
  // toText(n : Nat) : Text - Converte um número natural para sua representação textual. Exemplo: Nat.toText(1234) => "1234"

  /* Funções numéricas do Nat
      add(x : Nat, y : Nat) : Nat - Retorna a soma de x e y, equivale a x + y. Exemplo: Nat.add(1, 2); => 3
                                         Também poderá ser utilizada como parametro para outras funções, exemplo: Array.foldLeft([2, 3, 1], 0, Nat.add) 
      sub(x : Nat, y : Nat) : Nat - Retorna a subtração de x e y, equivale a x - y. Exemplo: Nat.sub(2, 1); => 1
      mul(x : Nat, y : Nat) : Nat - Retorna a multiplicação entre x e y, equivale a x * y. Exemplo: Nat.mul(2, 3); => 6
      div(x : Nat, y : Nat) : Nat - Retorna a divisão inteira sem sinal de x por y, equivale a x / y. O quociente é arredondado para baixo, o que equivale a 
                                    truncar as casas decimais do quociente. Exemplo: Nat.div(6, 2); => 3
      rem(x : Nat, y : Nat) : Nat - Retorna o resto da divisão inteira de x por y, equivale a x / y. Exemplo: Nat.rem(6, 4); => 2
      pow(x : Nat, y : Nat) : Nat - Retorna x à potência de y, equivale a x ** y. Exemplo: Nat.pow(2, 3); => 8
  */
  /* Funções de comparação do Nat

    min(x : Nat, y : Nat) : Nat - Retorna o menor valor entre x e y. Exemplo: Nat.min(1, 2) => 1
    max(x : Nat, y : Nat) : Nat - Retorna o maior valor entre x e y. Exemplo: Nat.max(1, 2) => 2
    equal(x : Nat, y : Nat) : Bool - Retorna true se x e y forem iguais, equivale a x == y. Exemplo: Nat.equal(1, 1); => true     
                                     Esta função pode ser utilizada como parametro em outras funções, exemplo:           
                                          import Buffer "mo:base/Buffer";
                                          let buffer1 = Buffer.Buffer<Nat>(3);
                                          let buffer2 = Buffer.Buffer<Nat>(3);
                                          Buffer.equal(buffer1, buffer2, Nat.equal) => true

    notEqual(x : Nat, y : Nat) : Bool - Retorna true se x for diferente de y, equivale a x != y. Exemplo: Nat.notEqual(1, 2); => true 
    less(x : Nat, y : Nat) : Bool - Retorna true se x for menor que y, equivale a x < y. Exemplo: Nat.less(1, 2); => true 
    lessOrEqual(x : Nat, y : Nat) : Bool - Retorna true se x for menor ou igual a y, equivale a x <= y. Exemplo: Nat.lessOrEqual(1, 2); => true 
    greater(x : Nat, y : Nat) : Bool - Retorna true se x for maior que y, equivale a x > y. Exemplo: Nat.greater(2, 1); => true 
    greaterOrEqual(x : Nat, y : Nat) : Bool - Retorna true se x for maior ou igual a y, equivale a x >= y. Exemplo: Nat.greaterOrEqual(2, 1); => true 
    compare(x : Nat, y : Nat) : {#less; #equal; #greater} - Função utilizada para comparar x com y, ela retorna #less, #equal ou #greater de acordo com os numeros passados.
                                                            Exemplo: Nat.compare(2, 3) => #less
                                                            Esta função pode ser utilizada como parametro em outras funções, exemplo:
                                                                import Array "mo:base/Array";
                                                                Array.sort([2, 3, 1], Nat.compare) // => [1, 2, 3]
  */

var fl : Float = 1.1;

//Observação: números de ponto flutuante têm precisão limitada e as operações podem resultar em erros numéricos.
//Exemplos de erros numéricos:

public func testePrecisaoFloat() : async Bool {
  let n1 = 0.1 + 0.1 + 0.1;
  let n2 = 0.3;
  return n1 == n2;
  //Expressão: 0.1 + 0.1 + 0.1 == 0.3 Resultado => false
};

/*Sugestão:
  Comparações de números de ponto flutuante por == ou != são desencorajadas. Em vez disso, é melhor comparar números de ponto flutuante 
  com uma tolerância numérica, chamada epsilon. Exemplo:  */

public func testePrecisaoFloatEp() : async Bool {
  let n1 = 0.1 + 0.1 + 0.1;
  let n2 = 0.3;
  let epsilon = 1e-6; 
  return Float.equalWithin(n1, n2, epsilon);
  //Resultado => true   
  // Documentação Motoko: para precisão absoluta, é recomendável codificar o número da fração como um par de Nat para a base e Nat para o expoente (ponto decimal).
};


/* Funções numéricas de Float */

//Arredonda para o proximo valor inteiro acima de x. 
public func ceilFloat(n1: Float) : async Float {  
  return Float.ceil(n1);  
  //Exemplo: Float.ceil(1.2) => 2.0
};

//Arredonda para o proximo valor inteiro abaixo de x. 
public func floorFloat(n1: Float) : async Float {  
  return Float.floor(n1);  
  //Exemplo: Float.floor(1.2) // => 1.0
};

//Retorna o valor de x truncado, ou seja, sem as casas decimais
public func truncFloat(n1: Float) : async Float {  
  return Float.trunc(n1);  
  //Exemplo: Float.trunc(2.75) => 2.0
};
 
/*Arredonda o valor para o float inteiro mais próximo de x, levando em consideração o valor decimal 0.5. Caso o número possuir casa decimal igual ou maior que 0.5 
  o número será arredondado para cima, caso contrario será para baixo */
public func nearestFloat(n1: Float) : async Float {    
  return Float.nearest(n1);  
  //Exemplo: Float.nearest(1.1) => 1.0
  //         Float.nearest(1.2) => 1.0
  //         Float.nearest(1.3) => 1.0
  //         Float.nearest(1.4) => 1.0
  //         Float.nearest(1.5) => 2.0
  //         Float.nearest(1.6) => 2.0
  //         Float.nearest(1.7) => 2.0
  //         Float.nearest(1.8) => 2.0
  //         Float.nearest(1.9) => 2.0
};
  
/*  
  abs(x : Float) -> Float - Retorna o valor absoluto de x. Exemplo: Float.abs(-1.2) => 1.2
  sqrt(x : Float) -> Float - Retorna a raiz quadrada de x. Exemplo: Float.sqrt(6.25) => 2.5
  copySign(x : Float, y : Float) -> Float - Retorna x se x e y têm o mesmo sinal, caso contrário retorna x com sinal negado. Exemplo: Float.copySign(1.2, -2.3) => -1.2   
  min(x : Float, y : Float) -> Float - Retorna o menor valor entre x e y. Exemplo: Float.min(1.2, -2.3) => -2.3 
  max(x : Float, y : Float) -> Float - Retorna o maior valor entre x e y. Exemplo: Float.max(1.2, -2.3) => 1.2
  sin(x : Float) -> Float - Retorna o seno de um ângulo fornecido em radiano. Exemplo: Float.sin(Float.pi / 2) => 1.0
  cos(x : Float) -> Float - Retorna o cosseno de um ângulo fornecido em radiano. Exemplo: Float.cos(Float.pi / 2) => 0.0 
  tan(x : Float) -> Float - Retorna a tangente de um ângulo fornecido em radiano. Exemplo: Float.tan(Float.pi / 4) => 1.0 
  arcsin(x : Float) -> Float - Retorna o arco seno de x em radianos. Exemplo: Float.arcsin(1.0) => Float.pi / 2
  arccos(x : Float) -> Float - Retorna o arco cosseno de x em radianos. Exemplo: Float.arccos(1.0) => 0.0
  arctan(x : Float) -> Float - Retorna o arco tangente de x em radianos. Exemplo: Float.arctan(1.0) => Float.pi / 4
  arctan2(y : Float, x : Float) -> Float - Retorna o arco tangente em radianos y/x com base nos sinais de ambos os valores para determinar o quadrante correto.
                                           Exemplo: let sqrt2over2 = Float.sqrt(2) / 2;
                                                    Float.arctan2(sqrt2over2, sqrt2over2) => Float.pi / 4
  exp(x : Float) -> Float - Retorna o valor da função exponencial, que é a constante 𝑒 elevada à potência fornecida. Exemplo: Float.exp(1.0) => 2.7182818284590452354
  log(x : Float) -> Float - Retorna o logaritmo natural (base - e) de x. Exemplo: Float.log(Float.e) => 1.0
*/

/* Funções de comparação de Float:

   equalWithin(x : Float, y : Float, epsilon : Float) : Bool - Determina se x é igual a y dentro da tolerância definida de epsilon. 
                                                              Exemplo: let epsilon = 1e-6;
                                                                       Float.equalWithin(-12.3, -1.23e1, epsilon) => true

   notEqualWithin(x : Float, y : Float, epsilon : Float) : Bool - Determina se x não é igual a y dentro da tolerância definida de epsilon. 
                                                                 Exemplo: let epsilon = 1e-6;
                                                                          Float.notEqualWithin(-12.3, -1.23e1, epsilon) // => false

   less(x : Float, y : Float) : Bool - Retorna true se x é menor que y, equivalente a x < y. Exemplo: Float.less(Float.e, Float.pi) => true
   lessOrEqual(x : Float, y : Float) : Bool - Retorna true se x é menor ou igual a y, equivalente a x <= y. Exemplo: Float.lessOrEqual(0.123, 0.1234) => true
   greater(x : Float, y : Float) : Bool - Retorna true se x é maior que y, equivalente a x > y. Exemplo: Float.greater(Float.pi, Float.e) => true

   greaterOrEqual(x : Float, y : Float) : Bool - Retorna true se x é maior ou igual a y, equivale a x >= y. Exemplo: Float.greaterOrEqual(0.1234, 0.123) => true
   compare(x : Float, y : Float) : {#less; #equal; #greater} - Retorna a comparação entre x e y. Exemplo: Float.compare(0.123, 0.1234) => #less
                                                             Nota: O uso desta operação para determinar igualdade não é recomendado devido problemas de precisão.
                                                                   Recomenda-se utilizar equalWithin(x, y, espilon) ou notEqualWithin(x, y, epsilon) para testar 
                                                                   igualdade ou desigualdade

   isNaN (number : Float) : Bool - Determina se o numero é um NaN ("not a number") na representação de ponto flutuante. Exemplo:Float.isNaN(0.0/0.0) => true
   toText (x : Float) : Text - Conversão para texto. Exemplo: Float.toText(0.12) => "0.12"
   toInt64 ( x : Float ) : Int64 - Conversão para Int64 truncando Float, equivalente a toInt64(trunc(f)). Exemplo: Float.toInt64(-12.3) => -12
   fromInt64 ( x : Int64 ) : Float - Converte de Int64 para Float. Exemplo: Float.fromInt64(-42) => -42.0
   toInt ( x : Float) : Int - Converte de Float para Int. Exemplo: Float.toInt(1.4) => 1
   fromInt ( x : Int) : Float - Converte Int para Float. Exemplo: Float.fromInt(-123) => -123.0
   neg(x : Float) : Float - Retorna a negação de x. Exemplo: Float.neg(1.23) => -1.23
   add(x : Float, y : Float) : Float - Retorna o resultado da soma de x e y, equivalente a x + y. Exemplo: Float.add(1.23, 0.123) => 1.353
   sub(x : Float, y : Float) : Float - Retorna o resultado da subtração de x e y, equivale a x - y. Exemplo: Float.sub(1.23, 0.123) => 1.107
   mul(x : Float, y : Float) : Float - Retorna o resultado da multiplicação de x com y, equivale a x * y. Exemplo: Float.mul(1.23, 1e2) => 123.0
   div(x : Float, y : Float) : Float - Retorna p resultado da divisão de x por y, equivale a x / y. Exemplo: Float.div(10.0, 2.0) => 5.0
   rem(x : Float, y : Float) : Float - Retorna o resto da divisão. Exemplo: Float.rem(7.2, 2.3) => 0.3 
   pow(x : Float, y : Float) : Float - Retorna x à potência de y, equivalente a x ** y. Exemplo: Float.pow(2.5, 2.0) => 6.25
  */
  
  var t : Text = "";

  /* Funções de analise de Text 

  size(t : Text) : Nat - /Retorna o número de caracteres de um Texto passado como parametro, equivalente a t.size(). Exemplo: let size = Text.size("abc"); => 3

  type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)}
  Um padrão p descreve uma sequência de caracteres. Um padrão tem uma das seguintes formas:
      #char c corresponde à sequência de caracteres simples.
      #text t corresponde a uma sequência de texto com vários caracteres t.
      #predicate p corresponde a qualquer sequência de caracteres simples c que satisfaça o predicado p(c).
      Uma correspondência para p é qualquer sequência de caracteres que corresponda ao padrão p.

  Exemplo:
  let char Pattern = #char 'A';
  let text Pattern = #text "phrase";
  let predicate Pattern : Text.Pattern = #predicate (func(c) { c == 'A' or c == 'B' }); => "A" or "B"

  contains(t : Text, p : Pattern) : Bool - Retorna true se a entrada Text contém uma correspondência para os dados de Pattern, passado como parametro. Exemplo:  Text.contains("Motoko", #text "oto") => true
                                                                                                                                                                 Text.contains("Blockchain", #char 'k') => true
  startsWith(t : Text, p : Pattern) : Bool - Retorna true se a entrada Text começa com um prefixo correspondente ao Pattern passado como parametro. Exemplo: Text.startsWith("Motoko", #text "Mo") => true
  endsWith(t : Text, p : Pattern) : Bool - Retorna true se a entrada Text termina com um sufixo correspondente ao Pattern passado como parametro. Exemplo: Text.endsWith("Motoko", #char 'o') => true
  stripStart(t : Text, p : Pattern) : ?Text - Retira uma ocorrência do início do Text de acordo com o Pattern passado como parametro. 
                                              Se você quiser remover várias instâncias do padrão, use Text.trimStart() em vez disso.
                                              Exemplo:   
                                                // Tenta tirar um caracter que não existe no texto passado como parametro
                                                let none = Text.stripStart("abc", #char '-'); => null
                                                // Tirar um '-' do texto passado como parametro, irá tirar apenas se o texto iniciar com o Pattern passado
                                                let one = Text.stripStart("--abc", #char '-'); => ?"-abc"

  stripEnd(t : Text, p : Pattern) : ?Text - Retira uma ocorrência do final do Text de acordo com o Pattern passado como parametro. 
                                            Se você quiser remover várias instâncias do padrão, use Text.trimEnd()em vez disso.
                                            Exemplo: 
                                                // Tenta tirar um caracter que não existe no texto passado como parametro
                                                let none = Text.stripEnd("xyz", #char '-'); => null
                                                // Tirar um '-' do texto passado como parametro, irá tirar apenas se o texto finalizar com o Pattern passado
                                                let one = Text.stripEnd("xyz--", #char '-'); => ?"xyz-"

  trimStart(t : Text, p : Pattern) : Text - Retira do início do texto passado como parametro o Pattern informado (irá retirar todas as ocorrencias, desde que estiver no início do texto). 
                                            Se você quiser remover apenas uma única instância do Pattern, use Text.stripStart() em vez disso.
                                            Exemplo: let trimmed = Text.trimStart("---abc", #char '-'); => "abc"

  trimEnd(t : Text, p : Pattern) : Text - Retira do final do texto passado como parametro o Pattern informado (irá retirar todas as ocorrencias, desde que estiver no final do texto). 
                                          Se você quiser remover apenas uma única instância do Pattern, use Text.stripEnd() em vez disso.
                                          Exemplo: let trimmed = Text.trimEnd("xyz---", #char '-'); => "xyz"

  trim(t : Text, p : Pattern) : Text - Retira do início e final do texto passado como parametro o Pattern informado (irá retirar todas as ocorrencias, desde que estiver no início ou final do texto). 
                                       Exemplo: let trimmed = Text.trim("---abcxyz---", #char '-'); => "abcxyz"
  */
  /* Funções de conversão do Text 
  
  let fromChar : (c : Char) -> Text - Converte o Char passado como parametro em Text. Exemplo: let text = Text.fromChar('A'); => Text: "A"
  toIter(t : Text) : Iter.Iter<Char> - Percorre cada Char do Text passado como parametro, equivale a chamar t.chars() (método onde t é um Text).
                                       Exemplo:
                                       import { print } "mo:base/Debug";
                                       for (c in Text.toIter("abc")) {
                                          print(debug_show c);
                                       }

  toArray(t : Text) : [Char] - Retorna um novo Array contendo caracteres do Text passado como parametro,
                               equivale a Iter.toArray(t.chars()). Exemplo: Text.toArray("Café") == ['C', 'a', 'f', 'é'];
  
  toVarArray(t : Text) : [var Char] - Retorna um novo array mutável contendo caracteres Text passado como parametro, equivale a Iter.toArrayMut(t.chars()).
                                      Exemplo Text.toVarArray("Café") => [var 'C', 'a', 'f', 'é'];
  
  fromIter(cs : Iter.Iter<Char>) : Text - Retorna um Text a partir de um array de Char. Exemplo: let text = Text.fromIter(['a', 'b', 'c'].vals()); => "abc"
  
  hash(t : Text) : Hash.Hash - Retorna um hash obtido usando o djb2 algoritmo. Exemplo: let hash = Text.hash("abc");
                               Observação: este algoritmo deve ser usado em estruturas de dados e não como uma função de hash criptográfica.
  */

  /* Funções de transformação do Text 

  concat(t1 : Text, t2 : Text) : Text - Retorna t1 concatenado com t2, equivale a t1 # t2 (onde # é utilizado para concatenação).
                                        Exemplo:
                                        let a = "Hello";
                                        let b = "There";
                                        let together = a # b; => "HelloThere"
                                        let withSpace = a # " " # b; => "Hello There"
                                        let togetherAgain = Text.concat(a, b); => "HelloThere"

  
  join(sep : Text, ts : Iter.Iter<Text>) : Text - Transforma em Text valores com um delimitador. Exemplo: let joined = Text.join(", ", ["a", "b", "c"].vals()); => "a, b, c"
  map(t : Text, f : Char -> Char) : Text - Aplica uma função a cada caractere do Text passado como parametro, retornando os resultados concatenados.
                                           Exemplo:
                                           // Altera todas as ocorrencias do caracter '?' para '!'
                                           let result = Text.map("Motoko?", func(c) {
                                                                                      if (c == '?') '!'
                                                                                      else c
                                                                                    });

  translate(t : Text, f : Char -> Text) : Text - Retorna o resultado da função f para cada caractere de t, concatenando os valores de texto intermediários.
                                                 // Altera todas as ocorrencias do caracter '?' para "!!"
                                                 let result = Text.translate("Motoko?", func(c) {
                                                                                                   if (c == '?') "!!"
                                                                                                   else Text.fromChar(c)
                                                                                                }); => "Motoko!!"

  

  split(t : Text, p : Pattern) : Iter.Iter<Text> - Divide o Text de entrada com o Pattern passado como parametro, Os campos serão separados por uma correspondência.
                                                   Exemplo:
                                                   let words = Text.split("This is a sentence.", #char ' ');
                                                   Text.join("|", words) => "This|is|a|sentence."

  //func tokens(t : Text, p : Pattern) : Iter.Iter<Text>
  //Retorna uma sequência de tokens da entrada Textdelimitada pelo especificado Pattern, derivada do início ao fim. Um "token" é uma subsequência máxima não vazia de tnão contendo uma correspondência para o padrão p. Dois tokens podem ser separados por uma ou mais correspondências de p.

  //let tokens = Text.tokens("this needs\n an   example", #predicate (func(c) { c == ' ' or c == '\n' }));
  //Text.join("|", tokens) // "this|needs|an|example"

  replace(t : Text, p : Pattern, r : Text) : Text - Substitui o texto passado no parametro t pelo texto passado no parametro r quando localizado o Pattern definido em r.
                                                    Exemplo: let result = Text.replace("abcabc", #char 'a', "A"); => "AbcAbc"


  compareWith(t1 : Text, t2 : Text, cmp : (Char, Char) -> {#less; #equal; #greater}) : {#less; #equal; #greater}
                                                          Compara t1 e t2 usa a função de comparação de caracteres fornecida.
                                                          Exemplo:
                                                          import Char "mo:base/Char";
                                                          Text.compareWith("abc", "ABC", func(c1, c2) { Char.compare(c1, c2) }) => #greater

  encodeUtf8 (t : Text) : Blob - Retorna um Blob com UTF-8 codificado a partir de um Text. Exemplo: let blob = Text.encodeUtf8("Hello");
  decodeUtf8 (b : Blob) : ?Text - Tenta decodificar os dados de um Blob para UTF-8. Retorna null se o blob não possuir UTF-8 válido. Exemplo: let text = Text.decodeUtf8("\48\65\6C\6C\6F"); => ?"Hello"
  toLowercase(t : Text) : Text - Converte o Text passado como parametro em um Text em letras minúsculas. Exemplo: let text = Text.toLowercase("Good Day"); => ?"good day"
  toUppercase(t : Text) : Text - Converte o Text passado como parametro em um Text em letras maiúsculas. Exemplo: let text = Text.toUppercase("Good Day"); => ?"GOOD DAY"

*/

/* Funções de comparação do Text 

  equal(t1 : Text, t2 : Text) : Bool - Retorna true se t1 for igual a t2, equivale a t1 == t2. Exemplo: Text.equal("Motoko","Motoko"); => true
  notEqual(t1 : Text, t2 : Text) : Bool - Retorna true se t1 for diferente de t2, equivale a t1 != t2. Exemplo: Text.notEqual("Motoko","Rust"); => true
  */
  
  //less(t1 : Text, t2 : Text) : Bool - Retorna true se t1 for menor que t2, equivale a t1 < t2.
  public func textLess(tx1 : Text, tx2 : Text) : async Bool {
    return Text.less(tx1, tx2); 
  };

  //greater(t1 : Text, t2 : Text) : Bool - Retorna true se t1 for maior que t2, equivale a t1 > t2.
  public func textGreater(tx1 : Text, tx2 : Text) : async Bool {
    return Text.greater(tx1, tx2); 
  };

/*
  lessOrEqual(t1 : Text, t2 : Text) : Bool - - Retorna true se t1 for menor ou igual a t2, equivale a t1 <= t2.  
  greaterOrEqual(t1 : Text, t2 : Text) : Bool - Retorna true se t1 for maior ou igual a t2, equivale a t1 >= t2.
  compare(t1 : Text, t2 : Text) : {#less; #equal; #greater} - Compara t1 e t2 lexicograficamente.
                                                              Exemplo:
                                                              import { print } "mo:base/Debug";
                                                              print(debug_show Text.compare("abc", "abc")); => #equal
                                                              print(debug_show Text.compare("abc", "def")); => #less
                                                              print(debug_show Text.compare("abc", "ABC")); => #greater
  */

/*
  Char: Caracteres de texto Unicode ( 'a', 'B', '☃').
  var t4 : Char = 'a';

  toNat32(c : Char) : Nat32 - Convert character c to a word containing its Unicode scalar value.
  fromNat32(w : Nat32) : Char - Convert w to a character. Traps if w is not a valid Unicode scalar value. Value w is valid if, and only if, w < 0xD800 or (0xE000 <= w and w <= 0x10FFFF).
  toText(c : Char) -> Text - Convert character c to single character text.
  isDigit(c : Char) : Bool - Returns true when c is a decimal digit between 0 and 9, otherwise false.
  isWhitespace(c : Char) -> Bool - Returns the Unicode White_Space property of c.
  isLowercase : (c : Char) -> Bool - Returns the Unicode Lowercase property of c.
  isUppercase : (c : Char) -> Bool - Returns the Unicode Uppercase property of c.
  isAlphabetic : (c : Char) -> Bool - Returns the Unicode Alphabetic property of c.
  equal(x : Char, y : Char) : Bool - Returns x == y.
  notEqual(x : Char, y : Char) : Bool - Returns x != y.
  less(x : Char, y : Char) : Bool - Returns x < y.
  lessOrEqual(x : Char, y : Char) : Bool - Returns x <= y.
  greater(x : Char, y : Char) : Bool - Returns x > y.
  greaterOrEqual(x : Char, y : Char) : Bool - Returns x >= y.
  compare(x : Char, y : Char) : {#less; #equal; #greater} - Returns the order of x and y.
*/

var bl : Blob = "\00\00\00\ff"; 

//func fromArray(bytes : [Nat8]) : Blob
//Cria um Bloba partir de uma matriz de bytes ( [Nat8]), copiando cada elemento.
//Exemplo:
//let bytes : [Nat8] = [0, 255, 0];
//let blob = Blob.fromArray(bytes); // => "\00\FF\00"

//func fromArrayMut(bytes : [var Nat8]) : Blob
//Cria Bloba partir de uma matriz mutável de bytes ( [var Nat8]), copiando cada elemento.
//Exemplo:
//let bytes : [var Nat8] = [var 0, 255, 0];
//let blob = Blob.fromArrayMut(bytes); // => "\00\FF\00"

//func toArray(blob : Blob) : [Nat8]
//Converte a Blobem uma matriz de bytes ( [Nat8]), copiando cada elemento.
//Exemplo:
//let blob = "\00\FF\00" : Blob;
//let bytes = Blob.toArray(blob); // => [0, 255, 0]

//func toArrayMut(blob : Blob) : [var Nat8]
//Converte a Blobem uma matriz mutável de bytes ( [var Nat8]), copiando cada elemento.
//Exemplo:
//let blob = "\00\FF\00" : Blob;
//let bytes = Blob.toArrayMut(blob); // => [var 0, 255, 0]

//func hash(blob : Blob) : Nat32
//Retorna o hash (não criptográfico) de blob.
//Exemplo:
//let blob = "\00\FF\00" : Blob;
//Blob.hash(blob) // => 1_818_567_776

//func compare(b1 : Blob, b2 : Blob) : {#less; #equal; #greater}
//Função de comparação de propósito geral para Blobcomparar o valor dos bytes. Retorna Order(ou #less, #equal, ou #greater) comparando blob1com blob2.
//Exemplo:
//let blob1 = "\00\00\00" : Blob;
//let blob2 = "\00\FF\00" : Blob;
//Blob.compare(blob1, blob2) // => #less

//func equal(blob1 : Blob, blob2 : Blob) : Bool
//Função de igualdade para Blobtipos. Isso é equivalente a blob1 == blob2.
//Exemplo:
//let blob1 = "\00\FF\00" : Blob;
//let blob2 = "\00\FF\00" : Blob;
//ignore Blob.equal(blob1, blob2);
//blob1 == blob2 // => true
//Nota: O motivo pelo qual essa função é definida nesta biblioteca (além do ==operador existente) é para que você possa usá-la como um valor de função para passar para uma função de ordem superior. Não é possível usá-la ==como um valor de função no momento.
//Exemplo:
//import Buffer "mo:base/Buffer";
//let buffer1 = Buffer.Buffer<Blob>(3);
//let buffer2 = Buffer.Buffer<Blob>(3);
//Buffer.equal(buffer1, buffer2, Blob.equal) // => true

//func notEqual(blob1 : Blob, blob2 : Blob) : Bool
//Função de desigualdade para Blobtipos. Isso é equivalente a blob1 != blob2.
//Exemplo:
//let blob1 = "\00\AA\AA" : Blob;
//let blob2 = "\00\FF\00" : Blob;
//ignore Blob.notEqual(blob1, blob2);
//blob1 != blob2 // => true
//Nota: O motivo pelo qual essa função é definida nesta biblioteca (além do !=operador existente) é para que você possa usá-la como um valor de função para passar para uma função de ordem superior. Não é possível usá-la !=como um valor de função no momento.

//func less(blob1 : Blob, blob2 : Blob) : Bool
//Função "Menor que" para Blobtipos. Isso é equivalente a blob1 < blob2.
//Exemplo:
//let blob1 = "\00\AA\AA" : Blob;
//let blob2 = "\00\FF\00" : Blob;
//ignore Blob.less(blob1, blob2);
//blob1 < blob2 // => true
//Nota: O motivo pelo qual essa função é definida nesta biblioteca (além do <operador existente) é para que você possa usá-la como um valor de função para passar para uma função de ordem superior. Não é possível usá-la <como um valor de função no momento.

//func lessOrEqual(blob1 : Blob, blob2 : Blob) : Bool
//Função "menor que ou igual a" para Blobtipos. Isso é equivalente a blob1 <= blob2.
//Exemplo:
//let blob1 = "\00\AA\AA" : Blob;
//let blob2 = "\00\FF\00" : Blob;
//ignore Blob.lessOrEqual(blob1, blob2);
//blob1 <= blob2 // => true
//Nota: O motivo pelo qual essa função é definida nesta biblioteca (além do <=operador existente) é para que você possa usá-la como um valor de função para passar para uma função de ordem superior. Não é possível usá-la <=como um valor de função no momento.

//func greater(blob1 : Blob, blob2 : Blob) : Bool
//Função "maior que" para Blobtipos. Isso é equivalente a blob1 > blob2.
//Exemplo:
//let blob1 = "\BB\AA\AA" : Blob;
//let blob2 = "\00\00\00" : Blob;
//ignore Blob.greater(blob1, blob2);
//blob1 > blob2 // => true
//Nota: O motivo pelo qual essa função é definida nesta biblioteca (além do >operador existente) é para que você possa usá-la como um valor de função para passar para uma função de ordem superior. Não é possível usá-la >como um valor de função no momento.

//func greaterOrEqual(blob1 : Blob, blob2 : Blob) : Bool
//Função "maior que ou igual a" para Blobtipos. Isso é equivalente a blob1 >= blob2.
//Exemplo:
//let blob1 = "\BB\AA\AA" : Blob;
//let blob2 = "\00\00\00" : Blob;
//ignore Blob.greaterOrEqual(blob1, blob2);
//blob1 >= blob2 // => true
//Nota: O motivo pelo qual essa função é definida nesta biblioteca (além do >=operador existente) é para que você possa usá-la como um valor de função para passar para uma função de ordem superior. Não é possível usá-la >=como um valor de função no momento.



};
