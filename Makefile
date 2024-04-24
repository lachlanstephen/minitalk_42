# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lstephen <lstephen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/11 17:46:00 by lstephen          #+#    #+#              #
#    Updated: 2024/03/18 06:24:33 by darkwater        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= .compiled

SERVER_NAME		= server

SERVER_SRC		= server.c

SERVER_OBJS		= $(SERVER_SRC:.c=.o)

CLIENT_NAME		= client

CLIENT_SRC		= client.c

CLIENT_OBJS		= $(CLIENT_SRC:.c=.o)

OBJ_OUTPUT		= .output

HEADER			= ./

LIBFT_NAME		= libft.a

LIBFT_DIR		= ./libft/

CC				= cc

CFLAGS			= -Wall -Wextra -Werror -Wpedantic

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ Colours  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ #

RED				= \033[0;31m

GREEN			= \033[0;32m

NC				= \033[0m

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ Messages ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ #

BEGIN_COMP		= echo "\n ~ ~ ~ $(GREEN)Compiling Objects$(NC) ~ ~ ~\n"

SERVER_COMP		= echo "\n ~ ~ ~ $(GREEN)Compiling Server$(NC) ~ ~ ~\n"

CLIENT_COMP		= echo "\n ~ ~ ~ $(GREEN)Compiling Client$(NC) ~ ~ ~\n"

CLEAN_MSG		= echo "\n ~ ~ ~ $(RED)Cleaning all object files$(NC) ~ ~ ~\n"

FCLEAN_MSG		= echo "\n ~ ~ ~ $(RED)Removing Programs$(NC) ~ ~ ~\n"

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ Rules ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ #

all: $(NAME)

$(NAME): $(LIBFT_NAME) $(OBJ_OUTPUT) $(SERVER_NAME) $(CLIENT_NAME)
	@touch $(NAME)

$(SERVER_NAME): $(SERVER_OBJS) $(CLIENT_OBJS)
	@$(SERVER_COMP)
	$(CC) $(CFLAGS) $(SERVER_OBJS) -L$(LIBFT_DIR) -lft -o $(SERVER_NAME)

$(CLIENT_NAME): $(CLIENT_OBJS)
	@$(CLIENT_COMP)
	$(CC) $(CFLAGS) $(CLIENT_OBJS) -L$(LIBFT_DIR) -lft -o $(CLIENT_NAME)

$(OBJ_OUTPUT):
	@$(BEGIN_COMP)
	@touch $(OBJ_OUTPUT)

%.o: %.c
	$(CC) $(CFLAGS) -c -I $(HEADER) $< -o $@

$(LIBFT_NAME):
	$(MAKE) -C $(LIBFT_DIR)

clean:
	@$(CLEAN_MSG)
	rm -f $(OBJ_OUTPUT) $(SERVER_OBJS) $(CLIENT_OBJS)

fclean: clean
	@$(FCLEAN_MSG)
	$(MAKE) fclean -C $(LIBFT_DIR)
	rm -f $(SERVER_NAME) $(CLIENT_NAME) $(NAME)

re: fclean all

.PHONY: all clean fclean re
