# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jterrazz <jterrazz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/23 18:00:29 by jterrazz          #+#    #+#              #
#    Updated: 2019/07/26 17:38:15 by jterrazz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_PATH = src

SOURCES1 += Colleen/Colleen.s
SOURCES2 += Grace/Grace.s
SOURCES3 += Sully/Sully.s

OBJECTS1 = $(SOURCES1:%.s=%.o)
OBJECTS2 = $(SOURCES2:%.s=%.o)
OBJECTS3 = $(SOURCES3:%.s=%.o)

# **************************************************************************** #
# VARIABLES         														   #
# **************************************************************************** #

NAME = dr_quine_asm

NAME1 = Colleen/Colleen
NAME2 = Grace/Grace
NAME3 = Sully/Sully

ASM_CC = nasm
ASM_FLAGS = -f macho64

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

%.o: %.s
	@$(ASM_CC) $(ASM_FLAGS) $< -o $@

clean:
	@rm -f $(OBJECTS1) $(OBJECTS2) $(OBJECTS3)
	@echo "ASM Clean \033[33mok\033[0m"

fclean: clean
	@rm -f $(NAME1) $(NAME2) $(NAME3) Grace/Grace_kid.s Sully/Sully_[0-9]{1,}.o Sully/Sully_[0-9]{1,}.s Sully/Sully_[0-9]{1,}
	@echo "ASM Fclean \033[33mok\033[0m"

re: fclean all
