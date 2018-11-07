<?php
/**
 * Created by PhpStorm.
 * User: carlos
 * Date: 06/11/2018
 * Time: 17:05
 */

namespace App\Security;


use App\Entity\User;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;

class SharedSessionUserProvider implements UserProviderInterface {
	public function loadUserByUsername( $username ) {
		//En los microservicios que no gestionan usuarios la unica fuente de información es la sesion compartida.
		return null;
	}

	public function refreshUser( UserInterface $user ) {
		// Por defecto los microservicios no tienen información del usuario que deban acutalizar, de eso se encarga el
		// microservicio de gestión de usuarios
		return $user;
	}

	public function supportsClass( $class ) {
		return User::class == $class;
	}

}