# convert solution to a dataframe
s_CD4_HIV_dynamics_solution <- as.data.frame(s_CD4_HIV_dynamics_solution)

# Number of virus particles in the bloodstream
Vplot <-  ggplot(s_CD4_HIV_dynamics_solution) +
  geom_line(aes(time, V), color = "red") + 
  theme_classic() +
  scale_y_continuous(trans = "log10") +
  annotation_logticks(sides = "l") +
  scale_x_continuous(breaks = scales::pretty_breaks(n = 7)) +
  xlab("Days from infection") +
  ylab("Number of virus particles (V)") +
  coord_cartesian(ylim = c(0.1, 1e4))


LEplot <- ggplot(s_CD4_HIV_dynamics_solution) +
  geom_line(aes(time, L, color = "L" )) +
  geom_line(aes(time, E, color = "E")) +
  theme_classic() +
  scale_y_continuous(trans = "log10") +
  coord_cartesian(ylim = c(0.1, 100)) +
  scale_x_continuous(breaks = scales::pretty_breaks(n = 7)) +
  annotation_logticks(sides = "l") +
  labs(x = "Days from infection",
       y = "L and E",
       color = NULL) +
  scale_color_manual(values = c("E" = "darkorange", "L" = "blue"))+ 
  theme(legend.position = c(0.8, 0.8), legend.key.size = unit(2,"line")) 

Rplot <- ggplot(s_CD4_HIV_dynamics_solution) +
  geom_line(aes(time, R), color = "darkgreen") +
  theme_classic()+
  scale_x_continuous(breaks = scales::pretty_breaks(n = 7)) +
  labs(x = "Days from infection",
       y = "Number of susceptible cells (R)")
