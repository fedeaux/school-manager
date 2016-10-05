# README

* Utilizei a gem haml na maioria dos templates, mas slim em algumas. Como as duas linguagens são quase idênticas e eu já tinha código pronto em haml, achei que não teria problema.
* Fiz as views utilizando angular-js 1.5.3. Desta forma não fazia sentido utilizar a gem responders.
* Fiz uma feature spec utilizando capybara-webkit (em spec/features/manage_course_students.rb)

### Observações

* O tempo esperado para o projeto era de 4h, então eu deixei algumas coisas óbvias por fazer: Por exemplo, não permitir que alunos sejam adicionados a cursos desativados.
* Tem um bug na view que permite ao usuário clicar em "criar" mesmo sem selecionar um status. O model não deixa ele criar. Parece fácil de consertar, mas o tempo acabou :(
* O campo select para seleção de alunos a serem adicionados foi feito do jeito mais ingênuo possível. Se eu tivesse mais tempo, faria um serviço responsável por pegar todos os alunos que não estão no curso para preencher o select. Isso também faria com que o usuários não tivesse que fazer reload na página para que novos alunos apareçam nas opções.