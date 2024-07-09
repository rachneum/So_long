/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   window.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rachou <rachou@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/21 17:06:21 by rachou            #+#    #+#             */
/*   Updated: 2024/07/09 17:40:25 by rachou           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../so_long.h"

void	init_win(t_data *game)
{
    game->mlx = mlx_init();//Initialise la connexion à la MiniLibX.
	if (!game->mlx)
		ft_error("ERROR\nThe connection with the MiniLibX has failed!\n");
	game->mlx_win = mlx_new_window(game->mlx, 600, 600, "so_long");
	if (!game->mlx_win)
		ft_error("ERROR\nThe creation of a new window has failed!\n");
	mlx_loop(game->mlx);
	return ;
}
