# Estrutura de um Test Suite com o Jasmine
```javascript
// estrutura geral
describe('Test Suite', () => {
	beforeEach(() => {
		// aqui podem ser instanciados objetos que serão gerados a cada execução dos blocos 'it'.
	});

	it('Test Case - marked as pending', () => {
		pending();
	});

	it('Test Case - marked as failing', () => {
		fail();
	});

	it('Test Case - testing with assertions', () => {
		const value = true;
		expect(value).toBe(true);
	});
});
```

- Quando for executar o teste através do Angular CLI, e para que o Karma execute o teste e não fique no **Live Reload** do código, utilize o parâmetro de linha de comando **- -no-watch**.

- A respeito da função de asserção **expect**, é possível passar o valor gerado pela funcionalidade testada, e para as funções utilitárias que a mesma retorna o valor esperado. Opcionalmente, é possível passar um segundo argumento para a função utilitária, que é uma mensagem que deve ser apresentada como mensagem de erro caso a expectativa falhe.
```javascript
describe('Test Suite', () => {
	it('Test Case - testing with assertions', () => {
		const value = true;
		expect(value).toBe(false, 'resultado inesperado na operação de iqualdade');
	});
});
```

 - A função **spyOn** do Jasmine permite que determinada função de um objeto seja substituída por uma pela qual seja possível fazer algumas asserções com relação, por exemplo, a quantas vezes essa função/método da instância foi chamado. Este é o caso da função utilitária **toHaveBeenCalledTimes**, que espera que uma determinada função tenha sido chamada n vezes, falhando caso essa expectativa seja falsa.

```javascript
/*
	Este não é a melhor estratégia de teste para a classe CalculatorService, pois estamos criando uma instância de um objeto que não é mock, no caso, o LoggerService. Desta forma criariamos um teste unitário mais isolado, e independente.
*/
describe('CalculatorService', () => {
	it('Should add two numbers', () => {
		const logger = new LoggerService();
		spyOn(logger, 'log');

		const calculator = new CalculatorService(logger);
		const result = calculator.add(4, 2);

		expect(result).toBe(6, 'a soma deveria ter dado 6');
		expect(logger.log).toHaveBeenCalledTimes(1);
	});
});
```

 - Para que seja possível fazer um teste unitário da forma correta para o serviço calculadora - **ServiceCalculator**, podemos tirar proveito do próprio framework do Jasmine para criar um *objeto mock* para a classe **LoggerService**.
```javascript
/*
	Este cenário de teste está muito mais isolado e independente, pois estamos criando através do framework do Jasmine o objeto mock para suprir a dependência do LoggerService.
*/
describe('CalculatorService', () => {
	it('Should add two numbers', () => {
		// cria um objeto com um método 'log'
		const logger = jasmine.createSpyObj('LoggerService', ['log']);

		const calculator = new CalculatorService(logger);
		const result = calculator.add(4, 2);

		expect(result).toBe(6, 'a soma deveria ter dado 6');
		expect(logger.log).toHaveBeenCalledTimes(1);
	});
});
```

- Outra possibilidade quando utilizando um *objeto mock* instanciado pelo **jasmine** é que podemos definir o que cada método declarado no objeto fake deve retornar caso seja invocado.
```javascript
/*
	Neste cenário estamos configurando o objeto mock para retornar um determinado valor quando for chamado.
*/
describe('CalculatorService', () => {
	it('Should add two numbers', () => {
		const logger = jasmine.createSpyObj('LoggerService', ['log']);
		// quando o método log for chamado, ele irá retornar a string 'valor a ser retornado'
		logger.log.and.returnValue('valor a ser retornado');
		
		const calculator = new CalculatorService(logger);
		const result = calculator.add(4, 2);

		expect(result).toBe(6, 'a soma deveria ter dado 6');
		expect(logger.log).toHaveBeenCalledTimes(1);
	});
});
```

