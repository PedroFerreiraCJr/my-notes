
## Introdução ao MongoDB
Através do terminal rode o comando **mongosh** para chamar o cliente de acesso ao serviço do MongoDB.

 - Para que seja possível começar a adicionar dados a base do **MongoDB** é necessário primeiro criar uma coleção. Isso é feito através do comando **createCollection**.
```javascript
db.createCollection('alunos')
```

 - Para realizar a inserção de um único valor em uma coleção, é possível utilizar a função **insertOne**.
```javascript
{
	'nome': 'Felipe',
	'data_nascimento': new Date(1994, 1, 26),
	'curso': {
		'nome': 'Sistema de Informação'
	}
	'notas': [10.0, 9.0, 4.5],
	'habilidades': [
		{
			'nome': 'Inglês',
			'nível': 'Avançado'
		},
		{
			'nome': 'Taekwondo',
			'nível': 'Básico'
		}
	]
}
```
 - Para fazer uma listagem de todos os valores de uma coleção, é possível utilizar a função **find** para isso.
```javascript
db.alunos.find()
```

 - Para fazer a remoção de um registro, basta invocar a função **deleteOne**, como o comando seguinte.
```javascript
db.alunos.deleteOne({
	'_id': ObjectId('613a67d09d60735405b79584')
})
```

 - A visualização do resultado da operação **find** não é tão legível no console, portanto, para facilitar a leitura do resultado por humanos existe  a função **pretty** da coleção resultante.
```javascript
db.alunos.find().pretty()
```

 - Para fazer uma busca consultando por um parâmetro em específico, por exemplo, pelo nome da pessoa, é possível fazer uma consulta como a seguinte. Essa operação é considerada uma *operação por exemplo*, onde o parâmetro é o exemplo de dado a consultar, ou seja, identificar uma semelhança.
```javascript
db.alunos.find({'nome': 'Alberto'}).pretty()
```

 - Para realizar uma consulta com uma projeção customizada, ou seja, relacionando os atributos do documento que devem ser retornados, segue um exemplo de consulta. Essa consulta retorna os atributos *_id*, *nome*, *curso* da **coleção alunos**.
```javascript
db.alunos.find({}, { _id: 1, nome: 1, curso: 1})
```

 - Segue exemplo de consulta utilizando o operador **$or**.
```javascript
db.alunos.find({
	$or: [
		{ 'curso.nome': 'Sistemas de Informação' },
		{ 'curso.nome': 'Engenharia Química' }
	]
})
```

 - Segue exemplo de consulta utilizando o operador **$or**,  passando também um valor para a projeção.
```javascript
db.alunos.find({
	$or: [
		{ 'curso.nome': 'Sistemas de Informação' },
		{ 'curso.nome': 'Engenharia Química' }
	]
}, { _id: 1, nome: 1 })
```

 - Segue exemplo de consulta utilizando o operador **$in**,  passando também um valor para a projeção.
```javascript
db.alunos.find({
	'curso.nome': {
		$in: ['Sistemas de Informação', 'Engenharia Química']
	}
}, { _id: 1, nome: 1 })
```

 - Segue um exemplo de update, que atualiza todos o primeiro registro com a condição válida. Lembrando que a condição é o primeiro parâmetro da função de atualização.
```javascript
db.alunos.updateOne(
	{'curso.nome': 'Sistema de informação'},
	{
		$set: {'curso.nome': 'Sistemas de Informação'}
	}
)
```
 - **Obs** vale lembrar que é preciso utilizar o operador **$set** para que seja considerado um consulta válida.

 - Segue um exemplo de update, que atualiza todos os registros que se encaixam na condição passada. Lembrando que a condição é o primeiro parâmetro da função de atualização.
```javascript
db.alunos.updateMany(
	{'curso.nome': 'Sistema de informação'},
	{
		$set: {'curso.nome': 'Sistemas de Informação'}
	}
)
```
 - **Obs** vale lembrar que é preciso utilizar o operador **$set** para que seja considerado um consulta válida.

 - Uma outra operação que eventualmente poderá ser útil é adicionar mais um valor a um array, neste caso um array de números.
```javascript
db.alunos.updateOne(
	{ '_id': ObjectId('613a67d09d60735405b79584') },
	{
		$push: {
			notas: 8.5
		}
	}
)
```

 - Uma outra operação que eventualmente poderá ser útil é adicionar dois ou mais valores a um array, neste caso um array de números.
```javascript
db.alunos.updateOne(
	{ '_id': ObjectId('613a67d09d60735405b79584') },
	{
		$push: {
			notas: {
				$each: [8.5, 3]
			}
		}
	}
)
```
