using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.IO;
using System.Text;

public class Usuarios : MonoBehaviour
{
  public string server = "http://localhost/iko-learns/usuarios";

  private IEnumerator requestObtenerUsuario(string id_fb)
  {
  	UnityWebRequest request = UnityWebRequest.Get(server + "/obtenerUsuario.php?id_fb=" + id_fb);
  	yield return request.Send();

  	debugRequest(request);
  }

  private  IEnumerator requestRegistrarPuntos(string id_usuario, string puntos, string accion)
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/registrarPuntos.php?id_usuario="+ id_usuario +"&puntos="+ puntos +"&accion"+ accion);
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


  public void ObtenerUsuario(string id_fb)
  {
    StartCoroutine(requestObtenerUsuario(id_fb));
  }

  public void RegistrarPuntos(string id_usuario, string puntos, string accion)
  {
  	StartCoroutine(requestRegistrarPuntos(id_usuario, puntos, accion));
  }

}
