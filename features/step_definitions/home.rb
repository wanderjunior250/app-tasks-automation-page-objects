Quando("eu adicionar {int} tarefa valida") do |quantidade|
  @home.adicionar_tarefas(quantidade, MASS['TASK_LIST']['task_valida'])
end

Entao("as tarefas retornadas devem ser exibidas corretamente") do
  @home.validar_tarefas_inseridas
end

Quando("eu adicionar {int} tarefa inválida") do |quantidade|
  @home.adicionar_tarefas(quantidade, MASS['TASK_LIST']['task_invalida'])
end

Entao("não será adicionado nenhuma tarefa") do
  @home.has_label_tarefas?.should be false
end

Entao("a quantidade de tarefas deve ser igual a {int}") do |int|
  @home.quantidade_de_tarefas.should be == int
end

Quando("eu remover {int} tarefa") do |quantidade|
  @home.remover_tarefas(quantidade)
end

Quando("eu marcar {int} tarefas como concluidas") do |quantidade|
  @home.concluir_tarefas(quantidade)
end

Entao("as tarefas marcadas como concluidas devem estar corretas") do
  @home.validar_tarefas_concluidas
end