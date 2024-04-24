/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lstephen <lstephen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/11 18:18:11 by lstephen          #+#    #+#             */
/*   Updated: 2024/03/18 06:27:22 by darkwater        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int	g_count;

void	build_char(int sig_num)
{
	static char	c;

	g_count--;
	if (sig_num == SIGUSR1)
		c = 1 << g_count | c;
	if (g_count == 0)
	{
		write(1, &c, 1);
		g_count = 8;
		c = '\0';
	}
}

int	main(void)
{
	pid_t	my_pid;

	my_pid = getpid();
	g_count = 8;
	ft_printf("%d\n", my_pid);
	signal(SIGUSR1, build_char);
	signal(SIGUSR2, build_char);
	while (true)
		pause();
	return (0);
}
