# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jterrazz <jterrazz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/23 18:00:29 by jterrazz          #+#    #+#              #
#    Updated: 2019/07/05 16:10:46 by jterrazz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BUILD_PATH = obj
SRC_PATH = src

SOURCES += Colleen.c
SOURCES2 += Grace.c
SOURCES3 += Sully.c

OBJECTS = $(SOURCES:%.c=$(BUILD_PATH)/%.o)
OBJECTS2 = $(SOURCES2:%.c=$(BUILD_PATH)/%.o)
OBJECTS3 = $(SOURCES3:%.c=$(BUILD_PATH)/%.o)

# **************************************************************************** #
# VARIABLES         														   #
# **************************************************************************** #

NAME = Colleen
NAME2 = Grace
NAME3 = Sully

CC = gcc
FLAGS_CC = -Wall -Wextra -Werror

# **************************************************************************** #
# COMMANDS  		    													   #
# **************************************************************************** #

.PHONY: all clean fclean re test

all: $(NAME) $(NAME2) $(NAME3)

$(NAME): $(OBJECTS)
	$(CC) $(FLAGS_CC) -o $@ $^

$(NAME2): $(OBJECTS2)
	$(CC) $(FLAGS_CC) -o $@ $^

$(NAME3): $(OBJECTS3)
	$(CC) $(FLAGS_CC) -o $@ $^

$(BUILD_PATH)/%.o: $(SRC_PATH)/%.c
	@mkdir -p $(@D)
	$(CC) $(FLAGS_CC) -c -o $@ $<

clean:
	@rm -rf $(BUILD_PATH)
	@echo "Clean \033[33mok\033[0m"

fclean: clean
	@rm -f $(NAME) $(NAME2) $(NAME3) Grace_kid.c Sully_*.c # Maybe delete Sully_x.c
	@echo "Fclean \033[33mok\033[0m"

re: fclean all
