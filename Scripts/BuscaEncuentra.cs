using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.IO;
using System.Text;

[SerializeField]
class Palabra{
  public string id;
  public string palabra;
  public string palabra_yolo;
}

public class BuscaEncuentra : MonoBehaviour
{
  public string server = "http://localhost/iko-learns/busca_encuentra";

  private IEnumerator requestObtenerPalabra()
  {
  	UnityWebRequest request = UnityWebRequest.Get(server + "/obtenerPalabra.php");
  	yield return request.Send();

  	debugRequest(request);
  }

  private debugRequest(UnityWebRequest request){
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

  public void obtenerPalabras()
  {
    StartCoroutine(requestObtenerPalabra());
  }

}
