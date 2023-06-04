# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile.e                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sanglee2 <sanglee2@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/04 22:13:59 by sanglee2          #+#    #+#              #
#    Updated: 2023/06/04 23:12:47 by sanglee2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Wall -Wextra -Werror
 
NAME = fractol
 
SRCS_DIR = ./srcs
SRCS_NAME = main.c
SRCS = $(addprefix $(SRCS_DIR)/, $(SRCS_NAME))
OBJS = $(SRCS:.c=.o)
 
 
MLX_NAME = mlx
MLX_DIR = ./mlx
MLX = $(addprefix $(MLX_DIR)/, libmlx.a)
 
 
$(NAME) : $(OBJS)
    $(MAKE) -C $(MLX_DIR) 
    $(CC) $(CFLAGS) -L$(MLX_DIR) -l$(MLX_NAME) \
           -framework OpenGL -framework AppKit $^ -o $@
 
$(SRCS_DIR)/%.o : $(SRCS_DIR)/%.c
    $(CC) $(CFLAGS) -I$(MLX_DIR) -c $< -o $@
 
 
all : $(NAME)
 
clean :
    $(MAKE) -C $(MLX_DIR) clean
    rm -rf $(OBJS)
 
fclean :
    $(MAKE) -C $(MLX_DIR) fclean
    rm -rf $(NAME) $(OBJS)
 
re : fclean all
 
bonus : all
 
.PHONY : all clean fclean re bonus