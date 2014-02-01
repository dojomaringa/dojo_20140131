require_relative "campo_minado"

describe "Campo Minado" do
  describe "encontrar bombas" do
    it "deve retornar true para a posicao 0, 0" do
      campo_minado = CampoMinado.new [
        ["*", "."],
        [".", "."]
      ]

      expect(campo_minado.bomba?(0, 0)).to be_true
    end

    it "deve retornar false para a posicao 0, 1" do
      campo_minado = CampoMinado.new [
        ["*", "."],
        [".", "."]
      ]

      expect(campo_minado.bomba?(0, 1)).to be_false
    end
  end

  describe "definir mapa" do
    it "deve retornar um mapa 2x2 com 1 bomba" do
      campo_minado = CampoMinado.new [
        ["*", "."],
        [".", "."]
      ]

      expect(campo_minado.resultado).to eq([
        ["*", 1],
        [1, 1]
      ])
    end

    it "deve retornar um mapa 2x2 com 2 bomba" do
      campo_minado = CampoMinado.new [
        ["*", "*"],
        [".", "."]
      ]

      expect(campo_minado.resultado).to eq([
        ["*", "*"],
        [2, 2]
      ])
    end

    it "deve retornar um mapa 3x3 com 2 bomba" do
      campo_minado = CampoMinado.new [
        ["*", "."],
        [".", "*"],
        [".", "."]
      ]

      expect(campo_minado.resultado).to eq([
        ["*", 2],
        [2, "*"],
        [1, 1]
      ])
    end

    it "deve retornar um mapa 4x4 com 3 bomba" do
      campo_minado = CampoMinado.new [
        ["*", "."],
        [".", "*"],
        ["*", "."],
        [".", "."]
      ]

      expect(campo_minado.resultado).to eq([
        ["*", 2],
        [3, "*"],
        ["*", 2],
        [1, 1]
      ])
    end
  end
end
