Rplot <- s_CD4_HIV_dynamics_solution %>% 
  ggplot() +
  geom_line(aes(time, R), color = "purple") + theme_bw() +
  scale_y_log10()


VLEplot <- s_CD4_HIV_dynamics_solution %>% 
  ggplot() +
  geom_line(aes(time, L), color = "blue")+ 
  geom_line(aes(time, V), color = "red")+
  geom_line(aes(time, E), color = "darkgreen")+
  theme_bw()+
  scale_y_log10()