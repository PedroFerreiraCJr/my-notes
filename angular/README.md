
### Tratamento de erros na Request HTTP no Angular
O tratamento de erros de requisição no Angular pode ser feito em três locais diferentes. A nível do **Component** que faz a chamada que está encapsulada no **Service**. Por outro lado, o próprio Service pode lidar com a ocorrência de erros na requisição HTTP. Enfim, o Angular também permite fazer uso de um tratador de erros HTTP de forma **global**.
A seguir exemplos das três categorias.

### A nível de Component
```javascript
public getRepos(): void {
	this.loading = true;
	this.errorMessage = "";
	this.githubService.getReposCatchError(this.userName)
		.subscribe((response) => {	//Next callback
			console.log('response received');
			this.repos = response;
		},
		(error) => {	//Error callback
			console.error('error caught in component');
			this.errorMessage = error;
			this.loading = false;
			// throw error;
			//You can also throw the error to a global error handler
		});
}
```
 - O método **subscribe** recebe três argumentos. O Observable invoca o primeiro callback *success* quando a resposta HTTP é bem sucedida. O terceiro callback *completed* é chamado quando o Observable termina sem nenhum erro. O segundo callback *error*, é invocado quando a requisição HTTP termina em erro. Nós tratamos o erro aqui através da descoberta do tipo do erro e lidando com ele de acordo. O objeto *error* é do tipo **HttpErrorResponse**.

### A nível de Service
Nós também podemos capturar erros a nível de serviço, que faz a requisição HTTP usando o operador *catchError* da biblioteca **rxjs**. Uma vez tratado o erro, é possível relançá-lo para o Component para posterior tratamento.
```javascript
public getRepos(username: string): Observable<Repos[]> {
	return this.http.get<Repos[]>(this.baseURL + 'usersY/' + username + '/repos')
		.pipe(catchError((err) => {
			console.log('error caught in service');
			console.error(err);
			//Handle the error here
			return  throwError(err); //Rethrow it back to component
		})
	);
}
```
### Interceptor de tratamento de erro
```javascript
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest, HttpErrorResponse } from '[@angular/common](http://twitter.com/angular/common)/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

export class HttpErrorInterceptor implements HttpInterceptor {
	constructor(private router: Router) { }
	intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
		return next.handle(request).pipe(
			catchError((error: HttpErrorResponse) => {
				let errorMsg = '';
				if (error.error instanceof ErrorEvent) {
					console.log('this is client side error');
					errorMsg = `Error: ${error.error.message}`;
				} else {
					console.log('this is server side error');
					console.log(`error status : ${error.status} ${error.statusText}`);
					switch (error.status) {
						case 401: //login
							this.router.navigateByUrl("/login");
							console.log(`redirect to login`);
							break;
						case 403:  //forbidden
							this.router.navigateByUrl("/forbidden");
							console.log(`redirect to login`);
							break;
					}
				}
				console.log(errorMsg);
				return throwError(errorMsg);
			})
		)
	}
}

```
 - Adicionalmente, para registrar o Interceptor criado anteriormente, é necessário adicioná-lo ao array de providers do módulo root da aplicação usando o token de injeção *HTTP_INTERCEPTORS*.
```javascript
providers: [
	GitHubService,
	{ provide: HTTP_INTERCEPTORS, useClass: HttpErrorInterceptor, multi: true }
]
```
