/*
 * StringUtils.
 *
 * Versión 1.0 - Agosto 2007
 *
 * Utilidades para el manejo de cadenas de caracteres.
 */
package com.davidvalverde.utils {
/**
 * 
 */
public class StringUtils {
	
	/**
	 * Tecla TAB: Tabulador.
	 */
	private static const TAB = 9;
	
	/**
	 * Tecla LINEFEED: Salto de línea.
	 */
	private static const LINEFEED = 10;
	
	/**
	 * Tecla CARRIAGE: Retorno de carro.
	 */
	private static const CARRIAGE = 13;
	
	/**
	 * Tecla SPACE: Espacio.
	 */
	private static const SPACE = 32;

	/**
	 * getCharsArray(stTarget, bHasBlankSpace=true)<br/>
	 * <p>Convierte una cadena de caracteres en un array de caracteres.</p>
	 *
	 * @param stTarget String cadena de caracteres original.
	 * @param bHasBlankSpace Boolean indica si también se incluirán los espacios en blanco(true) o se
	 *                               eliminarán.
	 *
	 * @return Array el array de caracteres de la cadena.
	 */
	public static function getCharsArray(stTarget: String, bHasBlankSpace: Boolean = true): Array {
		
 		var stTemp: String = stTarget;
		
		if (bHasBlankSpace == false) {
			stTemp = replace(stTarget, " ", "");	// elimina todos los espacios en blanco
		} 		
 		
		return stTemp.split("");
		
 	}
	
	/**
	 * replace(stTarget, stOld, stNew)<br/>
	 * <p>Reemplaza contenido de una cadena de caracteres.</p>
	 * 
	 * @param stTarget String cadena de caracteres donde se va a realizar la operación.
	 * @param stOld String cadena a sustituir.
	 * @param stNew String nueva cadena a insertar.
	 * 
	 * @return String la nueva cadena modificada.
	 */
	public static function replace(stTarget: String, stOld: String, stNew: String): String {
		
 		return stTarget.split(stOld).join(stNew);
 		
 	}

	/**
	 * startsWith(stTarget, stSub)<br/>
	 * <p>Indica si la cadena de caracteres empieza con una cadena indicada.</p>
	 *
	 * @param stTarget String cadena de caracteres original.
	 * @param stSub String cadena a buscar al comienzo de stTarget.
	 *
	 * @return Boolean indica el éxito de la búsqueda del patrón.
	 */
	public static function startsWith(stTarget: String, stSub: String): Boolean {
		
 		return (stTarget.indexOf(stSub) == 0);	
		
 	}
	
	/**
	 * endsWith(stTarget, stSub)<br/>
	 * <p>Indica si la cadena de caracteres termina con una cadena indicada.</p>
	 *
	 * @param stTarget String cadena de caracteres original.
	 * @param stSub String cadena a buscar al final de stTarget.
	 *
	 * @return Boolean indica el éxito de la búsqueda del patrón.
	 */
	public static function endsWith(stTarget: String, stSub: String): Boolean {
		
 		return (stTarget.lastIndexOf(stSub) == (stTarget.length - stSub.length));	
		
 	}
	
	/**
	 * trim(st)<br>
	 * <p>Elimina los espacios en blanco a la izquierda y a la derecha del String.</p>
	 * 
	 * @param st String a modificar
	 * 
	 * @return String modificado
	 */
	public static function trim(st: String): String {
		
		return ltrim(rtrim(st));
		
	}

	/**
	 * ltrim(st)<br>
	 * <p>Elimina los espacios en blanco a la izquierda del String.</p>
	 * 
	 * @param st String a modificar
	 * 
	 * @return String modificado
	 */
	public static function ltrim(st: String): String {
		
		var i: int = 0;
		   
		while (st.charCodeAt(i) == SPACE || st.charCodeAt(i) == CARRIAGE 
		       || st.charCodeAt(i) == LINEFEED || st.charCodeAt(i) == TAB) {
			i++;
		}   
		
		return st.substring(i, st.length);
   
	}

	/**
	 * rtrim(st)<br>
	 * <p>Elimina los espacios en blanco a la derecha del String.</p>
	 * 
	 * @param st String a modificar
	 * 
	 * @return String modificado
	 */
	public static function rtrim(st: String): String {
		
		var i: int = st.length - 1;
      
		while (st.charCodeAt(i) == SPACE || st.charCodeAt(i) == CARRIAGE 
		       || st.charCodeAt(i) == LINEFEED || st.charCodeAt(i) == TAB) {
			i--;
		}
      
		return st.substring(0, i + 1);
   
	}
	
	/**
	 * ucFirst(st: String)<br>
	 * <p>Pone en mayúsculas la primera letra del String.</p>
	 * 
	 * @param st String a modificar
	 * 
	 * @return String modificado
	 */
	public static function ucFirst(st: String): String {
		
		return st.substring(0, 1).toUpperCase() + st.substring(1, st.length);
		
	}
	
	/**
	 * ucWords(st: String)<br>
	 * <p>Pone en mayúsculas la primera letra de cada palabra del String.</p>
	 * 
	 * @param st String a modificar
	 * 
	 * @return String modificado
	 */
	public static function ucWords(st: String): String {
		
		var rgstWords: Array;
		var stFinal: String = "";
		var iWords: int = 0;
		var i: int = 0;
		
		rgstWords = new Array();
		rgstWords = st.split(" ");
		iWords = rgstWords.length;
		
		for (i = 0; i < iWords; i++) {
			stFinal += rgstWords[i].substring(0, 1).toUpperCase() 
			           + rgstWords[i].substring(1, rgstWords[i].length) + " ";
		}
		
		return stFinal;
		
	}
	
}
}