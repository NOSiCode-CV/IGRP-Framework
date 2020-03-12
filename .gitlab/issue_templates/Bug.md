<! ---
Por favor leia isto!

Antes de abrir um novo problema, pesquise por palavras-chave nos problemas
filtrado pelo rótulo "regressão" ou "bug":

- https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=regression
- https://gitlab.com/gitlab-org/gitlab/issues?label_name%5B%5D=bug

e verifique se o problema que você está prestes a enviar não é duplicado.
--->

### Resumo

(Resuma o erro encontrado de forma concisa)

### Passos para reproduzir

(Como se pode reproduzir o problema - isso é muito importante)

### Exemplo de projeto

(Se possível, crie um projeto de exemplo aqui no GitLab.com que exiba o comportamento problemático e vincule-o aqui no relatório de bug)

(Se você estiver usando uma versão mais antiga do GitLab, isso também determinará se o bug foi corrigido em uma versão mais recente)

### Qual é o atual comportamento * bug *?

(O que realmente acontece)

### Qual é o comportamento * correto * esperado?

(O que você deve ver em vez disso)

### Logs e / ou capturas de tela relevantes

(Cole os logs relevantes - use blocos de código (``)) para formatar a saída do console,
logs e código, já que é difícil ler de outra maneira.)

### Saída de verificações

(Se você estiver relatando um bug no GitLab.com, escreva: Este bug ocorre no GitLab.com)

#### Resultados das informações do ambiente do GitLab

<detalhes>
<summary> Expanda para saída relacionada às informações do ambiente do GitLab </summary>
<pre>

(Para instalações com o pacote omnibus-gitlab, execute e cole a saída de:
`sudo gitlab-rake gitlab: env: informações`)

(Para instalações da origem, execute e cole a saída de:
`exec suke -u git -H exec rake gitlab: env: info RAILS_ENV = produção`)

</pre>
</details>

#### Resultados da aplicação GitLab

<detalhes>
<summary> Expanda para saída relacionada à verificação do aplicativo GitLab </summary>
<pre>

(Para instalações com o pacote omnibus-gitlab, execute e cole a saída de:
`sudo gitlab-rake gitlab: verifique SANITIZE = true`)

(Para instalações da origem, execute e cole a saída de:
`exec suke -u git -H exec rake gitlab: verifique RAILS_ENV = produção SANITIZE = true`)

(investigaremos apenas se os testes estiverem passando)

</pre>
</details>

### Possíveis correções

(Se possível, vincule à linha de código que pode ser responsável pelo problema)

/ label ~ bug