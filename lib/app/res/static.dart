final String url1 = "http://192.168.0.141:8080/";
final String url3 = "http://192.168.42.10:8080/";
final String url11 = "http://172.25.192.1:8080/";
final String url2 = "https://lpbp.herokuapp.com/";
final String url = url1;

String decoder(String body) {
  body = body.replaceAll('Ã§', 'ç');
  body = body.replaceAll('Ãµ', 'õ');
  body = body.replaceAll('Ã', 'Ç');
  body = body.replaceAll('Ã©', 'é');
  body = body.replaceAll('Ã£', 'ã');
  body = body.replaceAll('Ã³', 'ó');
  body = body.replaceAll('Ã', 'Á');
  return body;
}
