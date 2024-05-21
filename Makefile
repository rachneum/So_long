NAME = so_long

OBJS = ${SRC:.c=.o}
CC = gcc
CFLAGS = -Wall -Werror -Wextra
RM = rm -f
INCLUDES = -I/opt/X11/include -Imlx

SRC =	src/main.c \
		src/map/map_checker.c \
		src/map/map_parsing.c \
		src/map/map_utils.c \
		src/game/player.c \
		src/utils/utils.c \
		get_next_line/get_next_line.c \
		get_next_line/get_next_line_utils.c

MLX_FLAGS = -Lmlx -lmlx -L/usr/X11/lib -lXext -lX11 -framework OpenGL -framework AppKit
MLX_LIB = $(MLX_DIR)/libmlx_$(UNAME).a

# Indique comment générer un fichier objet ('.o') à partir d'un fichier source C ('.c').
# Elle utilise les variables '$(CC)' pour le compilateur et '$(CFLAGS)' pour les options de compilation.
# '&@' représente le nom de la cible (le fichier objet) et '$<' représente le premier prérequis (le fichier source).
.c.o:
	$(CC) $(CFLAGS) -c -o $@ $< $(INCLUDES)

# Règle qui spécifie comment construire l'exécutable final ('$(NAME)') à partir des fichiers objets ($(OBJS)).
# Elle utilise également les options de compilation ($(CFLAGS)) et les options de liaison spécifiques à MLX ($(MLX_FLAGS)).
$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(MLX_FLAGS)

all: ${NAME}

clean:
	${RM} ${OBJS}

fclean: clean
	${RM} ${NAME}

re: fclean all

.PHONY: all clean fclean re