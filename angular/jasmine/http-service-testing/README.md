- Nesta Suite de Teste está configurado a base para o teste de um serviço que usa um recurso HTTP.
```javascript
/*
	Configuração base para executar teste de serviço que deve consultar um serviço de back-end.
*/
describe('CoursesService', () => {
	let coursesService: CoursesService;
	let httpTestingController: HttpTestingController;
	
	beforeEach(() => {
		TestBed.configureTestingModule({
			imports: [HttpClientTestingModule],
			providers: [
				CoursesService
			]
		});

		courses = TestBed.get(CoursesService);
		httpTestingController = TestBed.get(HttpTestingController);
	});

	it('Should retrieve all courses', () => {
		coursesService.findAllCourses()
			.subscribe((courses) => {
				expect(courses).toBeTruthy('No courses returned');
				expect(courses.length).toBe(12, 'incorrect number of courses');
				const course = courses.find(course => course.id == 12);
				expect(course.title.description).toBe('Angular Testing Course');
			});
		
		// uma requisição para '/api/courses' é esperada
		const req = httpTestingController.expectOne('/api/courses');
		// espera que a requisição seja do tipo GET
		expect(req.request.method).toEqual('GET');
		// a resolução da invocação do metodo subscribe acima
		// somente será feita com a chamada do método seguinte
		// o valor que será passado para o método findAllCourses é
		// o parâmetro do método flush.
		req.flush({payload: Object.values(COURSES)});
	});
});
```
