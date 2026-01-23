# Koordinatentransformation

library(terra)


get_crs <- function(obj){
  x <- crs(obj, describe=TRUE)  
  paste0(x$authority, ":", x$code)
}  

get_crs_long <- function(obj){
  x <- crs(obj, describe=TRUE)  
  paste0(x$name, " , ",x$authority, ":", x$code)
}  
  
crs_transform <- function(v,from_epsg, to_epsg){
  xy <- cbind(x=v[1],y=v[2]) 
  p   <- vect(xy, type = "point", crs = from_epsg)
  p_wgs <- project(p, to_epsg)
  p_wgs |> ext() -> eee
  c(xmin(eee),
    ymin(eee)
  )
}

aut2wgs <- function(v,v2=NULL){
  if(is.null(v2)){  
  } else {
    xy <- cbind(x=v,y=v2)  
  }
  p   <- vect(xy, type = "point", crs = "EPSG:31256")
  p_wgs <- project(p, "EPSG:4326")
  p_wgs |> ext() -> eee
  c(xmin(eee),
    ymin(eee)
  )
}


wgs2aut <- function(v,v2=NULL){
  if(is.null(v2)){  
    xy <- cbind(x=v[1],y=v[2]) 
  } else {
    xy <- cbind(x=v,y=v2)  
  }
  p   <- vect(xy, type = "point", crs = "EPSG:4326")
  p_wgs <- project(p, "EPSG:31256")
  p_wgs |> ext() -> eee
  c(xmin(eee),
    ymin(eee)
  )
}

flat_obj <- function(obj, val=1){
  obj |>
    values() |>
    (\(x)ifelse(is.na(x),NA,1))() ->
    vals
  xxx <- obj
  r_flat <- setValues(xxx,vals)
  r_flat  
}  

ext_kachel_from_google <- function(x,y,width,epsg){
  c(x,y) |>
  crs_transform("EPSG:4326",epsg) -> 
    xx
  x_min <- xx[1] - width/2
  x_max <- xx[1] + width/2
  y_min <- xx[2] - width/2
  y_max <- xx[2] + width/2
  ext(x_min,x_max,y_min,y_max)
}

point_to_rect <- function(p,x_size=1000,y_size=1000){
  my_crs <- get_crs(p)
  p_center <- 
    crds(p)
  p_center 
  rbind(
    p_center + c(-1/2,-1/2)*x_size,
    p_center + c(1/2,-1/2)*x_size,
    p_center + c(1/2,1/2)*x_size,
    p_center + c(-1/2,1/2)*x_size
    
  ) |>
    vect(type="polygons") ->
    xx
  crs(xx) <- get_crs(p)
  xx
}

get_border <- function(obj){
  flattened <- classify(r, cbind(-Inf, Inf, 1))      # everything = 1
  as.polygons(flattened, na.rm = TRUE) |>         # cell polygons[web:108]
    aggregate()                          # dissolve into one polygon[web:106]
}
