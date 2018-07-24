/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: guiricha <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/07/24 17:30:44 by guiricha          #+#    #+#             */
/*   Updated: 2018/07/24 17:59:08 by guiricha         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <iostream>
#include <SDL.h>

int	main(int argc, char **argv)
{
	std::cout << std::string("Hello World, my name is ") + std::string(argv[1]);
	SDL_Init(SDL_INIT_VIDEO|SDL_INIT_AUDIO);
}
