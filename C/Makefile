# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jterrazz <jterrazz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/23 18:00:29 by jterrazz          #+#    #+#              #
#    Updated: 2019/07/26 17:38:27 by jterrazz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_PATH = src

SOURCES1 += Colleen/Colleen.c
SOURCES2 += Grace/Grace.c
SOURCES3 += Sully/Sully.c

OBJECTS1 = $(SOURCES1:%.c=%.o)
OBJECTS2 = $(SOURCES2:%.c=%.o)
OBJECTS3 = $(SOURCES3:%.c=%.o)

# **************************************************************************** #
# VARIABLES         														   #
# **************************************************************************** #

NAME = dr_quine_c

NAME1 = Colleen/Colleen
NAME2 = Grace/Grace
NAME3 = Sully/Sully

CC = gcc
FLAGS_CC = -Wall -Wextra -Werror

# **************************************************************************** #
# COMMANDS  		    													   #
# **************************************************************************** #

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(NAME1) $(NAME2) $(NAME3)

$(NAME1): $(OBJECTS1)
	$(CC) $(FLAGS_CC) -o $@ $^
$(NAME2): $(OBJECTS2)
	$(CC) $(FLAGS_CC) -o $@ $^
$(NAME3): $(OBJECTS3)
	$(CC) $(FLAGS_CC) -o $@ $^

%.o: %.c
	$(CC) $(FLAGS_CC) -c -o $@ $<

clean:
	@rm -f $(OBJECTS1) $(OBJECTS2) $(OBJECTS3)
	@echo "C Clean \033[33mok\033[0m"

fclean: clean
	@rm -f $(NAME1) $(NAME2) $(NAME3) Grace/Grace_kid.c Sully/Sully_[0-9]{1,}.o Sully/Sully_[0-9]{1,}.c Sully/Sully_[0-9]{1,}
	@echo "C Fclean \033[33mok\033[0m"

re: fclean all
