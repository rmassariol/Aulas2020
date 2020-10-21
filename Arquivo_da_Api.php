<?php
declare(strict_types=1);

use App\Application\Actions\User\ListUsersAction;
use App\Application\Actions\User\ViewUserAction;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\App;
use Slim\Interfaces\RouteCollectorProxyInterface as Group;

return function (App $app) {
    $app->options('/{routes:.*}', function (Request $request, Response $response) {
        // CORS Pre-Flight OPTIONS Request Handler
        return $response;
    });



    $app->post('/mostrar', function (Request $request, Response $response) {               
      
      
        //  $headers = $request->getHeader('Authorization');  
        //  $dadosCabecalho = explode(' ', $headers[0]);
        //  $dadosUsuario = base64_decode($dadosCabecalho[1]);
        //  $dadosUsuario = explode(':',$dadosUsuario);

         //echo $dadosUsuario[0]; //usuario 
         //echo $dadosUsuario[1]; //senha

        //  if ($dadosUsuario[0]=='USUARIOAULA'){
        //      echo 'acesso autorizado';
        //      exit;
        //  }


        //pegando o cabeçalho
        // $headers = $request->getHeaders();
        // echo  $headers["teste"][0];      
        // exit;      
      
      
        $retorno = '[ {"codigo":123, "nome":"MARIA DAS DORES"}, 
                      {"codigo":456, "nome":"JOSE DOS SANTOS"},
                      {"codigo":789, "nome":"JOAQUIM DA SILVA"},
                      {"codigo":321, "nome":"NOVO CADASTRO"} ]';

       
        
        $response = $response->withHeader('Content-Type','Application/json');
        $response->getBody()->write($retorno);
        return $response;
    });

    $app->get('/', function (Request $request, Response $response) {        
        $x = 'eadd ds sada das dasd sad asd as das da das das dsa d a s';        
        $response->getBody()->write($x);
        return $response;
    });


    $app->get('/usuario', function (Request $request, Response $response)  {   
       $response->getBody()->write('Aula');
        return $response;
    });

    $app->post('/usuario', function (Request $request, Response $response)   {     
       
         $response->getBody()->write('123');
         return $response;
    });

    $app->put('/usuario', function (Request $request, Response $response) {
        $response->getBody()->write('Aula put');
        return $response;
    });

    $app->delete('/usuario', function (Request $request, Response $response) {
        $response->getBody()->write('Aula delete');
        return $response;
    });



    $app->group('/users', function (Group $group) {
        $group->get('', ListUsersAction::class);
        $group->get('/{id}', ViewUserAction::class);
    });
};
