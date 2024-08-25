// Definición de una enumeración llamada 'FromWho' que tiene dos valores posibles: 'me' y 'other'.
// Esta enumeración se utiliza para indicar quién envió el mensaje.
enum FromWho { me, other }

// Definición de una clase llamada 'Message' que representa un mensaje.
class Message {
  // Campo final que almacena el texto del mensaje.
  final String text;

  // Campo final opcional que almacena la URL de una imagen asociada con el mensaje.
  final String? imageUrl;

  // Campo final que indica quién envió el mensaje, utilizando la enumeración 'FromWho'.
  final FromWho fromWho;

  // Constructor de la clase 'Message' que inicializa los campos 'text', 'imageUrl' y 'fromWho'.
  // El campo 'text' es obligatorio.
  // El campo 'imageUrl' es opcional.
  // El campo 'fromWho' es obligatorio.
  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });
}
