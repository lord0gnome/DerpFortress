# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: guiricha <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/15 14:08:07 by guiricha          #+#    #+#              #
#    Updated: 2018/07/24 17:48:49 by guiricha         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= durf_furtruss
OS_NAME = $(shell uname)

OUTPUT = echo -e
ifeq ($(OS_NAME), Darwin)
	OUTPUT = echo
endif

SRC_DIR = src
INC_DIR = includes
OBJ_DIR = obj

COMPILER = g++
FLAGS = -std=c++0x
SDL_LIBS = $(shell sdl2-config --libs)
SDL_FLAGS = $(shell sdl2-config --cflags)
ifeq ($(TEST), 1) # whether to have warnings as errors and more rigor in compilation
	FLAGS = -Wall -Wextra -Werror
endif

LIBS = 
INCLUDES = 

SRC = main.cpp

OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:.cpp=.o))

all	: $(NAME)

$(NAME): $(OBJ)
	@$(COMPILER) $(INCLUDES) -o $(NAME) $(FLAGS) $(SDL_FLAGS) $(OBJ) $(LIBS) $(SDL_LIBS)
	@$(OUTPUT) "\033[32m$(NAME) \033[35mCompiled\033[0m"
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@test -d $(dir $@) || mkdir -p $(dir $@) 2> /dev/null
	@$(COMPILER) $(INCLUDES) $(SDL_LIBS) $(SDL_FLAGS) -o $@ -c $< $(FLAGS) && $(OUTPUT) "\033[33m[$(NAME)|\033[32m$<]\033[0m"

clean:
	@$(MAKE) -sC libft clean
	@$(MAKE) -sC printf fclean
	@$(OUTPUT) "\033[33m$(NAME) \033[31m $(OBJ)\033[0m"
	@rm -rf $(OBJ)

fclean: clean
	@$(MAKE) -sC libft fclean
	@$(MAKE) -sC printf fclean
	@$(OUTPUT) "\033[31m$(NAME)\033[0m"
	@rm -f $(NAME)

re: fclean all
