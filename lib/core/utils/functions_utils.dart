sealed class FunctionsUtils {
  static int extractIdFromUrl(String url) {
    // Quebrar a URL usando a barra ("/") como delimitador
    List<String> urlSegments = url.split('/');
    // O ID está no penúltimo elemento da lista de segmentos e converte para int
    return int.parse(urlSegments[urlSegments.length - 2]);
  }
}
