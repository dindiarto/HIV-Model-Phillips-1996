
viral_load <- function(t, cells, params) {
  with(as.list(c(cells, params)), {
    dR_dt = (gamma * tau) - (mu * R) - (beta * V * R)
    
    dL_dt =  (rho * beta * V * R) - (mu * L) - (alpha * L)
    
    dE_dt = ((1 - rho) * beta * V * R) + (alpha * L) - (delta * E)
    
    dV_dt = (phi * E) - (sigma * V)
    
    return(list(c(dR_dt, dL_dt, dE_dt, dV_dt)))
    
  })
}

s_CD4_HIV_dynamics_solution <-
  ode(
    y = cells,
    times = t,
    func = viral_load,
    parms = params,
    method = "euler") %>%
  as.data.frame()