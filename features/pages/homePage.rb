class Home < BasePage
  
  # input elements
  element :input_nova_tarefa, 'p input'
  # label element collections
  elements :label_tarefas, '#tasks > div > p.is-expanded'
  elements :linhas_adicionadas, '#tasks > div'

  # button elements
  element :button_adicionar_tarefa, '#add'
  # button elements collection
  elements :buttons_concluir_tarefas, '#close-open'
  elements :buttons_remover_tarefas, '#remove'

  attr_accessor :tarefas

  def initialize
    @tarefas = Hash.new
  end

  def adicionar_tarefas(quantidade, massa)
    for i in 0..quantidade-1 do
      tarefa = massa['nome'].dup.gsub('{id}', i.to_s)
      @tarefas[tarefa] = false
      adicionar_tarefa(tarefa)
    end
  end

  def adicionar_tarefa(tarefa)
    input_nova_tarefa.set tarefa
    button_adicionar_tarefa.click
  end

  def validar_tarefas_inseridas
    @tarefas.each do |tarefa|
      validar_tarefa(tarefa[0])
    end
  end

  def validar_tarefa(tarefa)
    expect(find('#tasks')).to have_content(tarefa)
  end

  def remover_tarefas(quantidade)
    for i in 0..quantidade-1 do
      @tarefas.delete(label_tarefas[i].text)
      remover_tarefa(i)
    end
  end

  def remover_tarefa(index)
    buttons_remover_tarefas[index].click
  end

  def quantidade_de_tarefas
    label_tarefas.size
  end

  def concluir_tarefas(quantidade)
    for i in 0..quantidade-1 do
      concluir_tarefa(i)
      @tarefas[label_tarefas[i].text] = true
    end
    return tarefas
  end

  def concluir_tarefa(index)
    buttons_concluir_tarefas[index].click
  end

  def validar_tarefas_concluidas
    i = 0
    label_tarefas.each do |tarefa|
      expect(linhas_adicionadas[i]).to have_css('.checked') if @tarefas[tarefa.text] == true
      i += 1
    end
  end

end

