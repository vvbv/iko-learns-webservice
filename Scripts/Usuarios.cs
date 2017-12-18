using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.IO;
using System.Text;


  [SerializeField]
  class RegistrarPuntos{
    public RegistrarPuntos(string id_facebook, int puntos, int nivel){
      this.id_facebook = id_facebook;
      this.puntos = puntos;
      this.nivel = nivel;
    }
    public string id_facebook;
    public int puntos;
    public int nivel;
  }

  [SerializeField]
  class ObtenerProgreso{
    public ObtenerProgreso(string id_usuario, int nivel, int progreso){
      this.id_usuario = id_usuario;
      this.nivel = nivel;
      this.progreso = progreso;
    }
    public string id_usuario;
    public int nivel;
    public int progreso;
  }

  [SerializeField]
  class ObtenerPuntos{
    public ObtenerPuntos(string id, int puntos){
      this.id = id;
      this.puntos = puntos;
    }
    public string id;
    public int puntos;
  }

  [SerializeField]
  class ObtenerTop{
    public ObtenerTop(string id_usuario, int puntos){
      this.id_usuario = id_usuario;
      this.puntos = puntos;
    }
    public string id_usuario;
    public int puntos;
  }

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

  private  IEnumerator requestRegistrarUsuario(string id_fb, string username, string nombres, string apellidos, string password, int nivel)
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/registrarUsuario.php?id_fb="+ id_fb +"&username="+ username +"&nombres"+ nombres +"&apellidos"+ apellidos +"&password"+ password +"&nivel"+ nivel );
  	yield return request.Send();

  	debugRequest(request);
  }


  private  IEnumerator requestObtenerProgreso(string id_facebook)
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/obtenerProgreso.php?id_facebook="+ id_facebook);
  	yield return request.Send();

  	debugRequest(request);
  }

  private  IEnumerator requestObtenerPuntos()
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/obtenerPuntos.php");
  	yield return request.Send();

  	debugRequest(request);
  }

  private  IEnumerator requestObtenerTop()
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/obtenerTop.php");
    yield return request.Send();

    debugRequest(request);
  }

  private  IEnumerator requestObtenerTopSemanal()
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/obtenerTopSemanal.php");
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

  public void RegistrarUsuario(string id_fb, string username, string nombres, string apellidos, string password, int nivel)
  {
    StartCoroutine(requestRegistrarUsuario(id_fb, username, nombres, apellidos, password, nivel));
  }

  public void RegistrarPuntos(string id_usuario, string puntos, string accion)
  {
  	StartCoroutine(requestRegistrarPuntos(id_usuario, puntos, accion));
  }

  public void ObtenerProgreso(string id_facebook)
  {
    StartCoroutine(requestObtenerProgreso(id_facebook));
  }

  public void ObtenerPuntos()
  {
    StartCoroutine(requestObtenerPuntos());
  }

  public void ObtenerTop()
  {
    StartCoroutine(requestObtenerTop());
  }

  public void ObtenerTopSemanal()
  {
    StartCoroutine(requestObtenerTopSemanal());
  }

}
