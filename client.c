/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lstephen <lstephen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/11 18:07:57 by lstephen          #+#    #+#             */
/*   Updated: 2024/03/18 06:30:16 by darkwater        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	convert_char(char c, pid_t server_pid)
{
	int	count;

	count = 8;
	while (--count >= 0)
	{
		if (c >> count & 1)
			kill(server_pid, SIGUSR1);
		else
			kill(server_pid, SIGUSR2);
		usleep(100);
	}
}

void	send_string(char *str, pid_t server_pid)
{
	int	i;

	i = -1;
	while (str[++i] != 0)
		convert_char(str[i], server_pid);
	convert_char('\n', server_pid);
}

int	main(int argc, char *argv[])
{
	pid_t	server_pid;

	if (argc != 3)
	{
		write(2, "Wrong argument amount!\n", 23);
		exit(1);
	}
	server_pid = ft_atoi(argv[1]);
	send_string(argv[2], server_pid);
	return (0);
}
