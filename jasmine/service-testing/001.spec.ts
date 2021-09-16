describe('ServiceCalculator', () => {
	it('Should add two numbers', () => {
		const logger = jasmine.createSpyObj('LoggerService', ['log']);
		const calculator = new CalculatorService(logger);
		const result = calculator.add(4, 2);
		
		expect(result).toBe(6);
		expect(logger.log).toHaveBeenCalledTimes(1);
	});
	
	it('Should subtract two numbers', () => {
		const logger = jasmine.createSpyObj('LoggerService', ['log']);
		const calculator = new CalculatorService(logger);
		const result = calculator.subtract(2, 2);
		
		expect(result).toBe(0, 'resultado inesperado de subtração');
		expect(logger.log).toHaveBeenCalledTimes(1);
	});
});

describe('ServiceCalculator', () => {
	let calculator: CalculatorService;
	let loggerSpy: any;
	
	beforeEach(() => {
		loggerSpy = jasmine.createSpyObj('LoggerService', ['log']);
		calculator = new CalculatorService(loggerSpy);
	});
	
	it('Should add two numbers', () => {
		const result = calculator.add(4, 2);
		
		expect(result).toBe(6);
		expect(loggerSpy.log).toHaveBeenCalledTimes(1);
	});
	
	it('Should subtract two numbers', () => {
		const result = calculator.subtract(2, 2);
		
		expect(result).toBe(0, 'resultado inesperado de subtração');
		expect(loggerSpy.log).toHaveBeenCalledTimes(1);
	});
});


// usando a classe TestBed para gerenciar as dependências do teste
// o TestBed automaticamente faz a injeção de dependências
describe('ServiceCalculator', () => {
	let calculator: CalculatorService;
	let loggerSpy: any;
	
	beforeEach(() => {
		loggerSpy = jasmine.createSpyObj('LoggerService', ['log']);
		
		TestBed.configureTestingModule({
			providers: [
				CalculatorService,
				{provide: LoggerService, useValue: loggerSpy}
			]
		});
	});
	
	it('Should add two numbers', () => {
		const result = calculator.add(4, 2);
		
		expect(result).toBe(6);
		expect(loggerSpy.log).toHaveBeenCalledTimes(1);
	});
	
	it('Should subtract two numbers', () => {
		const result = calculator.subtract(2, 2);
		
		expect(result).toBe(0, 'resultado inesperado de subtração');
		expect(loggerSpy.log).toHaveBeenCalledTimes(1);
	});
});

