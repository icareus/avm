/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abarbaro <abarbaro@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/02/14 03:40:17 by abarbaro          #+#    #+#             */
/*   Updated: 2015/02/18 15:51:27 by abarbaro         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <avm.hpp>

int		main(int ac, char **av)
{
	std::ifstream	inFile;
	std::istream &	input = (ac > 1 ? inFile : std::cin);
	std::string		line;

	if (ac == 2) {
		inFile.open(av[1]);
		if (!inFile.good()) {
			std::cerr << "Error opening file " << av[1] << std::endl;
		}
	} else if (ac > 2) {
		std::cout << "Error. Only one input file accepted." << std::endl;
	} else {
		std::cout << "No input file, using standard input." << std::endl;
	}
	while (line != ";;" && !inFile.eof()) {
		std::getline(input, line);
		std::cout << line << std::endl;
	}
	return (0);
}