- O Angular utiliza um sistema de **Dependency Injection** para resolver as dependências dos componentes e serviços. Para sermos capazes de fazer a *injeção de dependência* no nosso cenário de teste, podemos fazer uso da classe TestBed, desenvolvida pelo próprio framework do Angular.
```javascript
/*
	Neste cenário estaremos utilizando a classe TestBed para fornecer as dependências do nosso teste, no caso o CalculatorService, assim como o LoggerService gerado pelo Jasmine.
*/
describe('CalculatorService', () => {
	let calculator: Calculator;
	let loggerSpy: any;

	beforeEach(() => {
		loggerSpy = jasmine.createSpyObj('LoggerService', ['log']);
		
		TestBed.configureTestingModule({
			providers: [
				CalculatorService,
				{provide: LoggerService, useValue: loggerSpy}
			]
		});

		calculator = TestBed.get(CalculatorService);
	});
});
```

- É possível desabilitar um Test Suíte completo através da utilização da função utilitária **xdescribe**.
```javascript
/*
	Toda a suite de teste será ignorada pelo Karma, ou seja, os testes não serão executados.
*/
xdescribe('CalculatorService', () => {
	let calculator: Calculator;
	let loggerSpy: any;

	beforeEach(() => {
		loggerSpy = jasmine.createSpyObj('LoggerService', ['log']);
		
		TestBed.configureTestingModule({
			providers: [
				CalculatorService,
				{provide: LoggerService, useValue: loggerSpy}
			]
		});

		calculator = TestBed.get(CalculatorService);
	});
});
```

- Também é possível pular somente um caso de teste usando a função utilitária **xit**.
```javascript
/*
		Somente o caso de teste que usa a função xit, será ignorada pelo Karma, ou seja, os testes não serão executados.
*/
describe('CalculatorService', () => {
	let calculator: Calculator;
	let loggerSpy: any;

	beforeEach(() => {
		loggerSpy = jasmine.createSpyObj('LoggerService', ['log']);
		
		TestBed.configureTestingModule({
			providers: [
				CalculatorService,
				{provide: LoggerService, useValue: loggerSpy}
			]
		});

		calculator = TestBed.get(CalculatorService);
	});

	// este teste será pulado
	xit('Should subtract two numbers', () => {
		const result = calculator.subtract(2, 2);
			
		expect(result).toBe(0, 'resultado inesperado de subtração');
		expect(loggerSpy.log).toHaveBeenCalledTimes(1);
	});
});
```

- Com a função utilitária **fdescribe** é possível *f*ocar em um único Test Suite, o restante dos Test Suite serão pulados.
```javascript
/*
	Somente a suíte de teste que estiver com a função fdescribe é que será executada, pois este é o modo foco.
*/
fdescribe('CalculatorService', () => {
	let calculator: Calculator;
	let loggerSpy: any;

	beforeEach(() => {
		loggerSpy = jasmine.createSpyObj('LoggerService', ['log']);
		
		TestBed.configureTestingModule({
			providers: [
				CalculatorService,
				{provide: LoggerService, useValue: loggerSpy}
			]
		});

		calculator = TestBed.get(CalculatorService);
	});

	// este teste será pulado
	it('Should subtract two numbers', () => {
		const result = calculator.subtract(2, 2);
			
		expect(result).toBe(0, 'resultado inesperado de subtração');
		expect(loggerSpy.log).toHaveBeenCalledTimes(1);
	});
});
```

- Também é possível com a função utilitária **fit** *f*ocar em um único Test Case, o restante dos casos de teste serão pulados.
```javascript
/*
	Somente o teste que estiver com a função fit é que será executada, pois este é o modo foco.
*/
describe('CalculatorService', () => {
	let calculator: Calculator;
	let loggerSpy: any;

	beforeEach(() => {
		loggerSpy = jasmine.createSpyObj('LoggerService', ['log']);
		
		TestBed.configureTestingModule({
			providers: [
				CalculatorService,
				{provide: LoggerService, useValue: loggerSpy}
			]
		});

		calculator = TestBed.get(CalculatorService);
	});

	// somente este teste será executado para este Test Suíte
	fit('Should subtract two numbers', () => {
		const result = calculator.subtract(2, 2);
			
		expect(result).toBe(0, 'resultado inesperado de subtração');
		expect(loggerSpy.log).toHaveBeenCalledTimes(1);
	});
});
```
