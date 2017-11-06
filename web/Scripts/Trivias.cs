  using UnityEngine;
  using UnityEngine.UI;
  using UnityEngine.Networking;
  using System.Collections;
  using System.Collections.Generic;
  using System.Net;
  using System.IO;
  using System.Text;

  [SerializeField]
  class Pregunta{
    public string id;
    public string pregunta;
    public string opcion_a;
    public string opcion_b;
    public string opcion_c;
    public string opcion_d;
    public string respuesta_correcta;
  }

  public class Trivias : MonoBehaviour
  {
    public string server = "http://localhost/iko-learns/trivias";

    private IEnumerator requestObtenerTrivia()
    {
    	UnityWebRequest request = UnityWebRequest.Get(server + "/obtenerTrivia.php");
    	yield return request.Send();

    	debugRequest(request);
    }

    private  IEnumerator requestObtenerRetosDisponibles()
    {
      UnityWebRequest request = UnityWebRequest.Get(server + "/obtenerRetosDisponibles.php");
    	yield return request.Send();

    	debugRequest(request);
    }

    private  IEnumerator requestCrearReto(string id_retador, string id_retado)
    {
      UnityWebRequest request = UnityWebRequest.Get(server + "/crearReto.php?id_retador="+ id_retador +"&id_retado=" + id_retado);
    	yield return request.Send();

    	debugRequest(request);
    }

    private  IEnumerator requestAceptarReto(string id_reto, string id_usuario)
    {
      UnityWebRequest request = UnityWebRequest.Get(server + "/aceptarReto.php?id_reto="+ id_reto +"&id_usuario=" + id_usuario);
    	yield return request.Send();

    	debugRequest(request);
    }

    private void debugRequest(UnityWebRequest request){
    	print("request completed with code: " + request.responseCode);

    	if (request.isNetworkError)
    	{
    		print("Error: " + request.error);
    	}
    	else
    	{
    		print("Request Response: " + request.downloadHandler.text);
    	}
    }

    public void ObtenerRetosDisponibles()
    {
      StartCoroutine(requestObtenerRetosDisponibles());
    }

    public void ObtenerTrivia()
    {
    	StartCoroutine(requestObtenerTrivia());
    }

    public void CrearReto(string id_retador, string id_retado)
    {
      StartCoroutine(requestCrearReto(id_retador, id_retado));
    }

    public void AceptarReto(string id_reto, string id_usuario)
    {
      StartCoroutine(requestAceptarReto(id_reto, id_usuario));
  }


  }
