using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.IO;
using System.Text;


public class PowerUps : MonoBehaviour
{
  public string server = "http://localhost/iko-learns/powerups";

  private IEnumerator requestConsultarPowerUps(string id_fb, string id_power)
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/consultarPowerups.php?id_fb="+ id_fb +"&id_power=" + id_power);
    yield return request.Send();

    debugRequest(request);
  }

  private  IEnumerator requestModificarPowerups(string id_usuario, int cantidad, string accion, string id_power)
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/modificarPowerups.php?id_usuario="+ id_usuario +"&cantidad=" + cantidad +"&accion=" + accion +"&id_power=" + id_power);
    yield return request.Send();

    debugRequest(request);
  }

  private  IEnumerator requestCantidadPowerups(string id_fb, string id_power)
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/cantidadPowerups.php?id_fb="+ id_fb +"&id_power=" + id_power);
    yield return request.Send();

    debugRequest(request);
  }

  private  IEnumerator requestTienePowerups(string id_fb)
  {
    UnityWebRequest request = UnityWebRequest.Get(server + "/tienePowerups.php?id_fb="+ id_fb);
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

  public void ConsultarPowerUps(string id_fb, string id_power)
  {
    StartCoroutine(requestConsultarPowerUps(id_fb, id_power));
  }

  public void ModificarPowerups(string id_usuario, int cantidad, string accion, string id_power)
  {
    StartCoroutine(requestModificarPowerups(id_usuario, cantidad, accion, id_power));
  }

  public void CantidadPowerups(string id_fb, string id_power)
  {
    StartCoroutine(requestCantidadPowerups(id_fb, id_power));
  }

  public void TienePowerups(string id_fb)
  {
    StartCoroutine(requestTienePowerups(id_fb));
  }

}
