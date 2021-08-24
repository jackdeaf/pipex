# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leng-chu <leng-chu@student.42kl.edu.m      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/19 17:33:24 by leng-chu          #+#    #+#              #
#    Updated: 2021/08/24 20:08:43 by leng-chu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= pipex.a
SRC		= ft_pipex.c ft_execute.c
#BONUS	=
CC		= gcc -Wall -Wextra -Werror
OBJ		= $(SRC:%.c=%.o)
OBJB	= $(BONUS:%.c=%.o)
RM		= rm -rf
LIBFT	:= libft
LIBFT_L	:= ./libft/libft.a

all:		libft $(NAME)

libft:
			@$(MAKE) -C $(LIBFT)

$(OBJ):		$(SRC)
			@$(CC) -I. -c $^

$(OBJB):	$(BONUS)
			@$(CC) -I. -c $^

$(NAME):	$(OBJ)
			cp $(LIBFT_L) $(NAME)
			ar rc $(NAME) $(OBJ)
			ranlib $@

bonus:		$(OBJ) $(OBJB)
			cp $(LIBFT_L) $(NAME)
			ar rc $(NAME) $(OBJ) $(OBJB)
			ranlib $@

clean:		
			make -C $(LIBFT) clean
			@$(RM) $(OBJ) $(OBJB)

fclean:		clean
			make -C $(LIBFT) fclean
			@$(RM) $(NAME)

re:			fclean all

.PHONY:	all clean fclean re bonus libft