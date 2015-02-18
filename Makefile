# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abarbaro <abarbaro@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/30 05:29:40 by abarbaro          #+#    #+#              #
#    Updated: 2015/02/14 04:48:54 by abarbaro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = g++
CFLAGS = -Wall -Werror -Wextra
NAME = avm
SRCDIR = ./srcs/
IDIR = ./includes/
SRCFIL = $(shell ls $(SRCDIR) | grep "\.cpp")
SRC = $(addprefix $(SRCDIR),$(SRCFIL))
ODIR = ./OBJECTS/
OFIL = $(SRCFIL:.cpp=.o)
SRCO = $(addprefix $(ODIR),$(OFIL))
BLU = tput setaf 4
GRN = tput setaf 2
WHT = tput setaf 7
NOCOLOR = tput sgr 0

all: $(NAME)

$(NAME): $(SRCO)
	@$(BLU)
	@echo "Making $(NAME)..."
	@$(CC) $(addprefix $(ODIR),$(OFIL)) -o $(NAME)
	@$(WHT)
	@echo "$(NAME) done."
	@$(NOCOLOR)

$(SRCO):
	@$(BLU)
	@echo "Making objects..."
	@$(CC) $(CFLAGS) -c $(SRC) -I $(IDIR)
	@mkdir -p $(ODIR)
	@mv $(OFIL) $(ODIR)
	@$(WHT)
	@echo "objects done."
	@$(NOCOLOR)

re: fclean all
	@$(GRN)
	@echo "Project reset and rebuilt."
	@$(NOCOLOR)

clean:
	@$(BLU)
	@echo "Cleaning objects..."
	rm -rf $(ODIR)
	@$(WHT)
	@echo "Cleaning done."
	@$(NOCOLOR)

fclean: clean
	@$(BLU)
	@echo "Deleting output..."
	rm -f $(NAME)
	@$(WHT)
	@echo "Deletion done."
	@$(NOCOLOR)

