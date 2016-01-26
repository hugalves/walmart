# Walmart

### Requisitos
* Ruby 2.1.2
* Rails 4.2.5
* MySQL
* Git

### Configuração

```sh
git clone git@github.com:hugalves/walmart.git
cd walmart
bundle install
rake db:setup
```


### Rotas

#### Adicionar mapeamento

Mapeamento é um trecho entre origem e destino. Para adicionar um mapeamento de rota, existe a rota abaixo. Caso o mapeamento já exista, o valor da distância será atualizado.

```sh
post   '/citymaps/create'
content-type: application/json
payload: {"map":{"name":"São Paulo","origin":"A","destiny":"B","distance":"100"}}
```

Onde:
* name: Nome da cidade
* origin: Ponto inicial do mapeamento
* destiny: Ponto final do mapeamento
* distance: Distancia entre origin e destiny

```sh
#Exemplo

curl -vX POST -H "Content-Type: application/json" -d '{"map":{"name":"São Paulo","origin":"A","destiny":"B","distance":"100"}}' http://localhost:3000/citymaps/create
```

#### Preço da rota

Após o mapeamento, pode-se obter o custo de deslocamento entre um determinado ponto e outro. Para isso, existe a rota abaixo:

```sh
get   '/routes/find'
content-type: application/json
payload: {"route":{"city_data":{"name":"São Paulo","origin":"A","destiny":"E"},"transport":{"range_of":10.5,"fuel_price":2.5}}}
```

Onde:
* name: Nome da cidade
* origin: Inicio da rota
* destiny: Fim da rota
* range_of: autonomia do veículo
* fuel_price: preço do combustível por litro

```sh
#Exemplo

curl -vX GET -H "Content-Type: application/json" -d '{"route":{"city_data":{"name":"São Paulo","origin":"A","destiny":"E"},"transport":{"range_of":10.5,"fuel_price":2.5}}}' http://localhost:3000/routes/find
```
