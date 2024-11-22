import { useState } from 'react';
import { FundamentosMotoko_backend } from 'declarations/FundamentosMotoko_backend';

function App() {
  
  const adicao = async () => {
    let n1 = parseInt(document.getElementById("adicao.n1").value);
    let n2 = parseInt(document.getElementById("adicao.n2").value);
    let resultado = await FundamentosMotoko_backend.adicao(n1,n2);    
    document.getElementById("adicao.r").innerText  = resultado;
  }

  const subtracao = async () => {
    let n1 = parseInt(document.getElementById("subtracao.n1").value);
    let n2 = parseInt(document.getElementById("subtracao.n2").value);
    let resultado = await FundamentosMotoko_backend.subtracao(n1,n2);    
    document.getElementById("subtracao.r").innerText  = resultado;
  }

  const multiplicacao = async () => {
    let n1 = parseInt(document.getElementById("multiplicacao.n1").value);
    let n2 = parseInt(document.getElementById("multiplicacao.n2").value);
    let resultado = await FundamentosMotoko_backend.multiplicacao(n1,n2);    
    document.getElementById("multiplicacao.r").innerText  = resultado;
  }  

  const divisao = async () => {
    let n1 = parseInt(document.getElementById("divisao.n1").value);
    let n2 = parseInt(document.getElementById("divisao.n2").value);
    let resultado = await FundamentosMotoko_backend.divisao(n1,n2);    
    document.getElementById("divisao.r").innerText  = resultado;
  }  

  const modulo = async () => {
    let n1 = parseInt(document.getElementById("modulo.n1").value);
    let n2 = parseInt(document.getElementById("modulo.n2").value);
    let resultado = await FundamentosMotoko_backend.modulo(n1,n2);    
    document.getElementById("modulo.r").innerText  = resultado;
  }

  const exponenciacao = async () => {
    let n1 = parseInt(document.getElementById("exponenciacao.n1").value);
    let n2 = parseInt(document.getElementById("exponenciacao.n2").value);
    let resultado = await FundamentosMotoko_backend.exponenciacao(n1,n2);    
    document.getElementById("exponenciacao.r").innerText  = resultado;
  }
  
  const operadorIgual = async () => {
    let n1 = parseInt(document.getElementById("operadorIgual.n1").value);
    let n2 = parseInt(document.getElementById("operadorIgual.n2").value);
    let resultado = await FundamentosMotoko_backend.operador_igual(n1,n2);    
    document.getElementById("operadorIgual.r").innerText  = resultado;
  }

  const operadorDiferente = async () => {
    let n1 = parseInt(document.getElementById("operadorDiferente.n1").value);
    let n2 = parseInt(document.getElementById("operadorDiferente.n2").value);
    let resultado = await FundamentosMotoko_backend.operador_diferente(n1,n2);    
    document.getElementById("operadorDiferente.r").innerText  = resultado;
  }

  const operadorMenorIgual = async () => {
    let n1 = parseInt(document.getElementById("operadorMenorIgual.n1").value);
    let n2 = parseInt(document.getElementById("operadorMenorIgual.n2").value);
    let resultado = await FundamentosMotoko_backend.operador_menor_igual(n1,n2);    
    document.getElementById("operadorMenorIgual.r").innerText  = resultado;
  }

  const operadorMaiorIgual = async () => {
    let n1 = parseInt(document.getElementById("operadorMaiorIgual.n1").value);
    let n2 = parseInt(document.getElementById("operadorMaiorIgual.n2").value);
    let resultado = await FundamentosMotoko_backend.operador_maior_igual(n1,n2);    
    document.getElementById("operadorMaiorIgual.r").innerText  = resultado;
  }

  const operadorMaior = async () => {
    let n1 = parseInt(document.getElementById("operadorMaior.n1").value);
    let n2 = parseInt(document.getElementById("operadorMaior.n2").value);
    let resultado = await FundamentosMotoko_backend.operador_maior(n1,n2);    
    document.getElementById("operadorMaior.r").innerText  = resultado;
  }

  const operadorMenor = async () => {
    let n1 = parseInt(document.getElementById("operadorMenor.n1").value);
    let n2 = parseInt(document.getElementById("operadorMenor.n2").value);
    let resultado = await FundamentosMotoko_backend.operador_menor(n1,n2);    
    document.getElementById("operadorMenor.r").innerText  = resultado;
  }

  const ifElse = async () => {
    let n1 = parseInt(document.getElementById("ifElse.n1").value);
    let n2 = parseInt(document.getElementById("ifElse.n2").value);
    let resultado = await FundamentosMotoko_backend.if_else(n1,n2);    
    document.getElementById("ifElse.r").innerText  = resultado;
  }

  const booleanIf = async () => {
    let b = document.getElementById("booleanIf.b").value.toLowerCase() === "true";  
    let resultado = await FundamentosMotoko_backend.boolean_if(b);    
    document.getElementById("booleanIf.r").innerText  = resultado;
  }

  const whileLoop = async () => {
    let n1 = parseInt(document.getElementById("whileLoop.n1").value);    
    let resultado = await FundamentosMotoko_backend.while_loop(n1);    
    document.getElementById("whileLoop.r").innerText  = resultado;
  }

  const forLoop = async () => {
    let n1 = parseInt(document.getElementById("forLoop.n1").value);    
    let resultado = await FundamentosMotoko_backend.for_loop(n1);    
    document.getElementById("forLoop.r").innerText  = resultado;
  }

  const switchCondition = async () => {
    let n1 = parseInt(document.getElementById("switchCondition.n1").value);    
    let resultado = await FundamentosMotoko_backend.switch_condition(n1);    
    document.getElementById("switchCondition.r").innerText  = resultado;
  }

  const operadorAnd = async () => {   
    let b1 = document.getElementById("operadorAnd.b1").value.toLowerCase() === "true";  
    let b2 = document.getElementById("operadorAnd.b2").value.toLowerCase() === "true";  
    let resultado = await FundamentosMotoko_backend.operador_and(b1,b2);    
    document.getElementById("operadorAnd.r").innerText  = resultado;
  }

  const operadorOr = async () => {
    let b1 = document.getElementById("operadorOr.b1").value.toLowerCase() === "true";  
    let b2 = document.getElementById("operadorOr.b2").value.toLowerCase() === "true";  
    let resultado = await FundamentosMotoko_backend.operador_or(b1,b2);    
    document.getElementById("operadorOr.r").innerText  = resultado;
  }

  ///##############               ARRAY

  const addArray = async () => {
    let n1 = parseInt(document.getElementById("addArray.n1").value);    
    let resultado = await FundamentosMotoko_backend.add_array(n1);        
    document.getElementById("addArray.r").innerText  = resultado;
  }

  const getArray = async () => {    
    let resultado = await FundamentosMotoko_backend.get_array();    
    document.getElementById("getArray.r").innerText  = resultado;
  }

  const getSizeArray = async () => {    
    let resultado = await FundamentosMotoko_backend.get_size_array();    
    document.getElementById("getSizeArray.r").innerText  = resultado;
  }
   
  const sortArray = async () => {    
    let resultado = await FundamentosMotoko_backend.sort_array();    
    document.getElementById("sortArray.r").innerText  = resultado;
  }

  const reverseArray = async () => {    
    let resultado = await FundamentosMotoko_backend.reverse_array();    
    document.getElementById("reverseArray.r").innerText  = resultado;
  }  

  const equalArray = async () => {    
    let resultado = await FundamentosMotoko_backend.equal_array();    
    document.getElementById("equalArray.r").innerText  = resultado;
  }

  const apenasParArray = async () => {    
    let resultado = await FundamentosMotoko_backend.apenas_par_array();    
    document.getElementById("apenasParArray.r").innerText  = resultado;
  }

  const removeArray = async () => {
    let n1 = parseInt(document.getElementById("removeArray.n1").value);    
    let resultado = await FundamentosMotoko_backend.remove_array(n1);    
    document.getElementById("removeArray.r").innerText  = resultado;
  }

  const forValsArray = async () => {    
    let resultado = await FundamentosMotoko_backend.for_vals_array();    
    document.getElementById("forValsArray.r").innerText  = resultado;
  }

  const findArray = async () => {
    let n1 = parseInt(document.getElementById("findArray.n1").value);    
    let resultado = await FundamentosMotoko_backend.find_array(n1);    
    document.getElementById("findArray.r").innerText  = resultado;
  }
  
  ///##############               LIST
  
  const addInicioList = async () => {
    let n1 = parseInt(document.getElementById("addInicioList.n1").value);    
    let resultado = await FundamentosMotoko_backend.add_inicio_list(n1);    
    document.getElementById("addInicioList.r").innerText  = resultado;
  }

  const addFinalList = async () => {
    let n1 = parseInt(document.getElementById("addFinalList.n1").value);    
    let resultado = await FundamentosMotoko_backend.add_final_list(n1);    
    document.getElementById("addFinalList.r").innerText  = resultado;
  }

  const removerItemList = async () => {
    let n1 = parseInt(document.getElementById("removerItemList.n1").value);    
    let resultado = await FundamentosMotoko_backend.remover_item_list(n1);    
    document.getElementById("removerItemList.r").innerText  = resultado;
  }

  const getList = async () => {    
    let resultado = await FundamentosMotoko_backend.get_list();    
    document.getElementById("getList.r").innerText  = resultado;
  }

  const getSizeList = async () => {    
    let resultado = await FundamentosMotoko_backend.get_size_list();    
    document.getElementById("getSizeList.r").innerText  = resultado;
  }

  const getItemList = async () => {    
    let n1 = parseInt(document.getElementById("getItemList.n1").value);    
    let resultado = await FundamentosMotoko_backend.get_item_list(n1);    
    document.getElementById("getItemList.r").innerText  = resultado;
  }

  const incluirItemIndexList = async () => {    
    let n1 = parseInt(document.getElementById("incluirItemIndexList.n1").value);    
    let n2 = parseInt(document.getElementById("incluirItemIndexList.n2").value);    
    let resultado = await FundamentosMotoko_backend.incluir_item_index_list(n1,n2);    
    document.getElementById("incluirItemIndexList.r").innerText  = resultado;
  }

  const getReverseList = async () => {        
    let resultado = await FundamentosMotoko_backend.get_reverse_list();    
    document.getElementById("getReverseList.r").innerText  = resultado;
  }

  const takeList = async () => {        
    let n1 = parseInt(document.getElementById("takeList.n1").value);    
    let resultado = await FundamentosMotoko_backend.take_list(n1);    
    document.getElementById("takeList.r").innerText  = resultado;
  }

  const dropList = async () => {    
    let n1 = parseInt(document.getElementById("dropList.n1").value);    
    let resultado = await FundamentosMotoko_backend.drop_list(n1);    
    document.getElementById("dropList.r").innerText  = resultado;
  }

  const toIterList = async () => {        
    let resultado = await FundamentosMotoko_backend.toIter_list();    
    document.getElementById("toIterList.r").innerText  = resultado;
  }

  const ordenarList = async () => {        
    let resultado = await FundamentosMotoko_backend.ordenar_list();    
    document.getElementById("ordenarList.r").innerText  = resultado;
  }

  ///##############               BUFFER

  const addFinalBuffer = async () => {    
    let n1 = parseInt(document.getElementById("addFinalBuffer.n1").value);    
    let resultado = await FundamentosMotoko_backend.add_final_buffer(n1);    
    document.getElementById("addFinalBuffer.r").innerText  = resultado;
  }

  const insertBuffer = async () => {    
    let n1 = parseInt(document.getElementById("insertBuffer.n1").value);    
    let n2 = parseInt(document.getElementById("insertBuffer.n2").value);    
    let resultado = await FundamentosMotoko_backend.insert_buffer(n1,n2);    
    document.getElementById("insertBuffer.r").innerText  = resultado;
  }

  const putBuffer = async () => {    
    let n1 = parseInt(document.getElementById("putBuffer.n1").value);    
    let n2 = parseInt(document.getElementById("putBuffer.n2").value);    
    let resultado = await FundamentosMotoko_backend.put_buffer(n1,n2);    
    document.getElementById("putBuffer.r").innerText  = resultado;
  }

  const removeBuffer = async () => {    
    let n1 = parseInt(document.getElementById("removeBuffer.n1").value);    
    let resultado = await FundamentosMotoko_backend.remove_buffer(n1);    
    document.getElementById("removeBuffer.r").innerText  = resultado;
  }

  const removeLastBuffer = async () => {      
    let resultado = await FundamentosMotoko_backend.remove_last_buffer();    
    document.getElementById("removeLastBuffer.r").innerText  = resultado;
  }

  const removeElementBuffer = async () => {      
    let n1 = parseInt(document.getElementById("removeElementBuffer.n1").value);    
    let resultado = await FundamentosMotoko_backend.remove_element_buffer(n1);    
    document.getElementById("removeElementBuffer.r").innerText  = resultado;
  }  

  const clearBuffer = async () => {    
    let resultado = await FundamentosMotoko_backend.clear_buffer();    
    document.getElementById("clearBuffer.r").innerText  = resultado;
  }

  const getItemBuffer = async () => {    
    let n1 = parseInt(document.getElementById("getItemBuffer.n1").value);    
    let resultado = await FundamentosMotoko_backend.get_item_buffer(n1);    
    document.getElementById("getItemBuffer.r").innerText  = resultado;
  }

  const getBuffer = async () => {    
    let resultado = await FundamentosMotoko_backend.get_buffer();    
    document.getElementById("getBuffer.r").innerText  = resultado;
  }

  const getSizeBuffer = async () => {    
    let resultado = await FundamentosMotoko_backend.get_size_buffer();    
    document.getElementById("getSizeBuffer.r").innerText  = resultado;
  }

  const ordenarBuffer = async () => {    
    let resultado = await FundamentosMotoko_backend.ordenar_buffer();    
    document.getElementById("ordenarBuffer.r").innerText  = resultado;
  }

  const ordenarDescBuffer = async () => {    
    let resultado = await FundamentosMotoko_backend.ordenar_desc_buffer();    
    document.getElementById("ordenarDescBuffer.r").innerText  = resultado;
  }

  const percorrerBuffer = async () => {    
    let resultado = await FundamentosMotoko_backend.percorrer_buffer();    
    document.getElementById("percorrerBuffer.r").innerText  = resultado;
  }  

  const putHashmap = async () => {    
    let c1 = document.getElementById("putHashmap.c1").value;    
    let n2 = parseInt(document.getElementById("putHashmap.n2").value);    
    let resultado = await FundamentosMotoko_backend.put_hashmap(c1,n2);    
    document.getElementById("putHashmap.r").innerText  = resultado;
  }  

  const [recordHashmap, setRecordHashmap] = useState([]);
  const putRecordHashmap = async () => {    
    let c1 = document.getElementById("putRecordHashmap.c1").value;    
    let c2 = document.getElementById("putRecordHashmap.c2").value;    
    let c3 = document.getElementById("putRecordHashmap.c3").value;    
    let c4 = document.getElementById("putRecordHashmap.c4").value;    
    let resultado = await FundamentosMotoko_backend.put_record_hashmap(c1,c2,c3,c4);    
    //document.getElementById("putRecordHashmap.r").innerText  = resultado;    
    setRecordHashmap(resultado);
  }  
  
  const removeRecordHashmap = async () => {    
    let c1 = document.getElementById("removeRecordHashmap.c1").value;    
    let resultado = await FundamentosMotoko_backend.remove_record_hashmap(c1);    
    //document.getElementById("removeRecordHashmap.r").innerText  = resultado;
    setRecordHashmap(resultado);
  }

  const replaceRecordHashmap = async () => {    
    let c1 = document.getElementById("replaceRecordHashmap.c1").value;    
    let c2 = document.getElementById("replaceRecordHashmap.c2").value;    
    let c3 = document.getElementById("replaceRecordHashmap.c3").value;    
    let c4 = document.getElementById("replaceRecordHashmap.c4").value;    

    let resultado = await FundamentosMotoko_backend.replace_record_hashmap(c1,c2, c3, c4);    
    //document.getElementById("replaceRecordHashmap.r").innerText  = resultado;
    setRecordHashmap(resultado);
  }  

  const keysHashmap = async () => {        
    let resultado = await FundamentosMotoko_backend.keys_hashmap();    
    document.getElementById("keysHashmap.r").innerText  = resultado;
  }  

  const putRbtree = async () => {    
    let n1 = parseInt(document.getElementById("putRbtree.n1").value);    
    let c2 = document.getElementById("putRbtree.c2").value;    
    let resultado = await FundamentosMotoko_backend.put_rbtree(n1,c2);    
    document.getElementById("putRbtree.r").innerText  = resultado;
  }  

  const replaceRbtree = async () => {    
    let n1 = parseInt(document.getElementById("replaceRbtree.n1").value);    
    let c2 = document.getElementById("replaceRbtree.c2").value;    
    let resultado = await FundamentosMotoko_backend.replace_rbtree(n1,c2);    
    document.getElementById("replaceRbtree.r").innerText  = resultado;
  } 

  const removeRbtree = async () => {    
    let n1 = parseInt(document.getElementById("removeRbtree.n1").value);    
    let resultado = await FundamentosMotoko_backend.remove_rbtree(n1);    
    document.getElementById("removeRbtree.r").innerText  = resultado;
  }
  
  const getRbtree = async () => {    
    let resultado = await FundamentosMotoko_backend.get_rbtree();    
    document.getElementById("getRbtree.r").innerText  = resultado;
  }

  return (
    <section>

      <h1>Operadores Numéricos</h1>
      <br/>

      <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Adição</h3>
        <p class="card-description"><pre>{`
 public func adicao(numero1: Int, numero2: Int) : async Int {
    var resultado : Int = numero1 + numero2; 
    return resultado;
 };`}</pre></p>                      
          <div class="inputs-container">
            <input type="number" class="input_num" id="adicao.n1" placeholder="Informe o Primeiro Número" /> +
            <input type="number" class="input_num" id="adicao.n2" placeholder="Informe o Segundo Número" /> =
            <label id="adicao.r" />
          </div>
                      
        <button class="card-button" onClick={adicao} >Executar</button>
        
      </div>
    </div>

    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Subtração</h3>
        <p class="card-description"><pre>{`
 public func subtracao(numero1: Int, numero2: Int) : async Int {
    var resultado : Int = numero1 - numero2; 
    return resultado;
 };`}</pre></p>
                      
          <div class="inputs-container">
            <input type="number" class="input_num" class="input_num" id="subtracao.n1" placeholder="Informe o Primeiro Número" /> -
            <input type="number" class="input_num" class="input_num" id="subtracao.n2" placeholder="Informe o Segundo Número" /> =
            <label id="subtracao.r" />
          </div>
                      
        <button class="card-button" onClick={subtracao} >Executar</button>
        
      </div>
    </div>

    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Multiplicação</h3>
        <p class="card-description"><pre>{`
 public func multiplicacao(numero1: Int, numero2: Int) : async Int {
    var resultado : Int = numero1 * numero2; 
    return resultado;
 };`}</pre></p>
                      
          <div class="inputs-container">
            <input type="number" class="input_num" class="input_num" id="multiplicacao.n1" placeholder="Informe o Primeiro Número" /> *
            <input type="number" class="input_num" class="input_num" id="multiplicacao.n2" placeholder="Informe o Segundo Número" /> =
            <label id="multiplicacao.r" />
          </div>
                      
        <button class="card-button" onClick={multiplicacao} >Executar</button>
        
      </div>
    </div>

    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Divisão</h3>
        <p class="card-description"><pre>{`
 public func divisao(numero1: Float, numero2: Float) : async Float {
    var resultado : Float = 0;
    if (numero1!=0 and numero2!=0) {
      resultado := numero1 / numero2; 
    };
    return resultado;
 };`}</pre></p>
                      
          <div class="inputs-container">
            <input type="number" class="input_num" class="input_num" id="divisao.n1" placeholder="Informe o Primeiro Número" /> /
            <input type="number" class="input_num" class="input_num" id="divisao.n2" placeholder="Informe o Segundo Número" /> =
            <label id="divisao.r" />
          </div>
                      
        <button class="card-button" onClick={divisao} >Executar</button>
        
      </div>
    </div>

    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Modulo</h3>
        <p class="card-description"><pre>{`
 public func modulo(numero1: Int, numero2: Int) : async Int {
    var resultado : Int = 0;
    if (numero1!=0 and numero2!=0) {
      resultado := numero1 % numero2; 
    };
    return resultado;
 };`}</pre></p>
                      
          <div class="inputs-container">
            <input type="number" class="input_num" class="input_num" id="modulo.n1" placeholder="Informe o Primeiro Número" /> %
            <input type="number" class="input_num" class="input_num" id="modulo.n2" placeholder="Informe o Segundo Número" /> =
            <label id="modulo.r" />
          </div>
                      
        <button class="card-button" onClick={modulo} >Executar</button>
        
      </div>
    </div>

    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Exponenciação</h3>
        <p class="card-description"><pre>{`
 public func exponenciacao(base: Int, expoente: Int) : async Int {
    var resultado : Int = 0;
    if (base!=0 and expoente!=0) {
      resultado := base ** expoente; 
    };
    return resultado;
 };`}</pre></p>
                      
          <div class="inputs-container">
            <input type="number" class="input_num" class="input_num" id="exponenciacao.n1" placeholder="Informe o Primeiro Número" /> **
            <input type="number" class="input_num" class="input_num" id="exponenciacao.n2" placeholder="Informe o Segundo Número" /> =
            <label id="exponenciacao.r" />
          </div>
                      
        <button class="card-button" onClick={exponenciacao} >Executar</button>
        
      </div>
    </div>

    <br/>
    <h1>Operadores Relacionais</h1>
    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Operador == (Igual)</h3>
        <p class="card-description"><pre>{`
 public func operador_igual(numero1: Int, numero2: Int) : async Bool {    
    return numero1 == numero2;
 };`}</pre></p>
                      
          <div class="inputs-container">
            <input type="number" class="input_num" class="input_num" id="operadorIgual.n1" placeholder="Informe o Primeiro Número" /> ==
            <input type="number" class="input_num" class="input_num" id="operadorIgual.n2" placeholder="Informe o Segundo Número" /> =
            <label id="operadorIgual.r" />
          </div>
                      
        <button class="card-button" onClick={operadorIgual} >Executar</button>
        
      </div>
    </div>
  
    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Operador != (Diferente)</h3>
        <p class="card-description"><pre>{`
public func operador_diferente(numero1: Int, numero2: Int) : async Bool {    
    return numero1 != numero2;
};`}</pre></p>
                  
      <div class="inputs-container">
        <input type="number" class="input_num" class="input_num" id="operadorDiferente.n1" placeholder="Informe o Primeiro Número" /> !=
        <input type="number" class="input_num" class="input_num" id="operadorDiferente.n2" placeholder="Informe o Segundo Número" /> =
        <label id="operadorDiferente.r" />
      </div>
                  
        <button class="card-button" onClick={operadorDiferente} >Executar</button>
        
      </div>
    </div>
  
    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Operador &lt;= (Menor ou Igual)</h3>
        <p class="card-description"><pre>{`
public func operador_menor_igual(numero1: Int, numero2: Int) : async Bool {    
    return numero1 <= numero2;
};`}</pre></p>
                  
      <div class="inputs-container">
        <input type="number" class="input_num" class="input_num" id="operadorMenorIgual.n1" placeholder="Informe o Primeiro Número" /> &lt;=
        <input type="number" class="input_num" class="input_num" id="operadorMenorIgual.n2" placeholder="Informe o Segundo Número" /> =
        <label id="operadorMenorIgual.r" />
      </div>
                  
        <button class="card-button" onClick={operadorMenorIgual} >Executar</button>
        
      </div>
    </div>

    <br/>

    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Operador &gt;= (Maior ou Igual)</h3>
        <p class="card-description"><pre>{`
public func operador_maior_igual(numero1: Int, numero2: Int) : async Bool {    
    return numero1 >= numero2;
};`}</pre></p>                  
      <div class="inputs-container">
        <input type="number" class="input_num" class="input_num" id="operadorMaiorIgual.n1" placeholder="Informe o Primeiro Número" /> &gt;=
        <input type="number" class="input_num" class="input_num" id="operadorMaiorIgual.n2" placeholder="Informe o Segundo Número" /> =
        <label id="operadorMaiorIgual.r" />
      </div>
                  
        <button class="card-button" onClick={operadorMaiorIgual} >Executar</button>
        
      </div>
    </div>

    <br/>
    
    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Operador &lt; (Maior)</h3>
        <p class="card-description"><pre>{`
public func operador_maior(numero1: Int, numero2: Int) : async Bool {    
    return numero1 < numero2;
};`}</pre></p>
                  
      <div class="inputs-container">
        <input type="number" class="input_num" class="input_num" id="operadorMaior.n1" placeholder="Informe o Primeiro Número" /> &lt;
        <input type="number" class="input_num" class="input_num" id="operadorMaior.n2" placeholder="Informe o Segundo Número" /> =
        <label id="operadorMaior.r" />
      </div>
                  
        <button class="card-button" onClick={operadorMaior} >Executar</button>
        
      </div>
    </div>

    <br/>
    
    <div class="modern-card">  
      <div class="card-content">
        <h3 class="card-title">Operador &gt; (Maior)</h3>
        <p class="card-description"><pre>{`
public func operador_menor(numero1: Int, numero2: Int) : async Bool {    
    return numero1 > numero2;
};`}</pre></p>
                  
      <div class="inputs-container">
        <input type="number" class="input_num" class="input_num" id="operadorMenor.n1" placeholder="Informe o Primeiro Número" /> &gt;
        <input type="number" class="input_num" class="input_num" id="operadorMenor.n2" placeholder="Informe o Segundo Número" /> =
        <label id="operadorMenor.r" ></label>
      </div>
                  
        <button class="card-button" onClick={operadorMenor} >Executar</button>
        
      </div>
    </div>

      <br/>
      <h1>Estrutura de Controle de Fluxo</h1>
      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title"> If/else</h3>
          <p class="card-description"><pre>{`
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
};`}</pre></p>                  
          <div class="inputs-container">
            <input type="number" class="input_num" class="input_num" id="ifElse.n1" placeholder="Informe o Primeiro Número" /> |
            <input type="number" class="input_num" class="input_num" id="ifElse.n2" placeholder="Informe o Segundo Número" /> =
            <label id="ifElse.r"></label>
          </div>                      
          <button class="card-button" onClick={ifElse} >Executar</button>          
        </div>
      </div>

      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title"> If boolean</h3>
          <p class="card-description"><pre>{`
 public func boolean_if(b : Bool) : async Nat {
     if (b) {
       return 1;
     };

     return 0;
 };`}</pre></p>                  
          <div class="inputs-container">
            <input type="text" class="input_text" class="input_text" id="booleanIf.b" placeholder="True/False" /> = 
            <label id="booleanIf.r" />
          </div>                      
          <button class="card-button" onClick={booleanIf} >Executar</button>          
        </div>
      </div>
 
      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title"> While</h3>
          <p class="card-description"><pre>{`
 public func while_loop(n : Nat) : async Text {

    var str : Text = "";
    var i = 0;

    while (i <= n){      
        i += 1;
        str := str # " Item: " # Nat.toText(i);
    };

    return str;
    
 };`}</pre></p>                  
          <div class="inputs-container">
            <input type="text" class="input_text" class="input_text" id="whileLoop.n1" placeholder="Informe um número" /> = 
            <label id="whileLoop.r" />
          </div>                      
          <button class="card-button" onClick={whileLoop} >Executar</button>          
        </div>
      </div>
 
      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title">For</h3>
          <p class="card-description"><pre>{`
 public func for_loop(n : Nat) : async Text {

    var str : Text = "";

    for ( i in Iter.range(0, n) ){    		
        str := str # " Item: " # Nat.toText(i);
    };

    return str;
 };`}</pre></p>                  
          <div class="inputs-container">
            <input type="text" class="input_text" class="input_text" id="forLoop.n1" placeholder="Informe um número" /> = 
            <label id="forLoop.r" />
          </div>                      
          <button class="card-button" onClick={forLoop} >Executar</button>
          
        </div>
      </div>
  
      <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Switch</h3>
            <p class="card-description"><pre>{`
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
 }; `}</pre></p>                    
            <div class="inputs-container">
              <input type="text" class="input_text" class="input_text" id="switchCondition.n1" placeholder="Informe um número" /> = 
              <label id="switchCondition.r" />
            </div>                        
            <button class="card-button" onClick={switchCondition} >Executar</button>            
          </div>
        </div>  

        <br/>
        <h1>Operadores Lógicos</h1>
        <br/>        

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Operador And</h3>
            <p class="card-description"><pre>{`
 public func operador_and(cond1 : Bool, cond2: Bool) : async Text {

    var resultado : Text = "Falso";    
    if (cond1 and cond2) {
        resultado := "Verdadeiro"      
    };  

    return resultado;
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="text" class="input_text" class="input_text" id="operadorAnd.b1" placeholder="True/False" /> And
                <input type="text" class="input_text" class="input_text" id="operadorAnd.b2" placeholder="True/False" /> =
                <label id="operadorAnd.r" />
              </div>
                          
            <button class="card-button" onClick={operadorAnd} >Executar</button>
            
          </div>
        </div>

        <br/>        

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Operador Or</h3>
            <p class="card-description"><pre>{`
 public func operador_or(cond1 : Bool, cond2: Bool) : async Text {

    var resultado : Text = "Falso";    
    if (cond1 or cond2) {
        resultado := "Verdadeiro"      
    };  

    return resultado;
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="text" class="input_text" class="input_text" id="operadorOr.b1" placeholder="True/False" /> Or
                <input type="text" class="input_text" class="input_text" id="operadorOr.b2" placeholder="True/False" /> =
                <label id="operadorOr.r" />
              </div>
                          
            <button class="card-button" onClick={operadorOr} >Executar</button>
            
          </div>
        </div>

        <br/>
        <h1>Estrutura de Dados</h1>
        <br/>        

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Adicionar em Array</h3>
            <p class="card-description"><pre>{`
 public func add_array(n : Nat) {
    arrayNumerosNat := Array.append(arrayNumerosNat, [n]);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="addArray.n1" placeholder="Informe um número" /> =                
                <label id="addArray.r" />
              </div>
                          
            <button class="card-button" onClick={addArray} >Executar</button>
            
          </div>
        </div>

        <br/>        

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Retornar Array</h3>
            <p class="card-description"><pre>{`
 public query func get_array() : async [Nat] {
     return arrayNumerosNat;
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="getArray.r" />
              </div>
                          
            <button class="card-button" onClick={getArray} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Remover Item do Array</h3>
            <p class="card-description"><pre>{`
 public func remove_array(n : Nat) : async [Nat] {
    arrayNumerosNat := Array.filter<Nat>(arrayNumerosNat, func(x) { x != n });
    return arrayNumerosNat;
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="removeArray.n1" placeholder="Informe um número" /> =
                <label id="removeArray.r" />
              </div>
                          
            <button class="card-button" onClick={removeArray} >Executar</button>
            
          </div>
        </div>

        <br/>        

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Tamanho do Array</h3>
            <p class="card-description"><pre>{`
 public func get_size_array() : async Nat {
    return arrayNumerosNat.size();
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="getSizeArray.r" />
              </div>
                          
            <button class="card-button" onClick={getSizeArray} >Executar</button>
            
          </div>
        </div>

        <br/>        

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Ordenar Array</h3>
            <p class="card-description"><pre>{`
 public func sort_array() : async [Nat] {
     return Array.sort(arrayNumerosNat, Nat.compare);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="sortArray.r" />
              </div>
                          
            <button class="card-button" onClick={sortArray} >Executar</button>
            
          </div>
        </div>
 
        <br/>        

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Percorrer valores em Array</h3>
            <p class="card-description"><pre>{`
 public func for_vals_array() : async Text {

    var resultado : Text = "";
    for (valor in arrayNumerosNat.vals() ){
        resultado #=  " - " # Nat.toText(valor);
    };

    return resultado;
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="forValsArray.r" />
              </div>
                          
            <button class="card-button" onClick={forValsArray} >Executar</button>
            
          </div>
        </div>      

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Procurar no Array</h3>
            <p class="card-description"><pre>{`
 public func find_array(n : Nat) : async ?Nat {

    func procurar(n1:Nat): Bool {
      n1 == n;
    };

    return Array.find(arrayNumerosNat, procurar);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="findArray.n1" placeholder="Informe um número" /> =
                <label id="findArray.r" />
              </div>
                          
            <button class="card-button" onClick={findArray} >Executar</button>
            
          </div>
        </div>
         
        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Reverter Array</h3>
            <p class="card-description"><pre>{`
 public func reverse_array() : async [Nat] {
    return Array.reverse(arrayNumerosNat);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="reverseArray.r" />
              </div>
                          
            <button class="card-button" onClick={reverseArray} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Comparar Dois Arrays</h3>
            <p class="card-description"><pre>{`
 var arrayNumerosNatInit : [Nat] = [1, 2, 3, 4, 5]; 
 public func equal_array() : async Bool {

    func numeroIgual(n1: Nat, n2: Nat) : Bool {
        n1 == n2;
    };

    return Array.equal(arrayNumerosNat, arrayNumerosNatInit, numeroIgual);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="equalArray.r" />
              </div>
                          
            <button class="card-button" onClick={equalArray} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Aplicar Filtro em Array</h3>
            <p class="card-description"><pre>{`
 public func apenas_par_array() : async [Nat] {

    func numeroPar(n1: Nat) : Bool {
        n1 % 2 == 0;
    };

    return Array.filter(arrayNumerosNat, numeroPar);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="apenasParArray.r" />
              </div>
                          
            <button class="card-button" onClick={apenasParArray} >Executar</button>
            
          </div>
        </div>                      

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Adicionar no Início do List</h3>
            <p class="card-description"><pre>{`
  public func add_inicio_list(n : Int) : async List.List<Int> {    
      listInt := List.push(n,listInt);    
      return listInt;
  };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="addInicioList.n1" placeholder="Informe um número" /> =
                <label id="addInicioList.r" />
              </div>
                          
            <button class="card-button" onClick={addInicioList} >Executar</button>
            
          </div>
        </div>  

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Adicionar no Final do List</h3>
            <p class="card-description"><pre>{`
 public func add_final_list(nr : Int) : async List.List<Int> {
    listInt := List.append(listInt, List.push(nr, List.nil()) );
    return listInt;
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="addFinalList.n1" placeholder="Informe um número" /> =
                <label id="addFinalList.r" />
              </div>
                          
            <button class="card-button" onClick={addFinalList} >Executar</button>
            
          </div>
        </div>
  
        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Remover Item do List</h3>
            <p class="card-description"><pre>{`
  public func remover_item_list(nr : Int) : async List.List<Int> {
      listInt := List.filter(listInt, func (x : Int) : Bool { x != nr });    
      return listInt;
  };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="removerItemList.n1" placeholder="Informe um número" /> =
                <label id="removerItemList.r" />
              </div>
                          
            <button class="card-button" onClick={removerItemList} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Retornar List</h3>
            <p class="card-description"><pre>{`
 public query func get_list() : async List.List<Int> {
    return listInt;
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="getList.r" />
              </div>
                          
            <button class="card-button" onClick={getList} >Executar</button>
            
          </div>
        </div>
  
        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Tamanho do List</h3>
            <p class="card-description"><pre>{`
  public query func get_size_list() : async Nat {
      return List.size(listInt);
  };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="getSizeList.r" />
              </div>
                          
            <button class="card-button" onClick={getSizeList} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Retornar o Item de um Índice</h3>
            <p class="card-description"><pre>{`
 public query func get_item_list(indice : Nat) : async ?Int {
    return List.get<Int>(listInt, indice);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="getItemList.n1" placeholder="Informe um índice" /> =
                <label id="getItemList.r" />
              </div>
                          
            <button class="card-button" onClick={getItemList} >Executar</button>
            
          </div>
        </div>
 
        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Incluir um Item em um Índice Específico</h3>
            <p class="card-description"><pre>{`
  public func incluir_item_index_list(valor: Int, index: Nat) : async List.List<Int> {
      let (lista1, lista2 ) = List.split<Int>(index, listInt);
      var nova_lista : List.List<Int> = List.append(lista1, List.push(valor, List.nil()) );
      listInt := List.append(nova_lista, lista2 );
      return listInt;
  };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="incluirItemIndexList.n1" placeholder="Informe um número" /> 
                <input type="number" class="input_num" class="input_num" id="incluirItemIndexList.n2" placeholder="Informe um índice" /> =
                <label id="incluirItemIndexList.r" />
              </div>
                          
            <button class="card-button" onClick={incluirItemIndexList} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Reverter List</h3>
            <p class="card-description"><pre>{`
 public query func get_reverse_list() : async List.List<Int> {
    return List.reverse(listInt);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="getReverseList.r" />
              </div>
                          
            <button class="card-button" onClick={getReverseList} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Retornar Elementos do Inicio da Lista</h3>
            <p class="card-description"><pre>{`
 public query func take_list(nr : Nat) : async List.List<Int> {
    return List.take<Int>(listInt, nr);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="takeList.n1" placeholder="Informe Quantidade" /> =
                <label id="takeList.r" />
              </div>
                          
            <button class="card-button" onClick={takeList} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Remover do Inicio do List a Quantidade de Elementos Informada</h3>
            <p class="card-description"><pre>{`
 public func drop_list(nr : Nat) : async List.List<Int> {
    return List.drop<Int>(listInt, nr);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="dropList.n1" placeholder="Informe Quantidade" /> =
                <label id="dropList.r" />
              </div>
                          
            <button class="card-button" onClick={dropList} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Percorrer List</h3>
            <p class="card-description"><pre>{`
 public query func toIter_list() : async Text {
    var str : Text = "";
    for( value in List.toIter(listInt) ) {
        str #= " - " # Int.toText(value);
    };
    return str;
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="toIterList.r" />
              </div>
                          
            <button class="card-button" onClick={toIterList} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Ordernar List</h3>
            <p class="card-description"><pre>{`
 public query func ordenar_list() : async List.List<Int> {
    
    let ordenar = func (a: Int, b: Int) : Order.Order {
      if (a < b) { #less }
      else if (a > b) { #greater }
      else { #equal }
    };

    return Iter.toList(Iter.sort(List.toIter(listInt), ordenar));

 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="ordenarList.r" />
              </div>
                          
            <button class="card-button" onClick={ordenarList} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Adicionar Elemento no Final do Buffer</h3>
            <p class="card-description"><pre>{`
 public func add_final_buffer(n : Int) : async [Int] {    
    bufferA.add(n);
    return Buffer.toArray(bufferA);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="addFinalBuffer.n1" placeholder="Informe Quantidade" /> =
                <label id="addFinalBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={addFinalBuffer} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Incluir um Elemento em um Índice Específico</h3>
            <p class="card-description"><pre>{`
  public func insert_buffer(indice : Nat, valor : Int) : async [Int] {    
      bufferA.insert(indice, valor);
      return Buffer.toArray(bufferA);
  };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="insertBuffer.n1" placeholder="Informe um número" /> 
                <input type="number" class="input_num" class="input_num" id="insertBuffer.n2" placeholder="Informe um índice" /> =
                <label id="insertBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={insertBuffer} >Executar</button>
            
          </div>
        </div>    

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Sobreescreve/Altera um Elemento em um Índice Específico</h3>
            <p class="card-description"><pre>{`
  public func put_buffer(indice : Nat, valor : Int) : async [Int] {    
      bufferA.put(indice, valor);
      return Buffer.toArray(bufferA);
  };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="putBuffer.n1" placeholder="Informe um índice" /> 
                <input type="number" class="input_num" class="input_num" id="putBuffer.n2" placeholder="Informe um número" /> =
                <label id="putBuffer.r" />
              </div>
                          
              <button class="card-button" onClick={putBuffer} >Executar</button>
             
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Remove o Elemento Correspondente ao Índice Informado</h3>
            <p class="card-description"><pre>{`
 public func remove_buffer(indice : Nat) : async [Int] {    
     let ex = bufferA.remove(indice); // ex recebe o elemento removido
     return Buffer.toArray(bufferA);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="removeBuffer.n1" placeholder="Informe Quantidade" /> =
                <label id="removeBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={removeBuffer} >Executar</button>
            
          </div>
        </div>
        
        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Retorna o Elemento Correspondente ao Índice Informado</h3>
            <p class="card-description"><pre>{`
 public func get_item_buffer(indice : Nat) : async Int {        
     return bufferA.get(indice);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="getItemBuffer.n1" placeholder="Informe Quantidade" /> =
                <label id="getItemBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={getItemBuffer} >Executar</button>
            
          </div>
        </div>
 
         <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Ordernar Buffer</h3>
            <p class="card-description"><pre>{`
 public query func ordenar_buffer() : async [Int] {
    bufferA.sort(Int.compare);
    return Buffer.toArray(bufferA);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="ordenarBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={ordenarBuffer} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Retorna o Buffer</h3>
            <p class="card-description"><pre>{`
 public query func get_buffer() : async [Int] {
     return Buffer.toArray(bufferA);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="getBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={getBuffer} >Executar</button>
            
          </div>
        </div>

         <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Orderna em Ordem Decrescente o Buffer</h3>
            <p class="card-description"><pre>{`
 public query func ordenar_desc_buffer() : async [Int] {     

    bufferA.sort(func(a, b) : Order.Order {
        if (a < b) { #greater } 
        else if (a > b) { #less } 
        else { #equal }
    });
  
    return Buffer.toArray(bufferA);

};`}</pre></p>                          
              <div class="inputs-container">                
                <label id="ordenarDescBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={ordenarDescBuffer} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Tamanho do Buffer</h3>
            <p class="card-description"><pre>{`
 public query func get_size_buffer() : async Nat {
    return bufferA.size();
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="getSizeBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={getSizeBuffer} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Percorre Todos os Elementos do Buffer</h3>
            <p class="card-description"><pre>{`
 public query func percorrer_buffer() : async Text {
     var str : Text = "";
     for( value in bufferA.vals() ) {
         str #= " - " # Int.toText(value);
     };
     return str;
 }`}</pre></p>                          
              <div class="inputs-container">                
                <label id="percorrerBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={percorrerBuffer} >Executar</button>
            
          </div>
        </div>
        
        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Remove o Último Elemento do Buffer</h3>
            <p class="card-description"><pre>{`
 public func remove_last_buffer() : async [Int] {    
     let ex = bufferA.removeLast(); 
     return Buffer.toArray(bufferA);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="removeLastBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={removeLastBuffer} >Executar</button>
            
          </div>
        </div>
        
        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Remove Todos os Elementos do Buffer</h3>
            <p class="card-description"><pre>{`
 public func clear_buffer() : async [Int] {    
    bufferA.clear();
    return Buffer.toArray(bufferA);
 };`}</pre></p>                          
              <div class="inputs-container">                
                <label id="clearBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={clearBuffer} >Executar</button>
            
          </div>
        </div>
        
        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Remove Todos os Elementos Iguais ao Passado como Parâmetro</h3>
            <p class="card-description"><pre>{`
 public func remove_element_buffer(n : Int) : async [Int] {    
     bufferA.filterEntries(func (i, x) = x != n); 
     return Buffer.toArray(bufferA);
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="removeElementBuffer.n1" placeholder="Informe um Número" /> =
                <label id="removeElementBuffer.r" />
              </div>
                          
            <button class="card-button" onClick={removeElementBuffer} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Exemplo de Record</h3>
            <p class="card-description"><pre>{`
  type Pessoa = {
    nome : Text;
    email : Text;
    cidade : Text;
    uf : Text;
  };`}</pre></p>                          
              <div class="inputs-container">        
              </div>                      
          </div>
        </div>

      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title">Adiciona a Chave/Valor no Hashmap</h3>
          <p class="card-description"><pre>{`
  public func put_hashmap(chave: Text, numero: Nat) : async [(Text, Nat)] {
      mapA.put(chave, numero);
      return Iter.toArray(mapA.entries());
  };`}</pre></p>                          
            <div class="inputs-container">
              <input type="text" class="input_text" class="input_text" id="putHashmap.c1" placeholder="Informe o Nome" /> 
              <input type="number" class="input_num" class="input_num" id="putHashmap.n2" placeholder="Informe um Número" /> 
              <label id="putHashmap.r" />
            </div>
                        
          <button class="card-button" onClick={putHashmap} >Executar</button>
          
        </div>
      </div>

      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title">Adiciona a Chave/Valor no Hashmap (O Valor é um Record)</h3>
          <p class="card-description"><pre>{`
  public func put_record_hashmap(nome: Text, email: Text, cidade: Text, uf: Text) : async [(Text, Pessoa)] {
      let pessoa : Pessoa = {nome = nome; email = email; cidade = cidade; uf = uf};
      mapB.put(nome, pessoa);
      return Iter.toArray(mapB.entries());
  };`}</pre></p>                          
            <div class="inputs-container">
              <input type="text" class="input_text" class="input_text" id="putRecordHashmap.c1" placeholder="Informe o Nome" /> 
              <input type="text" class="input_text" class="input_text" id="putRecordHashmap.c2" placeholder="Informe o E-mail" /> 
              <input type="text" class="input_text" class="input_text" id="putRecordHashmap.c3" placeholder="Informe a Cidade" /> 
              <input type="text" class="input_text" class="input_text" id="putRecordHashmap.c4" placeholder="Informe a UF" /> 
              <label id="putRecordHashmap.r" />              
            </div>                              
              <table style={{ border: '1px solid black', borderCollapse: 'collapse' }} >
                <thead>
                  <tr>
                    <th style={{ border: '1px solid black' }} >Nome</th>
                    <th style={{ border: '1px solid black' }} >E-mail</th>
                    <th style={{ border: '1px solid black' }} >Cidade</th>
                    <th style={{ border: '1px solid black' }} >UF</th>
                  </tr>
                </thead>
                <tbody>
                {recordHashmap.map(([chave, pessoa]) => (
                    <tr key={chave}>                     
                      <td style={{ border: '1px solid black' }} >{pessoa.nome}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.email}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.cidade}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.uf}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
              <br/>
            <button class="card-button" onClick={putRecordHashmap} >Executar</button>    
        </div>
      </div>

      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title">Remove o Elemento Correspondente a Chave Informada</h3>
          <p class="card-description"><pre>{`
  public func remove_record_hashmap(nome: Text) : async [(Text, Pessoa)] {
      let pessoaRemovida = mapB.remove(nome);    
      return Iter.toArray(mapB.entries());
  };`}</pre></p>                          
            <div class="inputs-container">
              <input type="text" class="input_text" class="input_text" id="removeRecordHashmap.c1" placeholder="Informe o Nome" />              
            </div>                  
              <table style={{ border: '1px solid black', borderCollapse: 'collapse' }} >
                <thead>
                  <tr>
                    <th style={{ border: '1px solid black' }} >Nome</th>
                    <th style={{ border: '1px solid black' }} >E-mail</th>
                    <th style={{ border: '1px solid black' }} >Cidade</th>
                    <th style={{ border: '1px solid black' }} >UF</th>
                  </tr>
                </thead>
                <tbody>
                {recordHashmap.map(([chave, pessoa]) => (
                    <tr key={chave}>                     
                      <td style={{ border: '1px solid black' }} >{pessoa.nome}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.email}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.cidade}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.uf}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
              <br/>
            <button class="card-button" onClick={removeRecordHashmap} >Executar</button>    
        </div>
      </div>

      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title">Altera o Elemento Correspondente a Chave Informada</h3>
          <p class="card-description"><pre>{`
  public func replace_record_hashmap(nome: Text, email: Text, cidade: Text, uf: Text) : async [(Text, Pessoa)] {    
      let pessoa : Pessoa = {nome = nome; email = email; cidade = cidade; uf = uf};
      let pessoaAlterada = mapB.replace(nome, pessoa);
      return Iter.toArray(mapB.entries());
  };`}</pre></p>                          
            <div class="inputs-container">
              <input type="text" class="input_text" id="replaceRecordHashmap.c1" placeholder="Informe o Nome" /> 
              <input type="text" class="input_text" id="replaceRecordHashmap.c2" placeholder="Informe o E-mail" /> 
              <input type="text" class="input_text" id="replaceRecordHashmap.c3" placeholder="Informe a Cidade" /> 
              <input type="text" class="input_text" id="replaceRecordHashmap.c4" placeholder="Informe a UF" />               
            </div>         
            <table style={{ border: '1px solid black', borderCollapse: 'collapse' }} >
                <thead>
                  <tr>
                    <th style={{ border: '1px solid black' }} >Nome</th>
                    <th style={{ border: '1px solid black' }} >E-mail</th>
                    <th style={{ border: '1px solid black' }} >Cidade</th>
                    <th style={{ border: '1px solid black' }} >UF</th>
                  </tr>
                </thead>
                <tbody>
                {recordHashmap.map(([chave, pessoa]) => (
                    <tr key={chave}>                     
                      <td style={{ border: '1px solid black' }} >{pessoa.nome}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.email}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.cidade}</td>
                      <td style={{ border: '1px solid black' }} >{pessoa.uf}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
              <br/>         
            <button class="card-button" onClick={replaceRecordHashmap} >Executar</button>    
        </div>
      </div>
        
      <br/>

      <div class="modern-card">  
        <div class="card-content">
          <h3 class="card-title">Retorna as Chaves do Hashmap</h3>
          <p class="card-description"><pre>{`
  public func keys_hashmap() : async [Text] {        
      let iter : Iter.Iter<Text> = mapB.keys();    
      return Iter.toArray<Text>(iter);
  };`}</pre></p>                          
            <div class="inputs-container">        
              <label id="keysHashmap.r" />
            </div>
                        
          <button class="card-button" onClick={keysHashmap} >Executar</button>
          
        </div>
      </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Adicionar o Par Chave/Valor no RBTree</h3>
            <p class="card-description"><pre>{`
 public func put_rbtree(chave: Nat, texto: Text) : async [(Nat, Text)] {
     tree.put(chave, texto);
     return Iter.toArray(tree.entries());
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="putRbtree.n1" placeholder="Informe a Chave" /> 
                <input type="text" class="input_text" id="putRbtree.c2" placeholder="Informe o Valor" /> =
                <label id="putRbtree.r" />
              </div>
                          
            <button class="card-button" onClick={putRbtree} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Sobreecreve/Altera o Elemento Correspondente a Chave Informada</h3>
            <p class="card-description"><pre>{`
 public func replace_rbtree(chave: Nat, texto: Text) : async [(Nat, Text)] {
    let valor_antigo = tree.replace(chave, texto);
    return Iter.toArray(tree.entries());
 };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="replaceRbtree.n1" placeholder="Informe a Chave" /> 
                <input type="text" class="input_text" id="replaceRbtree.c2" placeholder="Informe Valor" /> =
                <label id="replaceRbtree.r" />
              </div>
                          
            <button class="card-button" onClick={replaceRbtree} >Executar</button>
            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Remove o Elemento Correspondente a Chave Informada</h3>
            <p class="card-description"><pre>{`
  public func remove_rbtree(chave: Nat) : async [(Nat, Text)] {
      let item_removido = tree.remove(chave);
      return Iter.toArray(tree.entries());
  };`}</pre></p>                          
              <div class="inputs-container">
                <input type="number" class="input_num" class="input_num" id="removeRbtree.n1" placeholder="Informe a Chave" /> =
                <label id="removeRbtree.r" />
              </div>                          
              <button class="card-button" onClick={removeRbtree} >Executar</button>            
          </div>
        </div>

        <br/>

        <div class="modern-card">  
          <div class="card-content">
            <h3 class="card-title">Retorna o RBTree</h3>
            <p class="card-description"><pre>{`
 public query func get_rbtree() : async [(Nat, Text)] {
    Iter.toArray(tree.entries())
 };`}</pre></p>                          
              <div class="inputs-container">
                <label id="getRbtree.r" />
              </div>                          
              <button class="card-button" onClick={getRbtree} >Executar</button>            
          </div>
        </div>

    </section>
    
  );
}

export default App;