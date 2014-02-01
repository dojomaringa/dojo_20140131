class CampoMinado
  def initialize(matriz)
    @matriz = matriz
  end

  def bomba?(linha, coluna)
    @matriz[linha][coluna] == "*"
  end

  def resultado
    @matriz.each_with_index do |linha, pos_linha|
      linha.each_with_index do |coluna, pos_coluna|
        substitui!(pos_linha, pos_coluna) if bomba?(pos_linha, pos_coluna)
      end
    end
  end

  private
  def substitui!(linha, coluna)
    (-1..1).each do |l|
      (-1..1).each { |c| incrementa_numero_de_bombas(linha + l, coluna + c) }
    end
  end

  def inexistente?(linha, coluna)
    @matriz[linha][coluna].nil?
  end

  def proibido?(linha, coluna)
    linha < 0 || coluna < 0 || bomba?(linha, coluna)
  end

  def incrementa_numero_de_bombas(linha, coluna)
    return if inexistente?(linha, coluna) || proibido?(linha, coluna)

    if @matriz[linha][coluna] == "."
      @matriz[linha][coluna] = 1
    else
      @matriz[linha][coluna] += 1
    end
  end
end
