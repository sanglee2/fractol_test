NAME = a.out
LIBRARY = mlx/libmlx.a
BONUS_NAME = 
CC = cc
CFLAGS = -Wall -Wextra -Werror 
LDFLAGS = -lmlx -frmaework OpenGL -framework AppKit -lmlx
SRCS = main.c
SRCS_BONUS = 
OBJS_BONUS = $(SRCS_BONUS:.c=.o)
RM = rm
RMFLAGS = -f


all: $(NAME)

$(NAME): $(SRCS) $(LIBRARY)
	$(CC) $(CFLAGS) -c $< -o $@ $(LDFALGS)

$(LIBRARY):
	$(MAKE) -C mlx

clean:
	$(RM) $(RMFLAGS) main.o a.out 

fclean: 
	make clean
	$(RM) $(RMFLAGS) $(NAME) $(BONUS_NAME) 

re: 
	make fclean
	make all

.PHONY: all clean fclean re bonus
