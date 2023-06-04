# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sanglee2 <sanglee2@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/04 21:26:32 by sanglee2          #+#    #+#              #
#    Updated: 2023/06/04 21:38:34 by sanglee2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	a.out

#
# SRCS and OBJS
#

SRCS	=	\
			main.c

OBJS = $(SRCS:%.c=%.o)

#
# Compiler and flags
#

CC		=	cc
CFLAGS	=	-Wall -Werror -Wextra

#
# Rules
#

all		: $(NAME)

%.o	:%.c
	$(CC) -Wall -Wextra -Werror -I/usr/include -Imlx_linux -O3 -c $< -o $@

$(NAME): $(OBJ)
	$(CC) $(OBJ) -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz -o $(NAME)


clean	:
	rm -rf $(OBJS)

fclean	: clean
	rm -rf	$(NAME)

re		: fclean all