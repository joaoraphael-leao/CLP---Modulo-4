class Imagem {
  String? _id;
  String? _exameId;              // Obrigatório - ID do exame associado
  String? _url;                  // Obrigatório - URL da imagem
  String? _descricao;            // Opcional - descrição da imagem
  DateTime? _dataCaptura;        // Opcional - data de captura da imagem
  String? _tipoImagem;           // Opcional - tipo da imagem (Raio-X, Ultrassom, etc.)
  int? _tamanhoArquivo;          // Opcional - tamanho do arquivo em bytes
  String? _formato;              // Opcional - formato da imagem (JPG, PNG, DICOM, etc.)

  // Construtor privado
  Imagem._();

  // Builder class
  static ImagemBuilder builder() {
    return ImagemBuilder();
  }

  // Getters
  String? get id => _id;
  String? get exameId => _exameId;
  String? get url => _url;
  String? get descricao => _descricao;
  DateTime? get dataCaptura => _dataCaptura;
  String? get tipoImagem => _tipoImagem;
  int? get tamanhoArquivo => _tamanhoArquivo;
  String? get formato => _formato;

  // Setters
  set id(String? value) => _id = value;
  set exameId(String? value) => _exameId = value;
  set url(String? value) => _url = value;
  set descricao(String? value) => _descricao = value;
  set dataCaptura(DateTime? value) => _dataCaptura = value;
  set tipoImagem(String? value) => _tipoImagem = value;
  set tamanhoArquivo(int? value) => _tamanhoArquivo = value;
  set formato(String? value) => _formato = value;

  // Método para obter tamanho formatado
  String? obterTamanhoFormatado() {
    if (_tamanhoArquivo == null) return null;
    
    if (_tamanhoArquivo! < 1024) {
      return '${_tamanhoArquivo} B';
    } else if (_tamanhoArquivo! < 1024 * 1024) {
      return '${(_tamanhoArquivo! / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(_tamanhoArquivo! / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  @override
  String toString() {
    return 'Imagem{id: $_id, exameId: $_exameId, url: $_url, descricao: $_descricao, dataCaptura: $_dataCaptura, tipoImagem: $_tipoImagem, tamanhoArquivo: $_tamanhoArquivo, formato: $_formato}';
  }
}

// Builder class para Imagem
class ImagemBuilder {
  final Imagem _imagem = Imagem._();

  ImagemBuilder id(String? id) {
    _imagem._id = id;
    return this;
  }

  ImagemBuilder exameId(String? exameId) {
    _imagem._exameId = exameId;
    return this;
  }

  ImagemBuilder url(String? url) {
    _imagem._url = url;
    return this;
  }

  ImagemBuilder descricao(String? descricao) {
    _imagem._descricao = descricao;
    return this;
  }

  ImagemBuilder dataCaptura(DateTime? dataCaptura) {
    _imagem._dataCaptura = dataCaptura;
    return this;
  }

  ImagemBuilder tipoImagem(String? tipoImagem) {
    _imagem._tipoImagem = tipoImagem;
    return this;
  }

  ImagemBuilder tamanhoArquivo(int? tamanhoArquivo) {
    _imagem._tamanhoArquivo = tamanhoArquivo;
    return this;
  }

  ImagemBuilder formato(String? formato) {
    _imagem._formato = formato;
    return this;
  }

  Imagem build() {
    // Validações obrigatórias
    if (_imagem._exameId == null || _imagem._exameId!.isEmpty) {
      throw ArgumentError('ID do exame é obrigatório');
    }
    if (_imagem._url == null || _imagem._url!.isEmpty) {
      throw ArgumentError('URL da imagem é obrigatória');
    }
    
    return _imagem;
  }
}
