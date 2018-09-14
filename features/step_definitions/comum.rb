Dado(/^que eu esteja na home do site$/) do
  visit ENVIRONMENT['APP'][@env]['home']
  @home = @app.home
end