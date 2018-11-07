<?php
/**
 * Created by PhpStorm.
 * User: carlos
 * Date: 06/11/2018
 * Time: 16:46
 */

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Exception\AuthenticationException;


class SecuredController extends AbstractController {
	/**
	 * @Route("/app2-test-user", name="test_user")
	 */
	public function testSecurityAction( Request $request ) {
		$user = $this->getUser();

		return new Response( '<body><h1>Hola ' . $user->getUsername() . ' estas en App2</h1></body>' );
	}
}